#include <iostream>

using namespace std;

class A {
	int i;
public:
	A(int ii = 0) :i(ii) { cout << "call A(int ii=0)" << endl; }
	A(const A& a)
	{
		i = a.i;
		cout << "call A(const A&)" << endl;
	}
	void print()const { cout << "A::i=" << i << endl; }
};

class C
{
public:
	C() { cout << "call C()" << endl; }
};

class B :public A {
	int i;
	C c;
	A a;
public:
	B(int ii = 0) :i(ii) { cout << "call B(int ii=0)" << endl; }
	B(const B& b)
	{
		i = b.i;
		cout << "call B(const B&)" << endl;
	}
	void print() const
	{
		A::print();
		cout << "B::i=" << i << endl;
	}
};

int main()
{
	B b(2);
}