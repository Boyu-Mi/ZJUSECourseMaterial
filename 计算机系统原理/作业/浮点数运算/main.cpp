#include<iostream>
#include<string>
using namespace std;
typedef unsigned long word;
//补码表示
word atom(char *s) {//字符串转数
	bool isneg = false;
	word i, result;
	i = result = 0;
	if (s[0] == '-') {
		isneg = true;
		i++;
	}
	while (s[i] != '\0') {
		result = result * 10 + s[i++] - '0';
	}
	if (isneg) {
		return 0xFFFFFFFF - result + 1;
	}
	else
		return result;
}

word madd(word a, word b) {
	word sum = a;
	word carry = b;
	word tmp;
	while (carry) {
		tmp = sum;
		sum = sum ^ carry;
		carry = (tmp & carry) << 1;
	}
	return sum;
}

word msub(word a, word b) {
	return madd(a, madd(~b, 1));//a + b补码
}

word mmut(word x, word y) {// booth算法 
	bool isneg = (x >> 31) ^ (y >> 31);
	word result = 0;
	x = (x >> 31) ? madd(~x, 1) : x;
	y = (y >> 31) ? madd(~y, 1) : y;
	while(y){
		if(y & 1){
			result += x;
			y >>= 1;
			x <<= 1;
		}
	}
	if(isneg) 
		return madd(~result, 1);
	else
		return result;
}

word mdiv(word x, word y) {
	bool isneg = (x >> 31) ^ (y >> 31);
	word a, b;
	word result = 0;
	a = (x >> 31) ? madd(~x, 1) : x;
	b = (y >> 31) ? madd(~y, 1) : y;
	for (int i = 31; i >= 0; i--) {
		if ((a >> i) >= b) {
			
			result += (1 << i);
			a -= (b << i);
		}
	}
	if (isneg)
		return madd(~result, 1);
	else
		return result;
}

word mmod(word x, word y) {
	word a, b, result = 0;
	a = (x >> 31) ? madd(~x, 1) : x;
	b = (y >> 31) ? madd(~y, 1) : y;
	result = msub(x, mmut(mdiv(x, y), y));
	if (result >> 31)
		return madd(~result, 1);
	else
		return result;
}

char* mtoa(word n) {//数转字符串
	char str[40];
	word i = 0;
	while (i < 32) {
		if (n >> (31 - i) & 1) {
			str[i] = '1';
		}
		else
			str[i] = '0';
		i++;
	}
	str[i] = '\0';
	return str;
}

int main() {
	word n = -127;
	cout << mtoa(n) << endl;
	char nn[33] = "127";
	cout << atom(nn) << endl;
	word a = 125;
	word b = 127;
	printf("%d - %d = %X\n", a, b, msub(a, b));
	printf("%d x %d = %d\n", a, b, mmut(a, b));
	a = 256;
	b = -16;
	printf("%d / %d = %d\n", a, b, mdiv(a, b));
}

