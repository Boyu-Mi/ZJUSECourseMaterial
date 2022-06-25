#include <iostream>
#include <string>
#include <iomanip>
using namespace std;
int main()
{
    char buffer[10];
    cin>>setw(9)>>buffer;//输入0123456789
    string a=buffer;
    cout<<a<<endl;
}