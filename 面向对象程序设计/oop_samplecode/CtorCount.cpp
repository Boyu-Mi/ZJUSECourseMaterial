#include<iostream>
using namespace std;

class A
{
private:
    char c;
    static int count;
public:
    A(char c):c(c)
    {
        count++;
        cout<<"ctor:count="<<count<<",c="<<c<<endl;
    }
    ~A()
    {
        count--;
        cout<<"dtor:count="<<count<<",c="<<c<<endl;
    }
};
int A::count=0;

A globalA('G');

int main()
{
    A a1('A');
    for(int i=1;i<=2;i++)
    {
        cout<<"begin-block"<<endl;
        A a2('B');
        static A a3('S');
        cout<<"end-block"<<endl;
    }
    cout<<"end main"<<endl;
}