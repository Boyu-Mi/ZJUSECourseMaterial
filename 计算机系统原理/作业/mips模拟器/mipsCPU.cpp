#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <string>
#include <cstdio>
#include <iomanip>
#include <map>
#include <vector>
#include <fstream>
using namespace std;

unsigned int result = 0;
bool endian;
class Rgf {
public:
	int length = 32;
};

vector<string> split(string s) {
	int i = 0;
	vector<string> v;
	while (i < s.length()) {
		string tmp = "";
		while (i < s.length() && s[i] != ' ' && s[i] != ',' && s[i] != '(' && s[i] != ')')
			tmp += s[i++];
		while (i < s.length() && (s[i] == ' ' || s[i] == ',' || s[i] == '$' || s[i] == '(' || s[i] == ')'))
			i++;
		v.push_back(tmp);
	}
	return v;
}

string lower(string s) {
	for (int i = 0; i < s.length(); i++)
		if (s[i] >= 'A' && s[i] <= 'Z') {
			s[i] = s[i] - 'A' + 'a';
		}
	return s;
}

class MipsCPU {
public:
	const int MAXSIZE = 4096;
	int PC, IR;
	int *Rgf;
	int *memory;
	map<string, int> rgf;
	map<int, const char*> num2rgf;
	map<string, int> label;
	int size;
	MipsCPU() {
		size = 0;
		memory = new int[MAXSIZE];
		Rgf = new int[32];
		for (int i = 0; i < 32; i++)
			Rgf[i] = 0;
		//memset(Rgf, 0, sizeof(Rgf));
		PC = 0;
		rgf["zero"] = 0;
		rgf["at"] = 1;
		rgf["v0"] = 2;
		rgf["v1"] = 3;
		rgf["a0"] = 4;
		rgf["a1"] = 5;
		rgf["a2"] = 6;
		rgf["a3"] = 7;
		rgf["t0"] = 8;
		rgf["t1"] = 9;
		rgf["t2"] = 10;
		rgf["t3"] = 11;
		rgf["t4"] = 12;
		rgf["t5"] = 13;
		rgf["t6"] = 14;
		rgf["t7"] = 15;
		rgf["t8"] = 24;
		rgf["t9"] = 25;
		rgf["s0"] = 16;
		rgf["s1"] = 17;
		rgf["s2"] = 18;
		rgf["s3"] = 19;
		rgf["s4"] = 20;
		rgf["s5"] = 21;
		rgf["s6"] = 22;
		rgf["s7"] = 23;
		rgf["k0"] = 26;
		rgf["k1"] = 27;
		rgf["gp"] = 28;
		rgf["sp"] = 29;
		rgf["fp"] = 30;
		rgf["ra"] = 31;
		num2rgf[0] = "$zero";
		num2rgf[1] = "$at";
		num2rgf[2] = "$v0" ;
		num2rgf[3] = "$v1" ;
		num2rgf[4] = "$a0" ;
		num2rgf[5] = "$a1" ;
		num2rgf[6] = "$a2" ;
		num2rgf[7] = "$a3";
		num2rgf[8] = "$t0";
		num2rgf[9] = "$t1";
		num2rgf[10] = "$t2";
		num2rgf[11] = "$t3";
		num2rgf[12] = "$t4";
		num2rgf[13] = "$t5";
		num2rgf[14] = "$t6";
		num2rgf[15] = "$t7";
		num2rgf[24] = "$t8";
		num2rgf[25] = "$t9";
		num2rgf[16] = "$s0";
		num2rgf[17] = "$s1";
		num2rgf[18] = "$s2";
		num2rgf[19] = "$s3";
		num2rgf[20] = "$s4";
		num2rgf[21] = "$s5";
		num2rgf[22] = "$s6";
		num2rgf[23] = "$s7";
		num2rgf[26] = "$k0";
		num2rgf[27] = "$k1";
		num2rgf[28] = "$gp";
		num2rgf[29] = "$sp";
		num2rgf[30] = "$fp";
		num2rgf[31] = "$ra";
	}

	int reg2num(string s) {
		if (rgf.find(s) != rgf.end())
			return rgf[s];
		else return -1;
	}

	int str2num(string s) {
		if (label.find(s) != label.end()) {
			return label[s];
		}
		else {
			char *tmp = new char[s.length()];
			int i;
			for (i = 0; i < s.length(); i++)
				tmp[i] = s[i];
			tmp[i] = '\0';
			return atoi(tmp);
		}
	}

	int unasm(string in) {
		vector<string> v = split(in);
		string inst = lower(v[0]);
		int ir = 0;
		if (inst == "add") {
			ir = (0 << 26) | (32 & 63) | (reg2num(v[1]) << 11) | (reg2num(v[2]) << 21) | (reg2num(v[3]) << 16);
		}
		else if (inst == "and") {
			ir = (0 << 26) | (36 & 63) | (reg2num(v[1]) << 11) | (reg2num(v[2]) << 21) | (reg2num(v[3]) << 16);
		}
		else if (inst == "or") {
			ir = (0 << 26) | (37 & 63) | (reg2num(v[1]) << 11) | (reg2num(v[2]) << 21) | (reg2num(v[3]) << 16);
		}
		else if (inst == "addi") {
			ir = (8 << 26) | (reg2num(v[1]) << 16) | (reg2num(v[2]) << 21) | (str2num(v[3]) & 0xFFFF);
		}
		else if (inst == "sub") {
			ir = (0 << 26) | (34 & 63) | (reg2num(v[1]) << 11) | (reg2num(v[2]) << 21) | (reg2num(v[3]) << 16);
		}
		else if (inst == "lw") {
			ir = (35 << 26) | (reg2num(v[1]) << 16) | (reg2num(v[3]) << 21) | (str2num(v[2]) & 0xFFFF);
		}
		else if (inst == "sw") {
			ir = (43 << 26) | (reg2num(v[1]) << 16) | (reg2num(v[3]) << 21) | (str2num(v[2]) & 0xFFFF);
		}
		else if (inst == "beq") {
			ir = (4 << 26) | (reg2num(v[1]) << 21) | (reg2num(v[2]) << 16) | (((str2num(v[3]) - PC - 1)) & 0xFFFF);
		}
		else if (inst == "j") {
			ir = (2 << 26) | ((str2num(v[1])) & 0x3FFFFFF);
		}
		else {
			cerr << inst << ": No such a instruction!" << endl;
			ir = -1;
		}
		return ir;
	}

	bool load() {
		ifstream file;
		file.open("./inst.txt");
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
			PC = i;
			memory[i] = unasm(myinst[i]);
		}
		size = myinst.size();
		PC = 0;
		return false;
	}

	void disp() {
		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 4; j++)
				cout  <<  setw(5) << setfill(' ') << num2rgf[4 * i + j]<< " = "
				<< hex << setw(8) << setfill('0') << Rgf[4 * i + j] << " ";
				//printf("$%s = %08X ", num2rgf[8 * i + j], Rgf[8 * i + j]);
			cout << endl;
		}
	}
	
	void disp_inst() {
		int op, rs, rt, rd, ofs, fun, dat;
		char* mstr = new char[50];
		for (int i = 0; i < size; i++) {
			IR = memory[i];
			op = (IR >> 26) & 63;
			rs = (IR >> 21) & 31;
			rt = (IR >> 16) & 31;
			rd = (IR >> 11) & 31;
			fun = IR & 63;
			ofs = (short)(IR & 0xFFFF);
			switch (op) {
			case 0:
				switch (fun) {
				case 32:
					sprintf(mstr, "ADD\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
					break;
				case 34:
					sprintf(mstr, "SUB\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
					break;
				case 36:
					sprintf(mstr, "AND\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
					break;
				case 37:
					sprintf(mstr, "OR\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
					break;
				}
				break;
			case 8:
				sprintf(mstr, "ADDi\t%s, %s, %d", num2rgf[rt], num2rgf[rs], ofs);
				break;
			case 35:
				sprintf(mstr, "LW\t%s, %d(%s)", num2rgf[rt], ofs, num2rgf[rs]);
				break;
			case 43:
				sprintf(mstr, "SW\t%s, %d(%s)", num2rgf[rt], ofs, num2rgf[rs]);
				break;
			case 4:
				sprintf(mstr, "BEQ\t%s, %s, %d", num2rgf[rt], num2rgf[rs], ofs);
				break;
			case 2:
				sprintf(mstr, "J\t%d", (IR & (0x3FFFFFF)));
				break;
			default:
				sprintf(mstr, "ERROR: %s", IR);
				break;
			}
			printf("%04X:", i);
			printf("0x%08X\t%s\n", IR, mstr);
		}

	}


	void disp_num(int mode,int num) {//mode == 1
		if(mode)
			printf("%02X %02X %02X %02X ", (num & 0xFF), (num>>8 & 0xFF), (num>>16 & 0xFF), (num>>24 & 0xFF));
		else {
			printf("%02X %02X %02X %02X ", (num>>24 & 0xFF), (num >> 16 & 0xFF), (num >> 8 & 0xFF), (num & 0xFF));
		}

	}

	void disp_memo() {
		int i, j, k = 0;
		for (; k<size;) {
			for (j = 0; j < 2; j++) {
				disp_num(1, memory[k++]);
			}
			cout << endl;
		}
	}
        
	void exec(int mode) {//mode == 0: check only
		int op, rs, rt, rd, ofs, fun, dat;
		char* mstr = new char[50];
		IR = memory[PC];
		PC += 1;
		op = (IR >> 26) & 63;
		rs = (IR >> 21) & 31;
		rt = (IR >> 16) & 31;
		rd = (IR >> 11) & 31;
		fun = IR & 63;
		ofs = (short)(IR & 0xFFFF);
		auto sa = Rgf[(IR<<21)>>27];
		switch (op) {
		case 0:
			switch (fun) {
			case 0:
				if(mode) Rgf[rd] = Rgf[rs] << sa;
				sprintf(mstr, "SLL\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 2:
				if(mode) Rgf[rd] = Rgf[rs] >> sa;
				sprintf(mstr, "SRL\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 3:
				if(mode) Rgf[rd] = Rgf[rs] >> sa;
				sprintf(mstr, "SRA\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 4:
				if(mode) Rgf[rd] = Rgf[rs] << sa;
				sprintf(mstr, "SLLV\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 6:
				if(mode) Rgf[rd] = Rgf[rs] >> sa;
				sprintf(mstr, "SRLV\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 7:
				if(mode) Rgf[rd] = Rgf[rs] >> sa;
				sprintf(mstr, "SRAV\t%s, %s, %d", num2rgf[rd], num2rgf[rs], sa);
				break;
			case 8:
				if(mode) PC = Rgf[rs];
				sprintf(mstr, "Jr\t%s", num2rgf[rs]);
			case 9:
				if(mode){
					Rgf[rd] = PC;
					PC = Rgf[rs];
				}
				sprintf(mstr, "Jalr %s, %s", num2rgf[rs], num2rgf[rd]);
			case 32:
				if(mode) Rgf[rd] = Rgf[rs] + Rgf[rt];
				sprintf(mstr, "ADD\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 34:
				if (mode) Rgf[rd] = Rgf[rs] - Rgf[rt];
				sprintf(mstr, "SUB\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 36:
				if (mode) Rgf[rd] = Rgf[rs] & Rgf[rt];
				sprintf(mstr, "AND\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 37:
				if (mode) Rgf[rd] = Rgf[rs] | Rgf[rt];
				sprintf(mstr, "OR\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 38:
				if (mode) Rgf[rd] = Rgf[rs] ^ Rgf[rt];
				sprintf(mstr, "XOR\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 39:
				if (mode) Rgf[rd] = !(Rgf[rs] | Rgf[rt]);
				sprintf(mstr, "NOR\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 42:
				if (mode) Rgf[rd] = (Rgf[rs] < Rgf[rt]);
				sprintf(mstr, "SLT\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			case 43:
				if (mode) Rgf[rd] = ((unsigned int)Rgf[rs] < (unsigned int)Rgf[rt]);
				sprintf(mstr, "SLT\t%s, %s, %s", num2rgf[rd], num2rgf[rs], num2rgf[rt]);
				break;
			default:
				sprintf(mstr, "ERROR: %s", IR);
				break;
			}
			break;
		case 8:
			if (mode) Rgf[rt] = Rgf[rs] + ofs;
			sprintf(mstr, "ADDi\t%s, %s, %d", num2rgf[rt], num2rgf[rs], ofs);
			break;
		case 35:
			if (mode) Rgf[rt] = memory[Rgf[rs] + ofs];
			sprintf(mstr, "LW\t%s, %d(%s)", num2rgf[rt], ofs, num2rgf[rs]);
			break;
		case 43:
			if (mode) memory[Rgf[rs] + ofs] = Rgf[rt];
			sprintf(mstr, "SW\t%s, %d(%s)", num2rgf[rt], ofs, num2rgf[rs]);
			break;
		case 4:
			if (mode){
				if (Rgf[rt] == Rgf[rs])
					PC += (ofs);
			}
			sprintf(mstr, "BEQ\t%s, %s, %d", num2rgf[rt], num2rgf[rs], ofs);
			break;
		case 2:
			if (mode) PC = (PC & 0xF8000000) | (IR & (0x3FFFFFF));
			sprintf(mstr, "J\t%d", (IR & (0x3FFFFFF)));
			break;
		default:
			sprintf(mstr, "ERROR: %s", IR);
			break;
		}
		printf("0x%08X\t%s\n", IR, mstr);
	}
	
};
int main()
{
	int i, j, k, m;
	MipsCPU mycpu;
	bool iserr = mycpu.load();
	if (iserr) {
		cout << "The program is interupted by some error(s)" << endl;
		exit(1);
	}
	printf("------------------------------mips virtual machine-----------------------\n");
	
	string in;
	while (cin >> in) {
		printf("-u to disp instructions\t-t to step in\t-r to check registers\t-d to check memory\t-p to execute all\t-q to quit\n");
		if (in == "-q") 
			break;
		else if (in == "-u") {
			mycpu.disp_inst();
		}
		else if (in == "-t") {
			if (mycpu.PC < mycpu.size)
				mycpu.exec(1);
			else
				break;
			mycpu.disp();
		}
		else if (in == "-r") {
			mycpu.disp();
		}
		else if (in == "-d") {
			mycpu.disp_memo();
		}
		else if (in == "-p") {
			while (mycpu.PC < mycpu.size)
				mycpu.exec(1);
			mycpu.disp();
		}
		else if (in == "-a") {
			printf("0x%04X:\t", mycpu.PC);
			string tmp = "";
			char c;	cin.get();		
			while (1) {						
				c = cin.peek();
				if (c != '\n') {
					tmp += c;
					cin.get();
				}
				else {
					cin.get();
					break;
				}
			}
			mycpu.memory[mycpu.PC] = mycpu.unasm(tmp);
		}
		else {
			cerr << "ERROR: No such a opreation." << endl;
		}
	}
	return 0;
}

