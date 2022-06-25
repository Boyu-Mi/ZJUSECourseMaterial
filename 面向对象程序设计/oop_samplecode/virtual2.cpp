#include <iostream>
using namespace std;
class A
{
    virtual void f(){cout<<"lala"<<endl;}
public:
    void f(int a,int b=10){}
    void f(int a,int b=10) const {}
};

class B:public A
{
public:
    void f(){cout<<"lili"<<endl;}
};

int main()
{
    B a;
    A* p=&a;
    p->f();
    return 0;
}