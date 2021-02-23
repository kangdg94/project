#include "Dictionary.h"
#include "chinese.h"
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
#include<string>
#include<fstream>
using namespace std;
void ZiKu::init(const char* hanzibiao, const char* pinyinbiao) {
	freopen(hanzibiao, "r", stdin);
	for (char x = getchar(), y = getchar(); x != EOF; x = getchar(), y = getchar()) {
		chinese tmp=chinese(x,y);
		hao[tmp] = TTT++;
		b[TTT - 1] = tmp;
	}
	fclose(stdin);
	freopen(pinyinbiao, "r", stdin);
	char ch = 'a';
	while (ch != EOF) {
		cin >> pinyin[conte++];
		for (ch = getchar(); ch != '\n'&&ch != EOF; ch = getchar()) {
			char x = getchar(), y = getchar();
			chinese t = chinese(x, y);
			at[conte - 1].push_back(hao[t]);
		}
	}
	fclose(stdin);
}
int ZiKu::getPinyinNumber(string s) {
	int l = 0, r = conte - 1;
	while (l <= r) {
		int mid = (l + r) >> 1;
		if (pinyin[mid] == s) return mid;
		if (s < pinyin[mid]) r = mid - 1;
		else l = mid + 1;
	}
	return -1;
}
int ZiKu::getHanziNumber(chinese a) {
	return hao[a];
}
chinese ZiKu::getHanzi(int x) {
	return b[x];
}