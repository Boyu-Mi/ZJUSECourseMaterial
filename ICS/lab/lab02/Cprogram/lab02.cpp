#include<iostream>
using namespace std;
int main() {
	int ASCII_A = -65;
	int ASCII_0 = -48;
	int num = 0;
        int num2 = 0;
        int num3, num4;
        int num5 = 0;
	char c;
        const char cc[18] = "0123456789ABCDEF";
        int dd[4] = {8, 4, 2, 1};
        char output[5];
        LOOP:
	c = getchar();
	int d = c - 10;
	if(d == 0)
          goto END;
	//num <- 10 * num + d - '0'
	num2 = num + num;
	num = num2 + num2;
	num = num + num; // 8 * original num
	num = num + num2;
	num = num + c - '0';
	goto LOOP;

        //output
	END:
          num3 = 1 << 4;
          num4 = 0;
          output[3] = cc[(num & 15)];
          for(int j = 2; j >= 0; j--) {//R0
            for (int i = 3; i >= 0; i--) {//R2
              if (num & num3) {//R3
                num4 += dd[i];//R4
              }
              num3 = num3 + num3;
            }
            output[j] = cc[num4];
            num4 = 0;
          }
//          for(int i = 0; i < 4; i++){
//            if(num & num3){
//              num4 += dd[i];
//            }
//            num3 = num3 + num3;
//          }
//          output[1] = cc[num4];
//          num4 = 0;
//          for(int i = 0; i < 4; i++){
//            if(num & num3){
//              num4 += dd[i];
//            }
//            num3 = num3 + num3;
//          }
//          output[0] = cc[num4];
        cout << output << endl;
	printf("%04X", num);
}
