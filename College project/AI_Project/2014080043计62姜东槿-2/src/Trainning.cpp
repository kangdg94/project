#include "chinese.h"
#include "Trainning.h"
#include "Dictionary.h"
#include <iostream>
#include <string>
using namespace std;
void Trainer::atongji(vector<chinese> &a) {
	for (unsigned int i = 0; i < a.size(); i++) {
		num[ziku->hao[a[i]]]++;
		if (i < a.size() - 1) num2[ziku->hao[a[i]]][ziku->hao[a[i + 1]]]++;
	}
}
void Trainer::train(const char* filename) {
	freopen(filename, "r", stdin);
	char x = getchar(), y = getchar();
	vector<chinese> text;
	while (x != EOF && y != EOF) {
		chinese tmp = chinese(x, y);
		if (S.find(tmp) == S.end() && ziku->hao.find(tmp) != ziku->hao.end()) {
			text.push_back(tmp);
			x = getchar(), y = getchar();
		}
		else {
			atongji(text);
			text.clear();
			if (S.find(tmp) != S.end())
				x = getchar(), y = getchar();
			else
				x = y, y = getchar();
		}
	}
}
void Trainer::train_all() {
	string s;
	for (int i = 1; i <= 11; i++) {
		s = (string)(i<10?"":"1")+(char)('0'+i%10)+".in";
		train(s.c_str());
	}
}
void Trainer::output(const char * filename) {
	freopen(filename, "w", stdout);
	long i;
	for (i=0;i<7000;i++)
		if (num[i] > 0) {
			cout << i << ' ' << num[i] << endl;
		}
	cout << -1 << endl;
	long i,j;
	for (i=0;i<7000;i++)
		for (j=0;j<7000;j++)
			if (num2[i][j] > 0) {
				cout << i << ' ' << j << ' ' << num2[i][j] << endl;
			}
	fclose(stdout);
}
