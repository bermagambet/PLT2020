#include <stdio.h>
#include <iostream>
#include <vector>
#include <string>


using namespace std;

static vector<string> strings;
static vector<string> strings2;
static vector<string> strsolv;
static vector<string> strsolv2;
static bool nobound = false;
static int cnt, cnt2;

string solvmul(string s, string s2s)
{
    int a, b;
    a = stoi(s);
    b = stoi(s2s);
    return to_string(a*b);
}
string solvadd()
{
    int answer = 0;
    for(int i = 0; i < strsolv.size(); i++){
       if(strsolv[i] == "+" || strsolv[i] == "-" ){
           answer++;
       }
    }
    for(int j = 0; j < answer; j++){
        for(int i = 0; i < strsolv.size(); i++){
        if(strsolv[i] == "+"){
            strsolv[i-1] = to_string(stoi(strsolv[i-1]) + stoi(strsolv[i+1]));
            strsolv[i+1] = "0";
        }
        if(strsolv[i] == "-"){
            strsolv[i-1] = to_string(stoi(strsolv[i-1]) - stoi(strsolv[i+1]));
            strsolv[i+1] = "0";
        }
        }
    }

    return strsolv[0];
}

string solv()
{
    string s;
    int res;
    int cnttt = 0;
    for(int i = cnt + 1; i < cnt2; i++){
        if(strings[i] == "*"){
            cnttt++;
        }
    } 
    for(int j = 0; j < cnttt; j++){
        for(int i = cnt + 1; i < cnt2; i++){
            if(strings[i] == "*"){
            strings[i-1] = solvmul(strings[i-1], strings[i+1]);
            strings[i+1] = "1";
            }
        } 
    }

    if(cnttt == 0){
        for(int i = cnt + 1; i < cnt2; i++){
            strsolv.push_back(strings[i]);
        }
    }
    else
    {
        for(int i = cnt + 1; i < cnt2; i++){
        strsolv.push_back(strings[i]);
        if(strings[i] == "*"){
            strsolv.pop_back();
            i++;
        }
    } 
    }
    return solvadd();

}

string expr()
{
    int castcnt = 0;

    nobound = false;
    for(int i = 0; i < strings.size(); i++){
        if(strings[i]=="("){
            nobound = true;
            cnt = i;
            castcnt++;
        }
        if(strings[i]==")"){
            castcnt--;
            if(castcnt <= 0){
                break;
            }
        }
    }
     if(nobound == false){
        cnt = -1;
        cnt2 = strings.size();
    }
    else{
    for(int i = cnt; i < strings.size(); i++){
        if(strings[i]==")"){
            cnt2 = i;
            break;
        }
    }
    }
    return solv();
}

int main(void)
{
    int brackcnt = 0;
    string inp;
    
    while(1)
    {
    cin >> inp;
    if(inp == "end"){
        break;
    }
    strings.push_back(inp);
    strings2.push_back(inp);
    }
    cout << endl << "The expression is:" << endl;
    for(int i = 0; i < strings.size(); i++){
        cout << strings[i];
        if(strings[i] == "("){
            brackcnt++;
        }
    }
    // while(true){
    // cout << expr();
    // }

    string rep;
    for(int k = 0; k <= brackcnt + 1; k++){
    rep = expr();
    strings.clear();
    for(int i = 0; i < strings2.size(); i++){
        if(nobound == true){
        if(i == cnt){
            strings.push_back(rep);
        }
        if(i < cnt || i > cnt2){
            strings.push_back(strings2[i]);
        }
        }
        else
        {
            strings.push_back(rep);
            break;
        }
    }
    
    strings2.clear();
    for(int i = 0; i < strings.size(); i++){
        strings2.push_back(strings[i]);
    }
    strsolv.clear();

    }
    cout << endl;
    cout << "The answer is: " << strings[0];
    return 0;
}