### memory model

内存分为三个区：global data, stack, heap

global data --> static, global

stack -->local

heap --> allocate

```c++
//main.cpp
#include <iostream>
#include <cstdlib>
using namespace std;
int globalx = 1;
void f();
int main() {
	static int stacx = 1;
	int localx = 1;
	int *px = (int *)malloc(sizeof(int) * 3);
	cout << &globalx << endl;
	cout << &stacx << endl;
	cout << &localx << endl;
	cout << &px << endl;
	cout << px << endl;
}
/*
006CC000
006CC004
0118FC58
0118FC4C
012303B8
*/ 
```

global var:

defined outside fun.

can be shared btw .cpp files

extern(just a declaration)



### **static**

```c++
//another.cpp
#include <iostream>
#include <cstdlib>
using namespace std;
extern int globalx;

void f(){
    cout<<globalx<<endl;
}
```

if globalx is **static** ,it can only be used by main.cpp

if f() is **static** ,it can only be used by another.cpp

static var is initialized at its first access

it **keeps** value in between visits to the same function

```c++
#include <iostream>

using namespace std;

void f() {
	static int k = 4;
	cout << k++ << endl;
}
int main() {
	for (int i = 0; i < 3; i++) 
		f();
}
/*
4
5
6
*/
```

全局上，static表示访问限制（只能本文件访问）

本地上，static表示持久性（不在栈上）

### ptr to objects

```c++
#include <iostream>
#include<string>
using namespace std;

int main() {
	string s = "mbyyy";
	string *ps = &s;
	cout << ps->length() << endl;
}
```

对象的指针操作与一般类型变量指针的操作类似。

### memory allocation

#### new

分配内存的方式，只能通过指针进行访问。如下面的语句为psome处分配了10个int大小的空间。

```c++
int * psome = new int [10];
```

#### delete

删除一块或一段内存。

```c++
delete some;//释放一块内存
delete []some;//释放一段内存
```

```c++
#include <iostream>
#include <cstdlib>
using namespace std;
struct student {
	int id;
	student() {
		id = 0;
		cout << "stduent::student()" << endl;
	}
    
	~student() {
		cout << "student::~student()" << endl;
	}
};

int main() {
	student* ps1 = (student*)malloc(sizeof(student));
	cout << ps1->id << endl;
	student* ps2 = new student;
	cout << ps2->id << endl;
	free(ps1);
	delete ps2;
}
-842150451
stduent::student()
0
student::~student()
```

**new calls stduent::student(), delete calls student::~student(),but malloc() doesn't**

！不要delete不是new出来的内存 or delete同一块内存两次

！不要忘记delete内存 防止内存泄露

分配内存的多少存储在头指针的前一个位置。

## reference

- 在定义时或函数调用时就必须被初始化
- 一旦被定义，就不能再绑定别的变量
- 引用的目标必须有一个location，如int &ref = i*3 是非法的

```c++
void g(int &x){
    x++;
}

int x;
int& h(){
    return x;
}

void fun(int &x){
    ...//fun(i*3) error!
}

int main(){
    int a = 0;
    g(a);//a++
    h() = 16;//return value can be a reference
    printf("%d ",x);
}
```

*no reference to references

*no arrays of references

## const

read-only

```c++
const int x = 123;
//x++;// illegal
//x = 27; //illegal
const z = x;//ok 
```

* avoid creating storage for a const
* can be storaged in header
* in symbol table, not real variable
* 但extern 声明或取地址会强行为const分配内存

```c++
int x;
cin >> x;
const int size = x;
double a[size]; // error!

char s[] = "abc";
char *const q = s;// q is const
*q = 'c' ; //ok
q++;// error
    
const char *p = s; //*p is const
*p = 'b';//error;
p++; // ok

const int ci = 3;
int *ip = ci; //error

```

```c++
char *s = "Hello world";
cout << s << endl;
s[0] = 'B'; // error, cannot convert from string to char*
```

我们总可以把非const变量看做const的，但反之不行。

good example:

```c++
void foo(const student & s);
```

## course03 

### class

separated .h and .cpp files are used to define class

class declaration and function prototypes: .h file

bodies of function: .cpp file

::resolver

```c++
void S::f(){
    ::f();//global f(), would be recursive otherwise!
    ::a++;//gloabal a;
    a++;//member of calss S
}
```

在编译的时候，编译器只看到.cpp文件并生成.obj 文件，连接器将所有obj文件连接为可执行文件。

global var should be defined in the header file.

继承：

```c++
//line_seg.h
#ifndef _LINE_SEG_H_
#define _LINE_SEG_H_
#include "point.h"
class line{
  Point begin,end;  
};
#endif
```

```c++
 #ifndef  __SOMEFILE_H__

#define   __SOMEFILE_H__

 ... ... // 声明、定义语句

#endif

   

方式二：

#pragmaonce

 ... ... // 声明、定义语句
```

### CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 2.8.9)
project(point_design)
add_executable(point_design main.cpp point.cpp)

```

run:

```
mkdir build
cd build
cmake ..
make
./point_design
```

### C'tor and D'tor

The constructor can have arguments to allow you to specify how an object is created, give it initialization values, and so on.

{} 决定对象作用域，执行出花括号时自动执行析构函数。

即使中途直接return 0，析构函数也会自动执行。(只要变量生命周期结束)

编译器会在 { 处为scope里分配所有内存，但构造函数在对象定义时才会被执行。

```c++
class A{
    private: 
        int x;
    public: 
  		A(){
            cout << "111"<<endl;
        } 
};

int main(){
    A a1;
    cout <<< a1 << endl;
    goto tmp;
    A a2;
    cout << "a2" <<endl;
    tmp:
    	return 0;
}
```

error:跳过了a2的初始化.

A default constructor is one that can be called  with no arguments.

(默认构造函数)

```c++
struct Y {
    float f; 
    int i; 
    Y(int a);
};
//
Y y2[2] = { Y(1) };
```

error: no matching constructor

![image-20220526204822265](E:\typorapic\image-20220526204822265.png)

A local variable of the same name as a field will prevent the field from being accessed within a method.

### this 

this指针 == 对象地址，可以找到调用成员函数的变量。

### Initializer list 初始化列表

```c++
struct B{
    int i;
    B(int i){
        this->i = i;
        cout << "B::B()" << endl;
    }
};

Class Point {
   B b;
   A() : b(10) {
        cout << "A::A()" << endl;
    }
};

//out
//B::B()
//A::A()
```

**Order of initialization is order of declaration – **

**Not the order in the initializer list! **

Destroyed in the reverse order.

```c++
A(){
    b = ....
}
```

is equal to 

```c++
A() : b(){
    b = ....
}
```

so if choose way2, b **must have a default constructor**.

### Function overloading (重载)

只能根据参数值进行重载, 不能**仅根据**返回值重载函数.

```c++
void f(int i); 
void f(double d);
f('a'); 
f(2);
f(2L);//error
f(3.2f);//choose double
```

### Default arguments

```c++
Stash(int size, int initQuantity = 0);
```

**To define a function with an argument list,defaults must be added from right to left.**

```c++

int harpo(int n, int m = 4, int j = 5); 

int chico(int n, int m = 6, int j); //illegal 

int groucho(int k = 1, int m = 2, int n = 3);

```

声明之后,编译器自动补全参数

### const object

函数后加const以保护内部的字段不变.

![image-20220526220223667](E:\typorapic\image-20220526220223667.png)

类内的const变量应该在初始化列表里赋值：否则无法在构造函数内部赋值！

（下面这部分没看懂

![image-20220526221132432](E:\typorapic\image-20220526221132432.png)

inline function

- 没有普通函数的堆栈调用过程
- 是替换而非调用
- 应该被写在头文件中
- 无需担心重复定义问题

一般来说，inline函数适用于很短，且频繁用到的函数，当编译器发现inline函数太长或其调用自身时可能会报错。（inline函数不允许递归，事实上它甚至不可能完成递归！）

## oop3.21

### Composition(组合)

objects are used to build other objects.

### Name Hiding

public: all

private: visiable only by self and friends

protected: visiable only by self and friends and class derived by it.

### friend

can be global function, member function, entire class.

if B is A's friend, B can visit private members of A, but A cannot visit private members of B.

```c++
#include<iostream>
using namespace std;
class Base{
   public:
     int data;
     Base(): data(10){}
 };
class Derived : public Base {
    
};

int main(){
    Base b;
    Derived d;
    cout << b.data << " " << d.data << endl;
    cout << sizeof(b) << " " << sizeof(d)<< endl;
    int *p = (int*)&b;
    cout << p << " " << *p;
}

```

10 10
4 4
0x70fe00 10

说明对象b就是一个整数。因此，借助p对b进行赋值是可能的。

```c++
#include<iostream>
using namespace std;
class Base{
   public:
     int data;
     Base(): data(10){}
 };
class Derived : public Base {
    public:
    int i;
    Derived() : i(20){}
    void print_i(){cout << i << endl;}
};

int main(){
    Base b;
    Derived d;
    cout << b.data << " " << d.data << endl;
    cout << sizeof(b) << " " << sizeof(d)<< endl;
    int *p = (int*)&d;
    cout << p << " " << *p << endl;    
    d.print_i();
    p++;
    *p = 50;
    d.print_i();
}

```

10 10
4 8
0x70fdf0 10
20
50

继承的data和自身的 i 放在了相邻位置上，继承的变量在对象的最前端，自身的成员变量向后排列。

**即使将i设置为private，也可以通过指针修改。**

## 多态

基类shape拥有函数render，类长方形，椭圆继承shape，想要根据实际对象的类型调用不同的render，使用virtual关键字。

```c++

#include<iostream>
using namespace std;
class Shape{
  public:
    void move(){}
    virtual void render(){
        cout << "Shape::render" <<endl;
    }
};
class Ellipse : public Shape{
  public:
    virtual void render(){
        cout << "Ellipse::render" << endl;
    }
};
class Circle: public Ellipse{
	public:
  	virtual void render(){
      cout << "Circle::render" << endl;
  }  
};

void foo(Shape *s){
    s->render();
}


int main(){
    Ellipse e;
    Circle c;
    foo(&e);
}
//Ellipse::render
```



```c++
#include<iostream>
using namespace std;
class Base{
   public:
     int data;
     Base(): data(10){}
     virtual void foo(){cout << "Base::foo(): data = " << data << endl;}
     virtual void bar(){
         cout << "Base::bar()" << endl;
     }
 };
class Derived : public Base {
    public:
    int i;
    Derived() : i(20){}
    void print_i(){cout << i << endl;}
};

int main(){
    Base b;
    b.foo();
    b.bar();
    cout << sizeof(b) <<  endl;
    int *p = (int*)&b;
    cout << *p << endl;
    p++;
    cout << *p << endl;
    p++;
    cout << *p << endl;
    p++;
    cout << *p << endl;
   
}
/*
Base::foo(): data = 10
Base::bar()
16
4785328
0
10
0
    */
```

原理：vptr指针指向虚函数表

![image-20220411080514241](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220411080514241.png)

## 4.11

```c++
elly(20F, 40F);
circ(60F);
elly = circ;
```
• Area of circ is sliced off
–(Only the part of circ that fits in elly gets copied)
• Vptr from circ is ignored; the vptr in elly points to 
the Ellipse vtable
(&elly)->render(); // Ellipse::render()

### Return types relaxation (current)

```c++
class Expr{
public:
virtual Expr* newExpr();
virtual Expr& clone();
virtual Expr self();
};
class BinaryExpr: public Expr{
public:
virtual BinaryExpr* newExpr(); // ok
virtual BinaryExpr& clone(); // ok
virtual BinaryExpr self(); // Error!
};
```

**only for D* and D&**

If you override an overloaded function, you  must override all of the variants!

 –Can't override just one 

–If you don't override all, some will be hidden

### Abstract classes

#### interface:

所有函数都是pure virtual function

```c++
class Base {
public:
	int data;
	Base() : data(10) {}
	virtual void bar0() = 0;//pure vitrual function, Base is abstract class
};
class Derived : public Base {
public:
	int i;
	Derived() : i(20) {}
	void bar0() override { cout << "Derived" << endl; }
};
```

### Copy Ctor

构造函数可以重载，在赋值时调用拷贝构造函数。

```A a = bc++ 
A b;
A a = b;//不会调用自己写的构造函数，而是拷贝构造函数（如果未写则自动生成）
/** A a = b 等价于 A a(b)**/
```

```c++
T::T(const T&){
    /*copy memorywise*/
}；
```

手写：

```c++
struct B{};
class A {
	//copy Ctor
	A(const A& a) : i(a.i), f(a.f), b(a.b), s(a.s) {

	}
    
private:
	int i;
	float f;
	B b;
	char* p;
	string s;
};
```

在使用默认拷贝构造时相同成员地址相同（浅拷贝），如果析构使用delete，则会导致一块地址delete多次，应该手写拷贝构造（深拷贝）

```c++
struct person {
	char* name;
	person(const char* s) {
		name = new char[strlen(s) + 1];
		strcpy(name, s);
	}
	person(const person& other) {
		name = new char[strlen(other.name) + 1];
		strcpy(name, other.name);
	}
	~person() { delete[] name; }
};

int main() {
	person p1("Alice");
	person p2 = p1;
	cout << (void*)p1.name << endl;
	cout << (void*)p2.name << endl;
}
```

返回值为一个对象时也会调用拷贝构造函数。

```c++
Person foo(Person p){
    return p;
}//call Ctor twice(complier optimization)
Person bar(char *s){
    return Person(s);
}

Person s = Person("Alice")// call Ctor once because of complier optimization
```

### static 

- 存储在固定的区域，只被分配一次
- 作用域有局限性，只在本cpp文件中可用

```c++
#include<iostream>
using namespace std;
class A{
    public: A(){cout << "A::A()" << endl;}
    ~A(){cout <<"~A()" << endl;}
    
};

void f(){
    static A a;
    cout << "f()" << endl;
}

int main(){
	f();
    f();
}
```

**静态成员变量的定义要放在类外：**

```c++
class A{
    private:
    	static int data;
    public:
    	A(){}
   		void setdata(){this->data = i;}    
};

int A::data;//important!!!
```

因此，静态变量**不能**放在初始化列表中初始化。

- 在静态成员函数中不能直接访问类内的非静态成员变量。
- 调用方式： a.data or A::data(better)

### 运算符重载

重载前后必须遵循：

- 操作数数量不变
- 优先级保留
- `::`, ` ? : ` 不能被重载，自己写的运算符也不行。

```c++
operator *(...)
```

e.g.

```c++
String String::operator+(const String& that);//this is hidden, so still 2 operends
x + y // == x.operator+(y)
```

区分前缀和后缀：++i， i++

后缀重载时参数为int，前缀无参数

当重载运算符声明为一个类的成员时，需要省去第一个参数，而如果写在类外，需要friend 和 将所有函数显式写出来。

```c++
T& operator ++(); //++t
T operator++(int); //t++
```

重载赋值函数时应该先delete已有内容

问题：self-assignment：判断是否是自我赋值//(if that == this) return *this;

![image-20220621182113595](E:\typorapic\image-20220621182113595.png)

![image-20220621182417068](E:\typorapic\image-20220621182417068.png)

重载运算符的原型： prototypes

![image-20220621183129629](E:\typorapic\image-20220621183129629.png)

**[]返回一个引用，因为可能需要下标赋值**

**[]必须是成员函数**

后置++有一个int参数（传入0）

后置++可以使用前置++.

```c++
Integer& Integer::operator++(){
    this->i += 1;
    return *this;
}
```

```c++
Integer Integer::operator++(int){
    Integer old(*this);
    ++(*this);
    return old;
}
```

赋值符号重载的模板：

![image-20220621185426643](E:\typorapic\image-20220621185426643.png)

#### conversion

![image-20220621185713194](E:\typorapic\image-20220621185713194.png)

声明类型转换运算符：

```c++
X::operator T();
```

避免隐式类型转换：explicit

```c++
T obj(abc); //yes
T obj = abc;//error
```



#### Functor

重载函数调用运算符，是一个和函数功能类似的对象

```c++
struct F {
    void operator() (int x) const{
        cout << x << endl;
    }
}; //F is a Functor
F f;
f(2);

void transform(vector<int> &v, int (*f)(int)){
    for(int &x : v){
    	x = f(x);
	}
}
int main(){
	vector<int> v = {1,2,3,4,5};
    /*for(int &x : v){
        x *= 5;
    }*/
    transform(v, [](int x){return x*5;})//lambda 表达式
    for(int &x : v){
        x *= x;
    }
    for(int &x : v){
        x += 3;
    }
}
```

函数指针也可以写成function形式。

lambda表达式事实上就是一个仿函数

```c++
class mul_by{
	public:
    mul_by(int a) : a(a) {}
    int operator()(int x){
        return x * a;
    }
    private:
    int a;
};

transform(v, mul_by(5));//x *= 5
transform(v, mul_by(7));//x *= 7
```



### explict

不希望其他类型的变量隐式转换

### stream

好处：

类型更安全

可扩展性，如输出一个对象

更面向对象

```c++
<iostream>
<fstream>
<strstream>//CString
<sstream>// c++ String
```

#### Extractor

#### Insertors

#### Manipulators

重载

```c++
istream& operator>>(istream &is, T&obj){
    return is;
}
```

## 5.8 Templates

- function template e.g. sort()
- class tmeplate e.g. stack, list, 

### Function templates

ex:

```c++
//swap 2 var of any type
template<class T>
void my_swap(T& a, T& b){
    T tmp = a;
    a = b;
    b = tmp;
}
```

- 不允许隐式转换

  ```c++
  swap(int, double) //error
  ```

  可以与常规函数并存

  重载规则：

  - 先寻找唯一匹配的函数
  - 再寻找唯一匹配的模板函数
  - 再寻找隐式转换的函数

### 实例化

- 从输入参数中获取类型

- 在函数后使用<>说明，例如函数没有参数时，需要说明T类型， 或函数参数一个为int，一个为double时需要说明实际采用的类型。

### Class templates 类模板

```c++
template <class T>
class Vector{
    public:
    Vector(int);
    ~Vector();
    Vector(const Vector&);
    Vector& operator=(const Vector&);
    T& operator[](int);
    private:
    T* size;
    int m_size;
}
template <class T>
Vector<T>::Vector(int size): m_size(size) {
    
}
```

模板头中可以有普通参数

```c++
template<class T, int bounds = 100>
```

#### (CRTP)

```c++
template <class T>
class Base{
    
};

class Derived: public Base<Derived>{
    
};
```

模板函数应该放在h文件中。

## STL

### vector

emplace_back与push_back区别：

前者可以传入对象或构造函数的参数表，后者只能传入对象。

### copy

```c++
vector<int>v{1,2,3,4};
copy(v.begin(), v.end(), ostream_iterator<int>(cout, ", "));
```

### map

```c++
if(mymap["foo"] == 1){
    //error, silently create "foo" entry.
    //judge if(mymap.count("foo")) first
    //or use mymap.contain("foo") in c++20
}
```

- use empty() instead of size()==0 in list, vector..
- li = L.erase(li);,
- not L.erase(li): invalid iterator

### Iterators

**to be done**

## 异常

- 一个好的程序应该捕捉运行时错误并handle
- 古老的方法是：函数根据不同的执行情况返回不同错误码
- 但会和正常代码逻辑混杂，并占用返回值位置

```c++
template <class T>
T& Vector<T>::operator[] (int idx){
    //what if idx is invalid?
    return m_elements[idx];// 避免越界检查消耗多余时间
    
    if(idx < 0 || idx >= m_size){
		return error_code;//v[2] + v[4]...
        //ugly
    }
    return m_elements[idx];
    
    assert(idx >= 0 && idx < m_size);//only for debug
    
    if(idx < 0 || idx >= m_size)
    	throw VectorIndexError(idx);  
}
```



```c++
void outer(){
    try{
        func();
    } catch (VextorIndexError *e){
        cout << err;
        throw;// catch到什么就throw什么
    }
}
```



```c++
catch(...)//ALL exceptions
```



## 智能指针

### std::unique_ptr

```c++
#include<iostream>
#include<memory>
using namespace std;
class A{
  //omitted  
};
int main(){
    std::unique_ptr<A> pa(new A());//bad
    auto pa = make_unique<A>();//good, but -std=c++14
    
    A->foo();
    
}
```

unique含义：独占式，唯一的所有者，因此无法进行拷贝构造

通过std::move() 更改所有权

```c++
auto pa = make_unique<A>();
auto pa2 = std::move(pa);
pa->foo(); //段错误，此时pa已经空了
```

事实上，move之后pa2地址与之前pa相同，pa地址变为**0**。

### shared_ptr

```c++
#include<iostream>
#include<memory>
using namespace std;
class A{
  //omitted  
};
int main(){
    shared_ptr<A> pa2;
    {
        auto pa = make_shared<A>();//good
        pa2 = pa;//ok
    }
    cout << "foo" << endl;
}

```

foo打印后A才被析构，尽管pa的生命周期已经结束了，这是因为A被共享给了pa2。

### weak_ptr

不占用管理权，但可以**看**所管理的对象

防止相互依赖，导致两个都无法释放。

### 引用计数

例：字符串浅拷贝

Initial value is 0

When do p = q

actually do:

```c++
p->decrement();
p = q;
p->increment();
```

## Final

选择 2*10

写出程序输出 30

单行程序填空 30

类设计 20

函数补全
