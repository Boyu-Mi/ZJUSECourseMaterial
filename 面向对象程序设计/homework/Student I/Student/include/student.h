#ifndef STUDENT_H
#define STUDENT_H
#include<string>
using namespace std;
extern int course_number; 
class Student {
public:
	void set_student_name();//set student_name from input
	void set_student_score();//set student's scores from input
	void get_average_score();//set student's average score by scores
	void print_student_info();//print student's information
	int get_student_score(int i);//get student's score of course i
	float get_student_average_score();//get student's average score
	string get_student_name();//get student's name
	Student() :student_score(new int[course_number]) {}
	~Student() {}
private:
	string student_name;
	int *student_score;//array of student's scores
	float student_average_score;//student's average score
};
#endif
