#include<iostream>
using namespace std;
class C
{
public:
explicit C(int){cout<<"i"<<endl;}
C(double){cout<<"d"<<endl;}
C(const C&){cout<<"copied"<<endl;}//可能被编译器优化
};

int main()
{
    C c1(7);
    C c2=7;
}