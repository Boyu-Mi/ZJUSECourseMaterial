#include<iostream>
using namespace std;

void f(int i)
{
    cout<<"f(int)"<<endl;
}
void f(float i)
{
    cout<<"f(float)"<<endl;
}

template<typename T>
void f(T i)
{
    cout<<"f(T)"<<endl;
}

int main()
{
    f(1);
    f(1.0);
    f(1.0f);
}