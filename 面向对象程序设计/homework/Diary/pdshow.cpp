#include "diary.h"
#include "diarylist.h"
using namespace std;
const string diary_path = ".\\diary.txt";
int main(int argc, char** argv){
  string date = argv[1];
  Diarylist list = Diarylist(diary_path);
  list.display_diary(date);//print the date and content
  return 0;
}
