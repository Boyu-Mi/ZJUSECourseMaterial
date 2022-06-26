#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>
#include <windows.h>

void color(const unsigned short textColor)
{
	if (textColor >= 0 && textColor <= 15)
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), textColor);
	else
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
}

FILE* fphzkGB = fopen("hzk16", "rb");
FILE* fphzkZB = fopen("mhzk16c.字库", "rb");

void printblock(int size) {
	if (size == 1) {
		printf("■");
	}
	else {
		printf("■■");
	}
}

void printblank(int size) {
	if (size == 1) {
		printf("  ");
	}
	else {
		printf("    ");
	}
}

void print_in_GB(char word[], int size) {
	int i, j, k, ofs;
	unsigned char buffer[32];
	if (fphzkGB == NULL) {
		fprintf(stderr, "no such a file\n");
		exit(1);
	}	
	int q = (word[0] - 0xA1) & 0xFF;
	if (q < 16 || q > 87) {
		printf("not a chinese character\n");
		return;
	}
	printf("GB: \n");
	int w = (word[1] - 0xA1) & 0xFF;
	ofs = (q * 94 + w) * 32;
	fseek(fphzkGB, ofs, SEEK_SET);
	fread(buffer, 1, 32, fphzkGB);
	for (j = 0; j < 16; j++) {
		for (int n = 0; n < size; n++) {
			k = 0x80;
			for (i = 0; i < 8; i++) {
					if (buffer[j * 2 + 0] & k) {
						printblock(size);
					}
					else {
						printblank(size);
					}

				k >>= 1;
			}
			k = 0x80;
			for (i = 0; i < 8; i++) {
				
					if (buffer[j * 2 + 1] & k) {
						printblock(size);
					}
					else {
						printblank(size);
					}

				
				k >>= 1;
			}
			printf("\n");
		}
		if(size > 1) printf("\n");
	}
}

void print_in_ZB(char word[], int size){
	int i, j, k, ofs;
	unsigned char buffer[32];
	int q = (word[0] - 0xA1) & 0xFF;
	int w = (word[1] - 0xA1) & 0xFF;
	if (q < 16 || q > 87) {
		printf("not a chinese character\n");
		return;
	}
	ofs = (q * 94 + w) * 32 + 0x2000;
	fseek(fphzkZB, ofs, SEEK_SET);
	fread(buffer, 1, 32, fphzkZB);
	printf("ZB: \n");
	for (j = 0; j < 16; j++) {
		for (int n = 0; n < size; n++) {
			k = 0x80;
			for (i = 0; i < 8; i++) {
				if (buffer[j * 2 + 0] & k) {
					printblock(size);
				}
				else {
					printblank(size);
				}

				k >>= 1;
			}
			k = 0x80;
			for (i = 0; i < 8; i++) {

				if (buffer[j * 2 + 1] & k) {
					printblock(size);
				}
				else {
					printblank(size);
				}


				k >>= 1;
			}
			printf("\n");
		}
		if(size > 1) printf("\n");
	}
	
}

void print_reverse(char word[]) {
	int i, j, k, ofs;
	int size = 1;
	unsigned char buffer[32];
	int q = (word[0] - 0xA1) & 0xFF;
	int w = (word[1] - 0xA1) & 0xFF;
	if (q < 16 || q > 87) {
		printf("not a chinese character\n");
		return;
	}
	ofs = (q * 94 + w) * 32 + 0x2000;
	fseek(fphzkZB, ofs, SEEK_SET);
	fread(buffer, 1, 32, fphzkZB);
	printf("ZB: \n");
	for (j = 15; j >= 0; j--) {
		
			k = 0x01;
			for (i = 0; i < 8; i++) {
				if (buffer[j * 2 + 1] & k) {
					printblock(1);
				}
				else {
					printblank(1);
				}

				k <<= 1;
			}
			k = 0x01;
			for (i = 0; i < 8; i++) {

				if (buffer[j * 2 + 0] & k) {
					printblock(1);
				}
				else {
					printblank(1);
				}


				k <<= 1;
			}
			printf("\n");
		}

}

void print_italics(char word[]) {
	int i, j, k, ofs;
	int size = 1;
	unsigned char buffer[32];
	int q = (word[0] - 0xA1) & 0xFF;
	int w = (word[1] - 0xA1) & 0xFF;
	if (q < 16 || q > 87) {
		printf("not a chinese character\n");
		return;
	}
	ofs = (q * 94 + w) * 32 + 0x2000;
	fseek(fphzkZB, ofs, SEEK_SET);
	fread(buffer, 1, 32, fphzkZB);
	printf("ZB: \n");
	for (j = 0; j < 16; j++) {
		for(int n = 0; n<= 15 - j; n++) printf(" ");
		for (int n = 0; n < size; n++) {
			k = 0x80;
			for (i = 0; i < 8; i++) {
				if (buffer[j * 2 + 0] & k) {
					printblock(size);
				}
				else {
					printblank(size);
				}

				k >>= 1;
			}
			k = 0x80;
			for (i = 0; i < 8; i++) {

				if (buffer[j * 2 + 1] & k) {
					printblock(size);
				}
				else {
					printblank(size);
				}
				k >>= 1;
			}
			printf("\n");
		}
		if (size > 1) printf("\n");
	}

}

void print_color(char word[]) {
	color(4);
	print_in_ZB(word,1);
	color(16);

}
int main() {
	//printf("*************************汉字显示*************************\n1、正常 2、放大 3、倒置 4、彩色 5、斜体 6、退出\n");
	if(!fphzkGB || !fphzkZB){
		printf("no such a file");
		exit(1);
	}
	char word[3] = "楼";
	int op;
	while (1) {
		
		printf("*************************汉字显示*************************\n1、正常 2、放大 3、倒置 4、彩色 5、斜体 6、退出\n");
		printf("请输入模式：");
		scanf("%d", &op);
		if (op == 6)
			break;
		printf("请输入一个汉字：");
		scanf("%s", word);
		switch (op)
		{
		case 1:
			print_in_GB(word, 1);
			print_in_ZB(word, 1);
			break;
		case 2:
			print_in_GB(word, 2); 
			print_in_ZB(word, 2); 
			break;
		case 3:
			print_reverse(word); break;
		case 4:
			print_color(word); break;
		case 5:
			print_italics(word); break;
		default:
			break;
		}
	}
	fclose(fphzkZB);
	fclose(fphzkGB);
	return 0;
}
