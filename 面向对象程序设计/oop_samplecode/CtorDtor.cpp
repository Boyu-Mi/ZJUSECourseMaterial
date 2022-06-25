#include <iostream>
using namespace std;

class AA{
public:
    AA(){cout<<1<<endl;}
    ~AA(){cout<<2<<endl;}
};

class BB:public AA{
    AA a;
public:
    BB(){cout<<3<<endl;}
    ~BB(){cout<<4<<endl;}
};

int main()
{
    BB b;
}