import re
def reg2num(s):
    dt = {
        "$zero": 0,
        "$at": 1,
        "$v0": 2, "$v1": 3,
        "$a0": 4, "$a1": 5, "$a2": 6, "$a3": 7,
        "$t0": 8, "$t1": 9, "$t2": 10, "$t3": 11, "$t4": 12, "$t5": 13, "$t6": 14, "$t7": 15,
        "$s0": 16, "$s1": 17, "$s2": 18, "$s3": 19, "$s4": 20, "$s5": 21, "$s6": 22, "$s7": 23,
        "$s8": 24, "$s9": 25,
        "$k0": 26, "$k1": 27,
        "$gp": 28,
        "$sp": 29,
        "$fp": 30,
        "$ra": 31
    }
    return dt[s]

def assemble(s):
    lst = s.split(" ")
    inst = lst[0]
    if inst == "lui":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        reg = reg2num(reg[0])
        data = eval(data[0])
        ir = (15 << 26) | (reg << 16) | (data & 0xFFFF)
    elif inst == "lw":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (35 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "lwx":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (34 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "lh":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (33 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "lhx":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (32 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "lhu":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (37 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "lhux":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (36 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "sw":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (43 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "swx":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (42 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "sh":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (41 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "shx":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (40 << 26) | (reg2num(reg[0]) << 16) | (
            eval(data[0]) & 0xffff) | (reg2num(reg[1]) << 21)
    elif inst == "add":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (32 & 63) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | (reg2num(reg[2]) << 11)
    elif inst == "addi":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (8 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "sub":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (34 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "slt":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (42 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "slti":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (10 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "sltu":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (43 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "sltiu":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (11 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "andi":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (12 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "ori":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (13 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "xori":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (14 << 26) | (reg2num(reg[0]) << 16) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) & 0xffff)
    elif inst == "and":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (36 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "or":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (37 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "xor":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (38 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "nor":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (39 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "sll":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (0 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) << 6)
    elif inst == "sllv":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (4 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "srl":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (0 << 26) | (2 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (eval(data[0]) << 6)
    elif inst == "srlv":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (6 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "sra":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (3 & 63) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | (reg2num(reg[2]) << 11)
    elif inst == "srav":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (7 & 63) | (reg2num(reg[0]) << 11) | (
            reg2num(reg[1]) << 21) | (reg2num(reg[2]) << 16)
    elif inst == "add":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (32 & 63) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | (reg2num(reg[2]) << 11)
    elif inst == "beq":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (4 << 26) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | ((eval(data[0])-2) & 0xffff)
    elif inst == "bne":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (5 << 26) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | ((eval(data[0])-2) & 0xffff)
    elif inst == 'j':
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (2 << 26) | ((eval(data[0]) >> 1) & 0x3ffffff)
    elif inst == "jr":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (8 & 63) | (reg2num(reg[0]) << 21)
    elif inst == "bgezal":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (1 << 26) | ((17 & 31) << 16) | (
            reg2num(reg[0]) << 21) | (((eval(data[0])-2) >> 1) & 0xffff)
    elif inst == "jal":
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir = (3 << 26) | ((eval(data[0]) >> 1) & 0x3ffffff)
    elif inst == "jalr":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (9 & 63) | (
            reg2num(reg[0]) << 21) | (reg2num(reg[1]) << 11)
    elif inst == "ir":
        ir = (16 << 26) | ((16 & 31) << 21) | (24 & 63)
    elif inst == "syscall":
        ir = (0 << 26) | (12 & 63)
    elif inst == "mul":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (28 << 26) | (2 & 63) | (reg2num(reg[0]) << 21) | (
            reg2num(reg[1]) << 16) | (reg2num(reg[2]) << 11)
    elif inst == "div":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        ir = (0 << 26) | (26 & 63) | (
            reg2num(reg[0]) << 21) | (reg2num(reg[1]) << 16)
    elif inst == "li":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        if eval(data[0]) >> 15:
            ir1 = assemble("lui " + reg[0] + ", " + str(eval(data[0]) % 32768))
            ir2 = assemble("ori " + reg[0] + ", $zero, " + str(eval(data[0]) // 32768))
            print("%#x" % ir1)
            print("%#x" % ir2)
            ir = 0
            pass
        else:
            ir = assemble("addi " + reg[0] + ", $zero," + data[0])
        pass
    elif inst == "bgt":
        reg = re.findall(r'\$[a-z0-9]{2,4}', s)
        data = re.findall(r'\ [0-9*-]{1,5}', s)
        ir1 = assemble("slt " + "$at, " + reg[0] + ", " + reg[1])
        ir2 = assemble("bne $at, $zero, " + data[0])
        print("%#16x" % ir1)
        print("%#16x" % ir2)
        ir = 0
        pass
    else:
        ir = 0
    return ir

def main():
    while 1:
        s = input()
        s = s.lower()
        if s=="#":
            break
        ir = assemble(s)
        if ir:
            print("0x%08x" % ir)
        else:
            print("NULL!")

if __name__ == "__main__":
    main()
    
