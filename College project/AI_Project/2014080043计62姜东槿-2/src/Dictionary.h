#ifndef Dictionary_h
#define Dictionary_h
#include "chinese.h"
#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<map>
#include<vector>
using namespace std;
class ZiKu {
public:
	int conte,TTT;
	string pinyin[520];
	vector<long> at[520];
	map<chinese, long> hao;
	chinese b[7000];
	ZiKu() :conte(0), TTT(0) {}
	void init(const char*, const char *);
	int getPinyinNumber(string);
	int getHanziNumber(chinese);
	chinese getHanzi(int);
};
#endif