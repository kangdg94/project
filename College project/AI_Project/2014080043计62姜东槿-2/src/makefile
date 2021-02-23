all:Pinyin.exe
Pinyin.exe: Pinyin.cpp Trainning.h Trainning.cpp Dictionary.h Dictionary.cpp chinese.h chinese.cpp
	g++ -std=c++11  -O2 Pinyin.cpp Trainning.cpp Dictionary.cpp chinese.cpp -o Pinyin.exe
clean:
	del *.exe *.o