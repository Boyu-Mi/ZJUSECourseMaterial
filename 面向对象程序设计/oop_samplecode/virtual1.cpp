#include <iostream>
using namespace std;
class A
{
    int i;
public:
    A():i(0){}
    virtual void set(int i){this->i=i;}
    virtual int get(){return i;}
};
class B:public A
{
    int i;
public:
    B():i(10){}
    virtual void set(int i){this->i=i;}
};

int main()
{
    B b;
    A* p=&b;
    p->set(30);
    cout<<p->get()<<endl;
    return 0;
}