#include<iostream>
using namespace std;

class A
{
public:
    void F(int){cout<<"A::F(int)"<<endl;}
    void F(double){cout<<"A::F(double)"<<endl;}
    void F2(int){cout<<"A::F2(int)"<<endl;}
};
class B:public A
{
public:
    void F(double){cout<<"B::F(double)"<<endl;}//遮蔽A::F(int) A::F(double)
};

int main()
{
    B b;
    b.F(2.0);
    b.F(2);
    b.F2(2);
}