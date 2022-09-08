#include<iostream>
using namespace std;
int a[15][2];
int result[15];
int vis[15];
int size = 0;
int N;
bool dfs(int i){
  if(i == N) return true;
  int num1 = a[i][0];
  int num2 = a[i][1];
  bool tmp = false;
  if(vis[num1] == 0){
    vis[num1] = 1;
    tmp = dfs(i + 1);
    if(tmp){
      result[i] = num1;
      return true;
    }
    vis[num1] = 0;
  }

  if(vis[num2] == 0){
    vis[num2] = 1;
    tmp = dfs(i + 1);
    if(tmp){
      result[i] = num2;
      return true;
    }
    vis[num2] = 0;
  }

  return false;
}
int main(){
    cin >> N;
    for(int i = 0; i < N; ++i) vis[i] = 0;
    for(int i = 0; i < N; ++i){
        cin >> a[i][0] >> a[i][1];
    }
    dfs(0);
    for(int i = 0; i < N; i++){
      cout << result[i] << endl;
    }
}
