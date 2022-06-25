#include "student.h"
#include<iostream>
#include<cstring>
#include<string>
#include<iomanip> 
#include<cmath>
extern int course_number;
extern int table_width; 
void Student::set_student_name() {
	cin >> student_name;
}

void Student::set_student_score() {
	/*set student's scores from input*/
	for (int i = 0; i < course_number; i++) 
		cin >> student_score[i];
}

void Student::get_average_score(){
	if (course_number > 0) {//the average score can be calculated only there are more than 1 courses	
		int sum = 0;
		for (int i = 0; i < course_number; i++)
			sum += student_score[i];//the sum of scores of a student
		student_average_score = sum / (float)course_number;
	}
	else
		student_average_score = 0;
}

int Student::get_student_score(int i) {
	if (i >= 0 && i < course_number)
		return student_score[i];
	else
		return 0;
}

float Student::get_student_average_score() {
	return student_average_score;
}

string Student::get_student_name() {
	return student_name;
}

void Student::print_student_info() {
	cout << setiosflags(ios::fixed) << setiosflags(ios::left);//set the output format: Align left
	cout << setw(table_width) << student_name;//set the width of a table
	for (int i = 0; i < course_number; i++)
		cout << setw(table_width) << student_score[i];//output scores
	float temp_average = get_student_average_score();
	if (abs(temp_average - (int)temp_average) < 1e-6) //the average score is an integer
		cout << setw(table_width) << (int)temp_average << endl;//output the average score
	else
		cout << setw(table_width) << setprecision(6) << temp_average << endl;//set precision of the float number
}
