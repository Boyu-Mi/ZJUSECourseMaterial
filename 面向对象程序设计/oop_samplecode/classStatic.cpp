#include<iostream>
using namespace std;
class A
{
    static int m;
    int n;
public:
    A(int m,int n)
    {
        this->m=m;
        this->n=n;
    }
    void print() const
    {
        cout<<m<<" "<<n<<endl;
    }
};
int A::m;
int main()
{
    A a1(3,4);
    A a2(5,6);
    a1.print();
    a2.print();
}