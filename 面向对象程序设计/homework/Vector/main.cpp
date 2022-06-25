#include <iostream>
#include <string>
#include "Vector.h"
using namespace std;
class Student {//class for test
public:
  Student(){}
  Student(string name, int score) : student_name(name), student_score(score) {}
  Student(Student &s) : student_name(s.student_name), student_score(s.student_score) {}
  ~Student() {}
  void StudentPrintInfo(){
    cout << "the student's name is " << student_name << endl;
    cout << "the student's score is " << student_score << endl;
  }
private:
  string student_name;
  int student_score;
};

void VectorPrintInfo(Vector<Student> v){
  cout << "size of v: " << v.size() << endl;
  cout << "capacity of v: " << v.capacity() << endl;
  cout << "if v is empty: " << v.empty() << endl;
  if(v.size() == 0){
    cout << "the vector is empty" << endl;
  }
  for(int i = 0; i < v.size(); ++i){
    cout << "v[" << i << "] :" << endl;
    v[i].StudentPrintInfo();
    cout << endl;
    cout << "v.at(" << i << ") :" << endl;
    v.at(i).StudentPrintInfo();
    cout << endl;
  }
}

int main(){
  //for test
  Vector<Student> v1;
  Vector<Student> v2(5);
  Student A("Alice", 90);
  Student B("Bob", 91);
  Student C("Carol", 92);
  Student D("David", 93);
  Student E("Eve", 94);
  Student M("Mallory", 95);
  cout << "=============test Ctor=============" << endl;
  cout << "v1:" << endl;
  VectorPrintInfo(v1);
  cout << "v2:" << endl;
  VectorPrintInfo(v2);
  cout << "=============test push_back and index=============" << endl;
  cout << "push back 5 students into v2" << endl;
  v2.push_back(A);
  v2.push_back(B);
  v2.push_back(C);
  v2.push_back(D);
  v2.push_back(E);
  cout << "v2:" << endl;
  VectorPrintInfo(v2);
  cout << "=============test inflate=============" << endl;
  cout << "after push back another item into v2" << endl;
  v2.push_back(M);
  cout << "v2:" << endl;
  VectorPrintInfo(v2);
  cout << "=============test copy Ctor and clear=============" << endl;
  cout << "v3 is a copy of v2; clear v2" << endl;
  Vector<Student> v3 = v2;
  v2.clear();
  cout << "v2:" << endl;
  VectorPrintInfo(v2);
  cout << "v3:" << endl;
  VectorPrintInfo(v3);
  return 0;
}