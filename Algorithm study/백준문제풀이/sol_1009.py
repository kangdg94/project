import sys
data_cnt = int(sys.stdin.readline())
for _ in range(data_cnt):
    a, b = map(int, sys.stdin.readline().split())
    result = [(a ** i) % 10 for i in range(1,5)][(b % 4) -1]
    print(result if result != 0 else 10)