#include <iostream>
using namespace std;

class B{
public:
    void f()
    {
        cout<<"bf"<<endl;
    }
    virtual void vf()
    {
        cout<<"bvf"<<endl;
    }
    void ff()
    {
        vf();
        f();
    }
    virtual void vff()
    {
        vf();
        f();
    }
};

class D:public B
{
    void f()
    {
        cout<<"df"<<endl;
    }
    void ff()
    {
        f();
        vf();
    }
    void vf()
    {
        cout<<"dvf"<<endl;
    }
};

int main()
{
    D d;
    B* p=&d;
    p->f();
    p->ff();
    p->vf();
    p->vff();
}