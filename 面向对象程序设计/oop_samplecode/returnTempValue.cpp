#include<iostream>
using namespace std;

class A
{
    int i;
public:
    A():i(10){cout<<"A()"<<i<<"\t";f();}
    virtual ~A(){cout<<"~A()"<<"\t";}
    virtual void f() {i+=11;cout<<"A::f()"<<i<<"\t";}
    void g(){i+=12;cout<<"A::g()"<<i<<"\t";}
};

class B:public A
{
    int i;
public:
    B():i(20){cout<<"B()"<<i<<"\t";f();}
    ~B(){cout<<"~B()"<<"\t";}
    void f() {i+=22;cout<<"B::f()"<<i<<"\t";}
    void g(){i+=12;cout<<"B::g()"<<i<<"\t";}
};

B gen()
{
    return B();
}
int main()
{
    A* p=new B();
    p->f();
    cout<<endl;
    A a;
    B b=gen();
    a=b;
    a.f();
    cout<<endl;
    b.g();
    delete p;
}