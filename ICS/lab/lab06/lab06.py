import re
class Assembler:
    def __init__(self):
        self.PC = 0
        self.register_to_num = {"R0": 0,"R1": 1,"R2": 2, "R3": 3,"R4": 4, "R5": 5, "R6": 6, "R7": 7}
        self.label_list = {}
        self.res = []
        self.inst_set = ["ADD", "AND", "NOT", "LD", "LDR", "LDI", "ST", "STR", "STI", "LEA", "TRAP", "BR", "BRn", "BRnzp", "BRnz","BRnp", "BRz", "BRzp", "BRp", "JMP", "RET", "JSR", "JSRR", "RTI", ".ORIG", ".FILL","GETC", "OUT", "PUTS", "IN", "PUTSP", "HALT", ".BLKW", ".STRINGZ", "TRAP", ".END"]
    
    def reg2num(self, s):
        return self.register_to_num[s]

    def label2num(self, s):
        return self.label_list[s]

    def assemble(self, s): 
        # assemble a single line
        word_list = s.split()
        inst = word_list[0]
        assert inst in self.inst_set
        reg = re.findall(r'R[0-7]', s)  # registers
        data = re.findall(r'#[0-9*-]{1,7}', s)  # decimal imm, #0 for the shortest and #-65536 for the longest
        data_hex = re.findall(r'x[-0-9a-fA-F]{1,5}', s)  # hexadecimal imm, x0 for the shortest and # x-FFFF for the
        # longest
        label = word_list[-1]
        if label in self.label_list:
            ofs = self.label2num(label) - self.PC
        elif label[0] == '#':
            ofs = eval(label[1:])
        elif label[0] == 'x':
            if len(label) > 2 and label[1] == '-':
                ofs = -1 * eval("0x" + label[2:])
            else:
                ofs = eval("0" + label)  
        else:
            ofs = 0
        if len(data):
            imm = eval(data[0][1:])
        elif len(data_hex):
            if len(data_hex[0]) > 2 and data_hex[0][1] == '-':
                imm = -1 * eval("0x" + data_hex[0][2:])
            else:
                imm = eval("0" + data_hex[0])        
        if inst == "ADD":
            if len(reg) == 3:
                ir = (1 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | (self.reg2num(reg[2]))
            elif len(reg) == 2:               
                ir = (1 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | (1 << 5) | imm & 0x1f
        elif inst == "AND":
            if len(reg) == 3:
                ir = (5 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | (self.reg2num(reg[2]))
            elif len(reg) == 2:    
                ir = (5 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | (1 << 5) | imm & 0x1f
        elif inst == "NOT":      
            ir = (9 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | 0x3f
        elif inst == "LD":          
            ir = (2 << 12) | (self.reg2num(reg[0]) << 9) | ofs & 0x1ff
        elif inst == "ST": 
            ir = (3 << 12) | (self.reg2num(reg[0]) << 9) | ofs & 0x1ff
        elif inst == "LDR":
            ir = (6 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | imm & 0x3f
        elif inst == "LDI":      
            ir = (10 << 12) | (self.reg2num(reg[0]) << 9) | ofs & 0x1ff
        elif inst == "LEA":
            ir = (14 << 12) | (self.reg2num(reg[0]) << 9) | ofs & 0x1ff
        elif inst == "STR":
            ir = (7 << 12) | (self.reg2num(reg[0]) << 9) | (self.reg2num(reg[1]) << 6) | imm & 0x3f
        elif inst == "STI":
            ir = (11 << 12) | (self.reg2num(reg[0]) << 9) | ofs & 0x1ff
        elif inst == "TRAP":
            ir = (15 << 12) | ofs & 0xfff       
        elif inst == "BR":
            ir = 7 << 9 | ofs & 0x1ff
        elif inst == "BRn":
            ir = 4 << 9 | ofs & 0x1ff
        elif inst == "BRz":
            ir = 2 << 9 | ofs & 0x1ff
        elif inst == "BRp":
            ir = 1 << 9 | ofs & 0x1ff
        elif inst == "BRnz":
            ir = 6 << 9 | ofs & 0x1ff
        elif inst == "BRzp":
            ir = 3 << 9 | ofs & 0x1ff
        elif inst == "BRnp":
            ir = 5 << 9 | ofs & 0x1ff
        elif inst == "BRnzp":
            ir = 7 << 9 | ofs & 0x1ff
        elif inst == "JMP":      
            ir = (12 << 12) | (self.reg2num(reg[0]) << 6) 
        elif inst == "RET":      
            ir = (12 << 12) | (7 << 6)     
        elif inst == "JSR":
            ir = 4 << 12 | 1 << 11 | ofs & 0x7ff
        elif inst == "JSRR":    
            ir = (4 << 12) | (self.reg2num(reg[0]) << 6)
        elif inst == "RTI":  
            ir = 8 << 12
        elif inst == ".ORIG":  
            ir = ofs
        elif inst == ".FILL":  
            ir = ofs
        elif inst == "GETC":
            ir = 0xf020 
        elif inst == "OUT":
            ir = 0xf021
        elif inst == "PUTS":
            ir = 0xf022
        elif inst == "IN":
            ir = 0xf023
        elif inst == "PUTSP":
            ir = 0xf024
        elif inst == "HALT":
            ir = 0xf025
        else:
            if inst == ".BLKW":
                for i in range(ofs):
                    self.res.append(0x7777)
                    self.PC += 1
                self.PC -= 1
            elif inst == ".STRINGZ":
                head, tail = 0, len(s) - 1
                while s[head] != '\"':
                    head += 1
                while s[tail] != '\"':
                    tail -= 1
                for c in range(head + 1, tail):
                    self.res.append(ord(s[c]))
                    self.PC += 1
                self.res.append(0)
            return
        self.res.append(ir)
        return

    def generate_label(self, lst):
        for i in range(len(lst)):
            word_list = lst[i].split()
            inst = word_list[0]
            if inst not in self.inst_set:
                self.label_list[inst] = self.PC
                lst[i] = ""
                for j in range(len(word_list[1:])):
                    if word_list[1:][j] != '' and word_list[1:][j] != " ":
                        lst[i] = lst[i] + " " + word_list[1:][j]
                lst[i] = lst[i].strip()
                if lst[i].split()[0] == ".BLKW":
                    word_list = lst[i].split()
                    data = eval(word_list[-1][1:])
                    assert data >= 0
                    for i in range(data):
                        self.PC += 1
                elif lst[i].split()[0]  == ".STRINGZ":
                    head, tail = 0, len(lst[i]) - 1
                    while lst[i][head] != '\"':
                        head += 1
                    while lst[i][tail] != '\"':
                        tail -= 1
                    for c in range(head + 1, tail):
                        self.PC += 1
                    self.PC += 1
                else:
                    self.PC += 1
            else:
                if lst[i].split()[0] == ".BLKW":
                    word_list = lst[i].split()
                    data = eval(word_list[-1][1:])
                    assert data >= 0
                    for i in range(data):
                        self.PC += 1
                elif lst[i].split()[0]  == ".STRINGZ":
                    head, tail = 0, len(lst[i]) - 1
                    while lst[i][head] != '\"':
                        head += 1
                    while lst[i][tail] != '\"':
                        tail -= 1
                    for c in range(head + 1, tail):
                        self.PC += 1
                    self.PC += 1
                else:
                    self.PC += 1
assembler = Assembler()
lst = []
s = input().strip()
word_list = s.split()
data = eval("0" + word_list[-1])
assembler.PC = data
assembler.res.append(data)
while 1:
    s = input().strip()
    if s != "":
        if s.split()[-1] == ".END":
            break
        lst.append(s)
assembler.generate_label(lst)
assembler.PC = data
for line in lst:
    assembler.PC += 1
    assembler.assemble(line)
for n in assembler.res:
    print('{:0>16b}'.format(n & 0xffff))