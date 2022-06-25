#include<iostream>
using namespace std;
class A
{
public:
    virtual void foo(){}
};

class B
{
public:
    int i;
    virtual void foo(){}
};

int main()
{
    cout<<sizeof(int)<<endl;
    cout<<sizeof(A)<<endl;
    cout<<sizeof(B)<<endl;
    //内存对齐,sizeof(B)!=sizeof(A)+sizeof(int)
}