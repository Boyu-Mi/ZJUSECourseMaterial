#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <map>
using namespace std;

#define _my_tar_mem register_file[(current<<6)>>27]+((current<<16)>>16)
#define _my_rs register_file[(current<<6)>>27]
#define _my_rt register_file[(current<<11)>>27]
#define _my_rd register_file[(current<<16)>>27]
#define _my_dat ((current<<16)>>16)

char *disAssembler(int machine_code);
void regPlot(char *source, int reg);
void update_active_memory(int affected);
unsigned int to_little_endian(unsigned int origin);
void push_low(unsigned int *position, unsigned int data);
void push_high(unsigned int *position, unsigned int data);
map<string, int> label;

char g_string[128];
char binaryString[33];
char registers[32][6] = {\
    "$zero", "$at", "$v0", "$v1", "$a0", "$a1", "$a2", "$a3", \
    "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", \
    "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7", \
    "$t8", "$t9", "$k0", "$k1", "$gp", "$sp", "$fp", "$ra", \
};
char *rs, *rt, *rd, *rc;
int sa, dat, dot, ofs, adr, mcd;

#define memMax 0xFFFF

// global variables
unsigned int register_file[32];     // register file
unsigned int memory[memMax + 1];      // memory
unsigned int *memory_dt;                       // memory for data storage
unsigned int *memory_io;                       // memory for i/o and graphics
unsigned int *memory_pg;                       // memory for program use
unsigned int proCnt = 0;                  // program counter, by word, i.e. 32 bits
unsigned int memInd[2] = {0, 1};    // active memory
unsigned int binaryTemp;
unsigned int machineCode;

void printReg();
void printHex();
void printIns();
void importAssembly();
void stepIn();
void registerPlot(char *name, int offset);
unsigned int registerPlotGen(char *name);
unsigned int data_push(unsigned int ori, int data, int dig, int pos);

int main() {
	memory_dt = memory;
	memory_io = memory + 0x4000;
	memory_pg = memory + 0x8000;
	load();
	int mode;
	while (1) {
		printf("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");
		printf("<R> View Registers,\t\t<D> View Memory As Hex,\t\t<U> View Memory As Instruction,\n");
		printf("<A> Write Assembly,\t\t<T> Step In Instruction,\t<P> Modify PC,\t\t<Q> Quit.\n");
		printf("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");
		printf("Ready. PC=0x%x >>>",proCnt);
		mode = getchar();
		fflush(stdin);
		switch (mode) {
			case 'Q':
				return 0;
			case 'R':
				printReg();
				break;
			case 'D':
				printHex();
				break;
			case 'U':
				printIns();
				break;
			case 'A':
				importAssembly();
				break;
			case 'T':
				stepIn();
				break;
			case 'P':
				printf("New PC = 0x");
				scanf("%x", &proCnt);
				fflush(stdin);
				break;
		}
	}
}

void printReg() {
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 4; j++) {
			if (i != 0 && j == 0) {
				putchar(' ');
				putchar(' ');
			}
			printf("%s= 0x%08X   ", registers[4 * i + j], register_file[4 * i + j]);
		}
		putchar('\n');
	}
}

void printHex() {
	if (memInd[0] >= memInd[1]) {
		printf("\nMemory Inactive. Import Assembly First.\n\n");
	} else {
		printf("MEMORY AS INTEGERS\nAddress\t\tBinary\t\t\t\t\t\t\t\tHex\n");
		for (unsigned int i = memInd[0]; i < memInd[1]; i++) {
			binaryString[32] = '\0';
			binaryTemp = memory[i];
			for (int ii = 31; ii >= 0; ii--) {
				binaryString[ii] = binaryTemp & 0x00000001 ? '1' : '0';
				binaryTemp = binaryTemp >> 1;
			}
			printf("0x%04X\t\t%s\t0x%08X\n", i, binaryString, memory[i]);
		}
	}
}

void load(){
	ifstream file;
	file.open("inst.txt");
	string str = "";
	int i = 0;
	vector<string> myinst;
	while (getline(file, str)) {
		if (str != "") {
			vector<string> v = split(str);
			if (v.size() == 1 and v[0][v[0].length()-1] != ':') {
				cout << v[0] << endl;
				string err = "";
				for (int i = 0; i < v[0].length(); ++i) {
					err.append("~");
				}
				err += "^";
				cout << err << endl;
				printf("ERROR: some registers are missed here\n");
				//cout << '~' * (v[0].length()) <<
				return true;
			}
			else if (v.size() == 2 && (v[0] != "J" && v[0] != "j")) {
				cout << v[0] << " $" << v[1] << endl;
				string err = "";
				for (int i = 0; i < v[0].length() + v[1].length() + 1; ++i) {
					err.append("~");
				}
				err += "^";
				cout << err << endl;
				printf("ERROR: some registers are missed here\n");
				//cout << '~' * (v[0].length()) <<
				return true;
			}
			else if (v.size() == 3) {
				cout << v[0] << " $" << v[1] << ", $" << v[2] << endl;
				string err = "";
				for (int i = 0; i < v[0].length() + v[1].length() + v[2].length() + 5; ++i) {
					err.append("~");
				}
				err += "^";
				cout << err << endl;
				printf("ERROR: a register is missed here\n");
				//cout << '~' * (v[0].length()) <<
				return true;
			}
			if (v.size()) {
				string tmp = v[0];
				if (tmp[tmp.length() - 1] == ':') {
					label[tmp.substr(0,tmp.length()-1)] = i;
					if (v.size() == 1)
						continue;
					else {
						string tmpin = "";
						for (int i = 1; i < v.size(); i++) {
							tmpin = tmpin + v[i] + " ";
						}
						i++;
						myinst.push_back(tmpin);
					}
				}
				else {
					i++;
					myinst.push_back(str);
				}
			}
		}
	}
	for (i = 0; i < myinst.size(); i++) {
		proCnt = i;
		memory[i] = importAssembly(myinst[i]);
	}
	size = myinst.size();
	proCnt = 0;
	return false;
}

void printIns() {
	if (memInd[0] >= memInd[1]) {
		printf("\nMemory Inactive. Import Assembly First.\n\n");
	} else {
		printf("MEMORY AS INSTRUCTIONS\nAddress\t\tHex\t\t\t\tInstruction\n");
		for (unsigned int i = memInd[0]; i < memInd[1]; i++) {
			printf("0x%04X\t\t0x%08X\t\t%s\n", i, memory[i], disAssembler(memory[i]));
		}
	}
}

void importAssembly(string inst) {
	proCnt = 0;
	g_string = inst.c_str();
	if (!strcmp(g_string, "end\n")) {
	}
	char *insName = strtok(g_string, " ");
	if (!strcmp(insName, "lhx")) {
		machineCode = 0x80000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "lh")) {
		machineCode = 0x84000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "lwx")) {
		machineCode = 0x88000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "lw")) {
		machineCode = 0x8C000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "lhux")) {
		machineCode = 0x90000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "lhu")) {
		machineCode = 0x94000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "shx")) {
		machineCode = 0xA0000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "sh")) {
		machineCode = 0xA4000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "swx")) {
		machineCode = 0xA8000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "sw")) {
		machineCode = 0xAC000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	} else if (!strcmp(insName, "add")) {
		machineCode = 0x00000020;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "sub")) {
		machineCode = 0x00000022;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "and")) {
		machineCode = 0x00000024;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "or")) {
		machineCode = 0x00000025;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "xor")) {
		machineCode = 0x00000026;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "slt")) {
		machineCode = 0x0000002A;
		registerPlot(strtok(nullptr, ","), 16);
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
	} else if (!strcmp(insName, "addi")) {
		machineCode = 0x20000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 6);
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, ","), "%d", &datTemp);
		data_push(machineCode, datTemp, 16, 16);
	} else if (!strcmp(insName, "sw")) {
		machineCode = 0xAC000000;
		int datTemp;
		registerPlot(strtok(nullptr, ","), 11);
		sscanf(strtok(nullptr, "("), "%d", &datTemp);
		machineCode = data_push(machineCode, datTemp, 16, 16);
		registerPlot(strtok(nullptr, ")"), 6);
	}
	return machineCode;
}

void stepIn() {
	// 线性步进执行冯模型的模拟机
	unsigned int current = memory[proCnt];
	switch (current >> 26) {
		case 0: // 调用ALU的算术运算指令
			switch ((current << 26) >> 26) {
				case 32:    // add
					_my_rd = _my_rs + _my_rt;
					break;
				case 34:    // sub
					_my_rd = _my_rs - _my_rt;
					break;
				case 36:    // and
					_my_rd = _my_rs & _my_rt;
					break;
				case 37:    // or
					_my_rd = _my_rs | _my_rt;
					break;
				case 38:    // xor
					_my_rd = _my_rs ^ _my_rt;
					break;
				case 42:    // xor
					_my_rd = _my_rs < _my_rt ? 1 : 0;
					break;
			}
		case 8:
			_my_rt = _my_rs + _my_dat;
			break;
		case 32:    // LHx
			push_low(&_my_rt, to_little_endian(memory[_my_tar_mem]) << 16 >> 16);
			break;
		case 33:	// LH
			push_low(&_my_rt, memory[_my_tar_mem] << 16 >> 16);
			break;
		case 34:	// LWx
			_my_rt = to_little_endian(static_cast<unsigned int>(static_cast<int>(memory[_my_tar_mem]) << 16 >> 16));
			break;
		case 35:	// LW
			_my_rt = static_cast<unsigned int>(static_cast<int>(memory[_my_tar_mem]) << 16 >> 16);
			break;
		case 36:	// LHux
			push_low(&_my_rt, to_little_endian(static_cast<unsigned int>(static_cast<int>(memory[_my_tar_mem]) << 16 >> 16)));
			break;
		case 37:	// LHu
			push_low(&_my_rt, static_cast<unsigned int>(static_cast<int>(memory[_my_tar_mem]) << 16 >> 16));
			break;
		case 40:	// SHx
			push_low(memory+_my_tar_mem, to_little_endian(static_cast<unsigned int>(static_cast<int>(_my_rt) << 16 >> 16)));
			update_active_memory(_my_tar_mem);
			break;
		case 41:	// SH
			push_low(memory+_my_tar_mem, ((_my_rt) << 16 >> 16));
			update_active_memory(_my_tar_mem);
			break;
		case 42:	// SWx
			memory[_my_tar_mem] = to_little_endian(_my_rt);
			update_active_memory(_my_tar_mem);
			break;
		case 43:	// SW
			memory[_my_tar_mem] = _my_rt;
			update_active_memory(_my_tar_mem);
			break;
	}
	proCnt++;
	if (proCnt > memInd[1]) {
		printf("Out of Active Memory!\n");
	}
}


void registerPlot(char *name, int offset) {
	unsigned int number;
	if (name[1] >= '0' && name[1] <= '9') {
		sscanf(name + 1, "%d", &number);
	} else {
		number = registerPlotGen(name);
	}
	machineCode = data_push(machineCode, number, 5, offset);
}


unsigned int registerPlotGen(char *name) {   // input should be like "$zero"
	switch (name[1]) {
		case 'z':
			return 0;
		case 'a':
			if (name[2] == 't') {
				return 1;
			} else {
				return static_cast<unsigned int>(name[2] - '0' + 4);
			}
		case 'v':
			return static_cast<unsigned int>(name[2] - '0' + 2);
		case 't':
			if (name[2] <= '7') {
				return static_cast<unsigned int>(name[2] - '0' + 8);
			} else {
				return static_cast<unsigned int>(name[2] - '8' + 24);
			}
		case 's':
			if (name[2] == 'p') {
				return 29;
			} else {
				return static_cast<unsigned int>(name[2] - '0' + 16);
			}
		case 'k':
			return static_cast<unsigned int>(name[2] - '0' + 26);
		case 'g':
			return 2;
		case 'f':
			return 30;
		case 'r':
			return 31;
		default:                // invalid register name
			return static_cast<unsigned int>(-1);
	}
}

unsigned int data_push(unsigned int ori, int data, int dig, int pos) {
	unsigned int format = 1;
	for (int i = 1; i < dig; i++) {
		format = format << 1;
		format += 1;
	}
	ori = ori & (~(format << (32 - pos - dig)));
	format = format & data;
	format = format << (32 - pos - dig);
	return ori | format;
}

char *disAssembler(int machine_code) {
	g_string[0] = '\0';
	int opcode = (machine_code >> 26) & 63;
	if (opcode == 0) {    // R-type instructions
		int func = machine_code & 63;
		switch (func) {
			case 32:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "add %s,%s,%s", rd, rs, rt);
				break;
			case 34:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "sub %s,%s,%s", rd, rs, rt);
				break;
			case 42:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "slt %s,%s,%s", rd, rs, rt);
				break;
			case 43:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "sltu %s,%s,%s", rd, rs, rt);
				break;
			case 36:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "and %s,%s,%s", rd, rs, rt);
				break;
			case 37:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "or %s,%s,%s", rd, rs, rt);
				break;
			case 38:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "xor %s,%s,%s", rd, rs, rt);
				break;
			case 39:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "nor %s,%s,%s", rd, rs, rt);
				break;
			case 0:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				sa = (((machine_code >> 6) & 31) << 27) >> 27;
				sprintf(g_string, "sll %s,%s,%d", rd, rs, sa);
				break;
			case 4:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "sllv %s,%s,%s", rd, rs, rt);
				break;
			case 2:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				sa = (((machine_code >> 6) & 31) << 27) >> 27;
				sprintf(g_string, "srl %s,%s,%d", rd, rs, sa);
				break;
			case 6:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "srlv %s,%s,%s", rd, rs, rt);
				break;
			case 3:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				sa = (((machine_code >> 6) & 31) << 27) >> 27;
				sprintf(g_string, "sra %s,%s,%d", rd, rs, sa);
				break;
			case 7:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "srav %s,%s,%s", rd, rs, rt);
				break;
			case 8:
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "jr %s", rs);
				break;
			case 9:
				rs = registers[(machine_code >> 21) & 31];
				rd = registers[(machine_code >> 11) & 31];
				sprintf(g_string, "jalr %s,%s", rs, rd);
				break;
			case 12:
				sprintf(g_string, "syscall");
				break;
			case 24:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "mult %s,%s", rs, rt);
				break;
			case 25:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "multu %s,%s", rs, rt);
				break;
			case 26:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "div %s,%s", rs, rt);
				break;
			case 27:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "divu %s,%s", rs, rt);
				break;
			case 16:
				rd = registers[(machine_code >> 11) & 31];
				sprintf(g_string, "mfhi %s", rd);
				break;
			case 18:
				rd = registers[(machine_code >> 11) & 31];
				sprintf(g_string, "mflo %s", rd);
				break;
			case 17:
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "mthi %s", rs);
				break;
			case 19:
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "mtlo %s", rs);
				break;
		}
	} else {
		switch (opcode) {
			case 16:
				switch (machine_code >> 21) {
					case 16:
						sprintf(g_string, "eret");
						break;
					case 4:
						rc = registers[(machine_code >> 11) & 31];
						rt = registers[(machine_code >> 16) & 31];
						sprintf(g_string, "mtc0 %s,%s", rt, rc);
						break;
					case 0:
						rc = registers[(machine_code >> 11) & 31];
						rt = registers[(machine_code >> 16) & 31];
						sprintf(g_string, "mfc0 %s,%s", rt, rc);
						break;
				}
			case 15:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "lui %s,%d", rt, dat);
				break;
			case 8:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "addi %s,%s,%d", rt, rs, dat);
				break;
			case 10:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "slti %s,%s,%d", rt, rs, dat);
				break;
			case 11:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dat = machine_code & 65535;
				sprintf(g_string, "sltiu %s,%s,%d", rt, rs, dat);
				break;
			case 12:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dot = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "andi %s,%s,%d", rt, rs, dot);
				break;
			case 13:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dot = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "ori %s,%s,%d", rt, rs, dot);
				break;
			case 14:
				rt = registers[(machine_code >> 16) & 31];
				rs = registers[(machine_code >> 21) & 31];
				dot = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "xori %s,%s,%d", rt, rs, dot);
				break;
			case 35:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lw %s,%d(%s)", rt, dat, rs);
				break;
			case 34:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lwx %s,%d(%s)", rt, dat, rs);
				break;
			case 33:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lh %s,%d(%s)", rt, dat, rs);
				break;
			case 32:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lhx %s,%d(%s)", rt, dat, rs);
				break;
			case 37:
				rt = registers[(machine_code >> 16) & 31];
				dat = machine_code & 65535;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lhu %s,%d(%s)", rt, dat, rs);
				break;
			case 36:
				rt = registers[(machine_code >> 16) & 31];
				dat = machine_code & 65535;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "lhux %s,%d(%s)", rt, dat, rs);
				break;
			case 43:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "sw %s,%d(%s)", rt, dat, rs);
				break;
			case 42:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "swx %s,%d(%s)", rt, dat, rs);
				break;
			case 41:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "sh %s,%d(%s)", rt, dat, rs);
				break;
			case 40:
				rt = registers[(machine_code >> 16) & 31];
				dat = ((machine_code & 65535) << 16) >> 16;
				rs = registers[(machine_code >> 21) & 31];
				sprintf(g_string, "shx %s,%d(%s)", rt, dat, rs);
				break;
			case 4:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				ofs = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "beg %s,%s,%d", rs, rt, ofs);
				break;
			case 5:
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				ofs = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "bne %s,%s,%d", rs, rt, ofs);
				break;
			case 1:
				rs = registers[(machine_code >> 21) & 31];
				ofs = ((machine_code & 65535) << 16) >> 16;
				sprintf(g_string, "bgezal %s,%d", rs, ofs);
				break;
			case 2:
				sprintf(g_string, "jadr");
				break;
			case 3:
				adr = machine_code & 67108863;
				sprintf(g_string, "jal %d", adr);
				break;
			case 28:
				rd = registers[(machine_code >> 11) & 31];
				rs = registers[(machine_code >> 21) & 31];
				rt = registers[(machine_code >> 16) & 31];
				sprintf(g_string, "mul %s,%s,%s", rd, rs, rt);
				break;
		}
	}
	return g_string;
}

void update_active_memory(int affected) { // input the affected memory location and then update active memory range
	if (memInd[0] > affected) {
		memInd[0] = affected;
	} else if (memInd[1] < affected) {
		memInd[1] = affected;
	}
}

unsigned int to_little_endian(unsigned int origin) {
	unsigned int src = origin;
	unsigned int ter = 0;
	unsigned char *p_src = reinterpret_cast<unsigned char *>(&src);
	unsigned char *p_ter = reinterpret_cast<unsigned char *>(&ter) + 3;
	for (int i = 0; i < 4; i++) {
		*p_ter = *p_src;
		p_ter--;
		p_src++;
	}
	return ter;
}

void push_low(unsigned int *position, unsigned int data){
	unsigned int _data = data;
	unsigned int *_position = position;
	unsigned char *p_pos = reinterpret_cast<unsigned char*>(_position) + 1;
	unsigned char *p_dat = reinterpret_cast<unsigned char*>(&(_data)) + 1;
	*p_pos = *p_dat;
}

void push_high(unsigned int *position, unsigned int data){
	unsigned int _data = data;
	unsigned int *_position = position;
	unsigned char *p_pos = reinterpret_cast<unsigned char*>(_position) + 1;
	unsigned char *p_dat = reinterpret_cast<unsigned char*>(&(_data)) + 1;
	*p_pos = *p_dat;
}