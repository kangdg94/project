#ifndef chinese_h
#define chinese_h
#include <iostream>
#include <cstdlib>
#include <algorithm>
using namespace std;
class chinese {
private:
	pair<char, char> z;
public:
	chinese() = default;
	chinese(char a, char b) :z(make_pair(a, b)) {}
	chinese(string s) :z(make_pair(s[0], s[1])) {}
	chinese(const char* s) :z(make_pair(s[0], s[1])) {}
	void output();
	friend bool operator <(const chinese &a, const chinese &b);
	friend bool operator ==(const chinese &a, const chinese &b);
};
#endif