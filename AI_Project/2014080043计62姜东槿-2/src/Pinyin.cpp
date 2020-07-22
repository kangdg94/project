#include "chinese.h"
#include "Dictionary.h"
#include "Trainning.h"
#include <cstdio>
#include <cstring>
#include <iostream>
#include <algorithm>
#include <fstream>
using namespace std;

double t[200][200];
int f[200][200];
int input[1001];
chinese ans[1001];
bool getline(string &s) {
	s = "";
	char cha = getchar();
	
	if (cha == EOF) return false;
	
	while (cha != '\n'&&cha != EOF) {
		if (cha >= 'A'&&cha <= 'Z') cha += 'a' - 'A';
		s += cha;
		cha = getchar();
	}
	return true;
}
void output(ZiKu* ziku, int k, int j) {
	if (k == -1) return;
	output(ziku, k - 1, f[k][j]);
	ziku->b[ziku->at[input[k]][j]].output();
	ans[k] = ziku->b[ziku->at[input[k]][j]];
}
int main() {
	ZiKu *ziku = new ZiKu();
	ziku->init("yierjihanzibiao.txt", "pinyinhanzibiao.txt");
	Trainer *trainer = new Trainer("../sina_news/", ziku);
	ifstream fin("num.out");
	unsigned long a, b, c;
	fin >> a;
	while (a != -1) {
		fin >> b;
		trainer->num[a] = b;
		fin >> a;
	}
	while (fin >> a >> b >> c) {
		trainer->num2[a][b] = c;
	}
	fin.close();

	freopen("1.in", "r", stdin);
	freopen("1.out", "w", stdout);
	int tot1 = 0, tot2 = 0, num1 = 0, num2 = 0;
	while(1){
		for (int i = 0; i < 113; i++)for (int j = 0; j < 113; j++)t[i][j] = 0;
		memset(f, 0, sizeof(f));
		int n = 0;
		string str;
		if (!getline(str)) break;
		cout << "s=" << str << endl;
		tot1++;
		while (str.length() > 0) {
			int t = str.find(' ');
			string ss = str.substr(0, t);
			input[n++] = ziku->getPinyinNumber(ss);
			tot2++;
			if (str.length() <= ss.length()) break;
			str = str.substr(t + 1, str.length());
		}
		for (unsigned int j = 0; j < ziku->at[input[0]].size(); j++)
			t[0][j] = trainer->num[ziku->at[input[0]][j]];
		
		for (int i=1;i<n;i++)
		
			for (unsigned int j=0;j<ziku->at[input[i]].size();j++)
		
				for (unsigned int k = 0; k < ziku->at[input[i - 1]].size(); k++) {
		
					double P = trainer->num2[ziku->at[input[i - 1]][k]][ziku->at[input[i]][j]];
		
					double tmp = t[i - 1][k] * (P + trainer->num[ziku->at[input[i - 1]][k]] / 50000.0 + trainer->num[ziku->at[input[i]][j]] / 50000.0);
		
					if (tmp > t[i][j]) {
		
						t[i][j] = tmp;
		
						f[i][j] = k;
					}
				}
		double res = 0;
		
		int that;
		
		for (unsigned int j=0;j<ziku->at[input[n-1]].size();j++)
			if (t[n - 1][j] > res) {
				res = t[n - 1][j];
				that = j;
			}
		output(ziku, n - 1, that);
		cout << endl;
		bool flag = true;
		for (int i = 0; i < n; i++) {
			char x = getchar(), y = getchar();
			chinese tmp = chinese(x, y);
			if (tmp == ans[i]) num2++;
			else flag = false;
		}
		if (flag) num1++;
		getchar();
	}
	cout << endl << endl;

	cout<< num2 << "/" << tot2 << "     " << 100.0*num2 / tot2 << "%" << endl;

	cout<< num1 << "/" << tot1 << "     " << 100.0*num1 / tot1 << "%" << endl;

	return 0;
}

