#include <iostream>
#include <string>
using namespace std;

class Exception
{
public:
	Exception(string name="None"):m_Name(name)
	{
		cout << "Exception(string)" << endl;
	}
	Exception(const Exception& e)
	{
		m_Name = string("ex_") + e.m_Name;
		cout << "Exception(const Exception&)" << endl;
	}
	virtual ~Exception()
	{
		cout << "~Exception(),name=" << m_Name << endl;
	}
protected:
	string m_Name;
};
class A
{
public:
	A()
	{
		cout << "A()" << endl;
	}
	int f(int i)
	{
		if (i >= 10)
		{
			Exception ex_obj1("ex_obj1");
			throw ex_obj1;
		}
		else
			return i;
	}
	~A() { cout << "~A()" << endl; }
	
};
int main()
{
	try
	{
		A a;
		a.f(10);
		A b;
		b.f(10);
	}
	catch (Exception e)//注意有&和无&输出的区别
	{
		cout << "Catched" << endl;
	}
	catch (...)
	{
		cout << "Unknown exp catched" << endl;
	}
}