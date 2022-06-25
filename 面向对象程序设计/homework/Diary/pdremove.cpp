#include "diary.h"
#include "diarylist.h"
using namespace std;
const string diary_path = ".\\diary.txt";
int main(int argc, char** argv){
  string date = argv[1];
  Diarylist list = Diarylist(diary_path);
  vector<Diary>::iterator iter = list.diary_list.begin();
  while(iter != list.diary_list.end() && iter->get_date() != date){//find the diary to be deleted
    iter++;
  }
  if(iter == list.diary_list.end()){// no diary of such date
    exit(-1);
  }
  list.diary_list.erase(iter);//remove the diary
  list.write_list(diary_path);
  return 0;
}
