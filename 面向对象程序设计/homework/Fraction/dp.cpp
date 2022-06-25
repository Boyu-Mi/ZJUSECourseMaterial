#include<iostream>
#include<cstdio>
#include<vector>
#include<algorithm>
using namespace std;

const int max_ = 365*60*24;

int main(){
    int tm[100010];
    int bn[100010];
    vector< vector<int> > dp;
    int N,M;
    scanf("%d %d", &N, &M);    
    int sumtime = 0;
    for(int i = 0; i < N; i++){
        scanf("%d", &tm[i]);
        sumtime += tm[i];
    }
    for(int i = 0; i < N; i++)
        scanf("%d", &bn[i]);
    dp.resize(N + 10);
    for(int i = 0; i < dp.size(); i++){
        dp[i].resize(sumtime + 10);
    }
    for(int i = 0; i<= sumtime; i++){
        if(i < tm[N-1]){
            dp[N-1][i] = 0;
        }else
            dp[N-1][i] = bn[N-1];
    }
    for(int i = 0; i < N; i++){
        dp[i][0] = 0;
    }
    for(int i = N - 2; i >= 0; i--){
        for(int j = 0; j <= sumtime; j++){
            if(j >= tm[i] && bn[i] + dp[i + 1][j - tm[i]] > dp[i + 1][j]) {
                dp[i][j] = bn[i] + dp[i + 1][j - tm[i]];
            }
            else
                dp[i][j] = dp[i + 1][j];
        }
    }
    cout << dp[0][M];
    return 0;
}