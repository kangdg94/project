#include "chinese.h"
#include <iostream>
void chinese::output() {
	cout << z.first << z.second;
}
bool operator <(const chinese &a, const chinese &b) {
	if (a.z.first != b.z.first) return a.z.first < b.z.first;
	return a.z.second < b.z.second;
}
bool operator ==(const chinese &a, const chinese &b) {
	return a.z.first == b.z.first&&a.z.second == b.z.second;
}