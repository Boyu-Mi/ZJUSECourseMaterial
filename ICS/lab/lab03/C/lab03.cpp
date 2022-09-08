#include <iostream>
#include <list>
#include <cstdlib>
#include <ctime>
#include <string>
using namespace std;
int main() {
  list<char> lst;
  unsigned seed; // Random generator seed
  // Use the time function to get a "seed” value for srand
  seed = time(0);
  string input = "";
  string out = "";
  srand(seed);
  char c;
  for (int i = 0; i < 12; ++i) {
    c = static_cast<char>('A' + i);
    int j = rand() & 3;
    if (j == 0) {
      // push right
      lst.push_back(c);
      input += "[";
      input += c;
    } else if (j == 1) {
      lst.push_front(c);
      input += "+";
      input += c;
    } else if (j == 2) {
      if (lst.empty()) {
        out += "_";
      } else {
        out += lst.back();
        lst.pop_back();
      }
      input += "]";
    } else if (j == 3) {
      if (lst.empty()) {
        out += "_";
      } else {
        out += lst.front();
        lst.pop_front();
      }
      input += "-";
    }
  }
  cout << input << endl;
  cout << out << endl;
}
    //  char *out = new char[100];
    //  int PL, PR;
    //  PL = 5001;
    //  PR = 5000;
    //  char c, opc;
    //  int size = 0;
    //  int tmp = 0;
    //  LOOP:
    //    c = getchar();
    //    c -= 10;
    //    if(c == 0) goto Done;
    //    c += 10;
    //
    //    c -= '+';
    //    if(c == 0) {
    //      opc = getchar();
    //      goto PUSHL;
    //    }
    //    c += '+';
    //
    //    c -= '[';
    //    if(c == 0) {
    //      opc = getchar();
    //      goto PUSHR;
    //    }
    //    c += '[';
    //
    //    c -= '-';
    //    if(c == 0) {
    //      goto POPL;
    //    }
    //    c += '-';
    //
    //    c -= ']';
    //    if(c == 0) {
    //      goto POPR;
    //    }
    //
    //  PUSHL:
    //    PL = PL - 1;
    //    MEM[PL] = opc;
    //    goto LOOP;
    //
    //  PUSHR:
    //    PR = PR + 1;
    //    MEM[PR] = opc;
    //    goto LOOP;
    //
    //  POPL:
    //    tmp = PR - PL + 1;
    //    if(tmp == 0) goto EMPTY;
    //    out[size++] = MEM[PL];
    //    cout << "pop" << MEM[PL] << endl;
    //    PL++;
    //    goto LOOP;
    //
    //  POPR:
    //    tmp = PR - PL + 1;
    //    if(tmp == 0) goto EMPTY;
    //    out[size++] = MEM[PR];
    //    cout << "pop" << MEM[PR] << endl;
    //    PR--;
    //    goto LOOP;
    //  EMPTY:
    //    out[size++] = '_';
    //    goto LOOP;
    //  Done:
    //    cout << size << endl;
    //    for(int i = 0; i <= size; i++){
    //      cout << out[i];
    //    }
    //}
