#include "diary.h"
#include "diarylist.h"
//constructor
Diarylist::Diarylist(string f_path){
  ifstream f;
  f.open(f_path);
  string date,str;
  vector<string> new_content;
  while(getline(f,date)){//get the date, when date is empty, terminate the input
    Diary tmp;
    while(getline(f,str)){
      if(str == ".") {
        break;
      }
      new_content.push_back(str);//add to new_content
    }
    tmp.set_date(date);
    tmp.set_content(new_content);
    diary_list.push_back(tmp);//add it to diary list
    new_content.clear();
  }
  f.close();
}
//write the diary list into the file
void Diarylist::write_list(string f_path){
  ofstream f_out;
  f_out.open(f_path);
  vector<Diary>::iterator iter = diary_list.begin();
  while(iter!=diary_list.end()){//write the diaries to the file
    f_out << iter->get_date() << endl;
    int size = iter->get_content().size();
    for(int i = 0; i < size; i++) {
      f_out << iter->get_content()[i] << endl;
    }
    f_out << "." << endl;
    iter++;
  }
  f_out.close();
}
//add a dairy into list
void Diarylist::add_diary(string date, vector<string> new_content){
  string str;
  vector<Diary>::iterator iter = diary_list.begin();
  while(iter != diary_list.end()){//find the proper insertion position
    if(date > iter->get_date())
      iter++;
    else
      break;
  }
  //insert the new diary
  if (iter != diary_list.end() && date == iter->get_date()){
    iter->set_content(new_content);//replace
  }
  else{
    Diary tmp;
    tmp.set_date(date);
    tmp.set_content(new_content);
    diary_list.insert(iter,tmp);
  }
}
//display the diary of a date
void Diarylist::display_diary(string date){
  vector<Diary>::iterator iter = diary_list.begin();
  while(iter != diary_list.end()){//find the proper insertion position
    if(date == iter->get_date()){
      iter->display();
      break;
    }
    else
      iter++;
  }
}
