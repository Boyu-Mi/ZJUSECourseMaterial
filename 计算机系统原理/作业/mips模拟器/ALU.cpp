#define _my_tar_mem register_file[(current<<6)>>27]+((current<<16)>>16)
#define _my_rs register_file[(current<<6)>>27]
#define _my_rt register_file[(current<<11)>>27]
#define _my_rd register_file[(current<<16)>>27]
#define _my_sa register_file[(current<<21)>>27]
#define _my_dat ((current<<16)>>16)
#define _my_dot ((current<<16)>>16)
#define _my_ofs ((current<<16)>>16)
#define _my_adr ((current<<6)>>6)

void stepIn() {
	// 线性步进执行冯模型的模拟机
	unsigned int current = memory[proCnt];
	switch (current >> 26) {
		case 0: // 调用ALU的算术运算指令
			switch ((current << 26) >> 26) {
				case 0:     // sll
					_my_rd = _my_rs << _my_sa;
					break;
				case 2:     // srl
					_my_rd = _my_rs >> _my_sa;
					break;
				case 3:     // sra
					_my_rd = _my_rs >> _my_sa;
					break;
				case 4:     // sllv
					_my_rd = _my_rs << _my_rt;
					break;
				case 6:     // srlv
					_my_rd = _my_rs >> _my_rt;
					break;
				case 7:     // srav
					_my_rd = _my_rs >> _my_rt;
					break;
				case 8:     // jr
					proCnt = _my_rs;
				case 9:     // jalr
					_my_rd = proCnt;
					proCnt = _my_rs;
				case 12:    // syscall
					break;
				case 16:    // mfhi
					break;
				case 17:    // mthi
					break;
				case 18:    // mflo
					break;
				case 19:    // mthi
					break;
				case 24:    // mult
					break;
				case 25:    // multu
					break;
				case 26:    // div
					break;
				case 27:    // divu
					break;
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
				case 39:    // nor
					_my_rd = ~(_my_rs | _my_rt);
					break;
				case 42:    // slt
					_my_rd = _my_rs < _my_rt ? 1 : 0;
					break;
				case 43:    // sltu
					_my_rd=((static_cast<int>(_my_rs)) <(static_cast<int>(_my_rt)))?1:0;
					break;
			}
			break;
		case 1:     // bgezal
			if(_my_rs >= 0){
				register_file[31] = proCnt;
				proCnt+=_my_ofs;
			}
			break;
		case 2:     // j
			proCnt = (proCnt & 0xF8000000)| _my_adr;
			break;
		case 3:     // jal
			break;
		case 4:     // beq
			if(_my_rs == _my_rt ){
				proCnt+=_my_ofs;
			}
			break;
		case 5:     // bne
			if(_my_rs != _my_rt ){
				proCnt+=_my_ofs;
			}
			break;
		case 8:     // addi
			_my_rt = _my_rs + _my_dat;
			break;
		case 10:    // slti
			_my_rt= (_my_rs < _my_dat) ?1:0;
			break;
		case 11:    // sltiu
			_my_rt= (static_cast<int>(_my_rs) < static_cast<int>(_my_dat)) ?1:0;
			break;
		case 12:    // andi
			_my_rt = _my_rs & _my_dot;
			break;
		case 13:    // ori
			_my_rt = _my_rs | _my_dot;
			break;
		case 14:    // xori
			_my_rt = _my_rs ^ _my_dot;
			break;
		case 15:
			_my_rt = _my_dat << 16;
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
		proCnt--;
	}
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

char registers[32][6] = {\
    "$zero", "$at", "$v0", "$v1", "$a0", "$a1", "$a2", "$a3", \
    "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", \
    "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7", \
    "$t8", "$t9", "$k0", "$k1", "$gp", "$sp", "$fp", "$ra", \
};