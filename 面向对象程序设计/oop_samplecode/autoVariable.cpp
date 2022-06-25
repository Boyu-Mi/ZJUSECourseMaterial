//考试不会考
#include<iostream>
using namespace std;
class A
{
public:
    A(int ii=0):m_i(ii){}
    void display() const
    {
        cout<<m_i<<endl;
    }
private:
    int m_i;
    friend int main();
};
void CreateA(A* pa)
{
    pa=new A(1);
}
A* CreateA()
{
    A a(2);
    return &a;
}
void CreateAOnStack()
{
    A a(3);
}
int main()
{
    A a;
    A* pa=&a;
    pa->display();
    CreateA(pa);
    pa->display();

    A* a2=CreateA();
    cout<<a2->m_i<<endl;
    CreateAOnStack();
    cout<<a2->m_i<<endl;
}