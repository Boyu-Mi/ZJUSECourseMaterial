#include<iostream>
using namespace std;

class A
{
public:
    virtual void f(int a=1){cout<<"A::f()"<<'\n'<<a<<endl;}
};

class B:public A
{
public:
    virtual void f(int a=2){cout<<"B::f()"<<'\n'<<a<<endl;}
};

int main()
{
    A* a = new B;
    a->f();
}