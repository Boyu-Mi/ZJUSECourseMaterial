#include<iostream>
using namespace std;
class Base{
    public:
    int i;
    void f(int a){
        cout << "Base" << a << endl;
    }
    void f(string a){
        cout << "Base " << a << endl;
    }
};

class Derived : public Base{
    public:
    void f(int a){
        cout << "Derived " << a << endl;
    }
};

int main(){
    Derived d;
    d.f("233");

}