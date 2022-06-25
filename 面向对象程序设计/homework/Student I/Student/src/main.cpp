#include<iostream>
#include"student.h"
#include<string>
#include<iomanip> 
#include<cmath>
#include<cstring>
using namespace std;
int course_number = 3; //number of courses
int table_width = 8;//format of output 
const int student_number = 10;//number of students

int main() {
	int *score_sum = new int[course_number];//storage the sum of score of every course
	float *average_score = new float[course_number];//storage the average score of every course
	int *min_score = new int[course_number];//storage the minimum score of every course
	int *max_score = new int[course_number];//storage the maximum score of every course
	memset(score_sum, 0, sizeof(int)*course_number);//set score_sum's values to 0
	Student *student_list = new Student[student_number];//storage all student's information
	for (int i = 0; i < student_number; i++) {
		student_list[i].set_student_name();
		student_list[i].set_student_score();
		student_list[i].get_average_score();
		for (int j = 0; j < course_number; j++) {
			if (!i) {//i = 0, initialize values of min_score and max_score by the first student's scores
				min_score[j] = student_list[i].get_student_score(j);
				max_score[j] = student_list[i].get_student_score(j);
			}
			else {//update the minimum and maximum scores
			if (min_score[j] > student_list[i].get_student_score(j))
				min_score[j] = student_list[i].get_student_score(j);
			if (max_score[j] < student_list[i].get_student_score(j))
				max_score[j] = student_list[i].get_student_score(j);
			}
			score_sum[j] += student_list[i].get_student_score(j);//add the student's scores to score_sum
		}
	}
	cout << setiosflags(ios::left) << setw(table_width);
	cout << "no      name    score1  score2  score3  average" << endl;
	for (int i = 0; i < student_number; i++) {
		cout << setw(table_width) << (i + 1);//output the number of the student
		student_list[i].print_student_info();//print the student's information
	}
	cout << setprecision(1) << setiosflags(ios::left);//set the precision of minimum scores and maximum scores 
	cout << setw(table_width) << "";
	cout << setw(table_width) << "average";
	for (int j = 0; j < course_number; j++) {
		//get average score of every scorse and output
		average_score[j] = score_sum[j] / (float)student_number;
		cout << setw(table_width) << average_score[j];
	}
	cout << endl << setw(table_width) << "";//an empty table
	cout << setw(table_width) << "min";
	for (int j = 0; j < course_number; j++) {
		cout << setw(table_width) << min_score[j];//output minimum scores
	}
	cout << endl << setw(table_width) << "";
	cout << setw(table_width) << "max";
	for (int j = 0; j < course_number; j++) {
		cout << setw(table_width) << max_score[j];//output maximum scores
	}
	return 0;
}
