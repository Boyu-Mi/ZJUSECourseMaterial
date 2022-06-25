#include<iostream>
using namespace std;
class Interger
{
public:
    Interger(int i):i(i){}
    const Interger operator+(const Interger& rhs)
    {
        cout<<"Inside member operator+"<<endl;
        return Interger(i+rhs.i);
    }
    friend const Interger operator+(const Interger& lhs, const Interger& rhs);
private:
    int i;
};

const Interger operator+(const Interger& lhs, const Interger& rhs)
{
    cout<<"Inside friend operator+"<<endl;
    return lhs.i+rhs.i;
}
//优先调用member operator+
int main()
{
    Interger i1(12),i2(5);
    Interger i3=i1+i2;
}