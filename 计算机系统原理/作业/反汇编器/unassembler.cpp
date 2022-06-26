#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void reg(int n,int flag) {
	//if flag == 1 ,print the register represented by n, or print n
	if (flag) {
		if (n == 2 || n == 3)
			printf("$v%d", n - 2);
		else if (n >= 4 && n <= 7)
			printf("$a%d", n - 4);
		else if (n >= 8 && n <= 15)
			printf("$t%d", n - 8);
		else if (n >= 16 && n <= 23)
			printf("$s%d", n - 16);
		else if (n >= 24 && n <= 25)
			printf("$t%d", n - 16);
		else if (n >= 26 && n <= 27)
			printf("$k%d", n - 26);
		else {
			switch (n)
			{
			case 0:
				printf("$zero"); break;
			case 1:
				printf("$at"); break;
			case 28:
				printf("$gp"); break;
			case 29:
				printf("$sp"); break;
			case 30:
				printf("$fp"); break;
			case 31:
				printf("$ra"); break;
			default:
				break;
			}
		}
	}
	else 
		printf("%d", n);
	
}

char *hex2str(int n) {
	//convert a binary number to hexadecimal number
	char *s = (char *)malloc(sizeof(char) * 40);
	for (int i = 0; i < 32; i++) {
		int tmp = n;
		if ((tmp >> i) & 1)
			s[31 - i] = '1';
		else
			s[31 - i] = '0';
	}
	s[32] = '\0';
	return s;
}

int getbit(char s[], int beg, int end) {
	//get the value of a slice of a binary number (beg to end)
	int sum = 0;
	int fac = 1;
	for (int i = end; i >= beg; i--) {
		if (s[i] == '1')
			sum += fac;
		fac *= 2;
	}
	return sum;
}

int getcomp(char s[], int beg, int end) {
	//get a two's complement representation of a slice of a binary number (beg to end)
	int sum = 0;
	int fac = 1;
	for (int i = end; i > beg; i--) {
		if (s[i] == '0')
			sum += fac;
		fac *= 2;
	}
	return -(sum+1);
}

void unassembler() {
	int instuction;
	scanf("%x", &instuction);
	char *s = NULL;
	s = hex2str(instuction);
	int i;
	for (i = 0; i < 6; i++)
		if (s[i] == '1')
			break;
	char inst[10];
	int rs, rd, rt;
	int reg_or_num = 1;
	if (i == 6) {
		// R instruction
		rs = getbit(s, 6, 10);
		rt = getbit(s, 11, 15);
		rd = getbit(s, 16, 20);
		switch (getbit(s, 26, 31)) {		
		case 36:
			strcpy(inst, "and");
			break;
		case 37:
			strcpy(inst, "or");
			break;
		case 38:
			strcpy(inst, "xor");
			break;
		case 39:
			strcpy(inst, "nor");
			break;
		case 42:
			strcpy(inst, "slt");
			break;
		case 43:
			strcpy(inst, "sltu");
			break;
		case 12:
			strcpy(inst, "syscall");
			rt = rd = rs = -1;
			break;
		case 8:
			strcpy(inst, "jr");
			rt = -1;
			rd = -1;
			break;
		case 7:
			strcpy(inst, "srav");
			break;
		case 6:
			strcpy(inst, "srlv");
			break;
		case 4:
			strcpy(inst, "sllv");
			break;
		case 3:
			strcpy(inst, "sra");
			rt = -1;
			break;
		case 2:
			strcpy(inst, "srl");
			rt = -1;
			break;		
		case 0:
			strcpy(inst, "sll");
			rt = rd;
			rd = getbit(s, 21, 25);
			reg_or_num = 0;
			break;
		default:
			strcpy(inst, "NULL");
			rs = rt = rd = -1;
			break;
		}
		printf("%s ",inst);
		if(rs != -1)
			reg(rs, 1);
		if (rt != -1) {
			printf(", ");
			reg(rt, 1);
		}
		if (rd != -1) {
			printf(", ");
			reg(rd,reg_or_num);
		}
	}
	else if (i == 4 || i == 5) {
		// J instruction
		int adr = getbit(s, 6, 31);
		switch (getbit(s, 0, 5)) {
		case 2:
			//int adr = getbit(s, 6, 31);
			printf("j %d", adr);
			break;
		case 1:
			rs = getbit(s, 6, 10);
			printf("bgezal ");
			reg(rs, reg_or_num);
			printf(", %d", getbit(s, 16, 31));
			break;
		case 3:
			printf("jal %d", adr);
			break;
		default:
			strcpy(inst, "NULL");
			rs = rt = rd = -1;
			break;
		}
	}
	else {
		// I instruction
		int dataflag = 1;
		int instnum = getbit(s, 0, 5);
		rs = getbit(s, 6, 10);
		rt = getbit(s, 11, 15);
		int data = getbit(s, 16, 31);
		switch (instnum) {
		case 15:
			strcpy(inst, "lui");
			rs = -1;
			break;
		case 35:
			strcpy(inst, "lw");
			break;
		case 34:
			strcpy(inst, "lwx");
			break;
		case 33:
			strcpy(inst, "lh");
			data = getcomp(s, 16, 31);
			break;
		case 10:
			strcpy(inst, "slti");
			data = getcomp(s, 16, 31);
			break;
		case 11:
			strcpy(inst, "sltiu");
			break;
		case 12:
			strcpy(inst, "andi");
			break;
		case 14:
			strcpy(inst, "xori");
			break;
		case 4:
			strcpy(inst, "beq");
			break;
		case 5:
			strcpy(inst, "bne");
			break;
		default:
			strcpy(inst, "NULL");
			rs = rt = rd = -1;
			dataflag = 0;
			break;
		}
		printf("%s ", inst);
		if ((instnum >= 40 && instnum <= 43) || (instnum >= 32 && instnum <= 37)) {
			if (rs != -1) {
				reg(rs, reg_or_num);
				printf(", ");
			}
			if (dataflag)
				printf("%d(", data);
			if (rt != -1) {
				reg(rt, reg_or_num);
				printf(")");
			}
		}
		else {
			if (rs != -1) {
				reg(rs, reg_or_num);
				printf(", ");
			}

			if (rt != -1) {
				reg(rt, reg_or_num);
				printf(", ");
			}			
			if (dataflag)
				printf("%d", data);
		}
	}
}
int main(){
	printf("please input some hexadecimal machine instruction codes:\n");
	while (1) {
		unassembler();
		printf("\n");
	}
	system("pause");
	return 0;
    
}


