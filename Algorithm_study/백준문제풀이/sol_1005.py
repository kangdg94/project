import sys
from collections import deque

T = int(sys.stdin.readline())
for _ in range(T):
	N, K = map(int, sys.stdin.readline().split())
	time = list(map(int, sys.stdin.readline().split()))
	time.insert(0, 0)
	tree = [[] for _ in range(N + 1)]
	inDegree = [0 for _ in range(N + 1)]
	Dp = [0 for _ in range(N + 1)]
	for _ in range(K):
		a, b = map(int, sys.stdin.readline().split())
		tree[a].append(b)
		inDegree[b] += 1

	q = deque()
	for x in range(1, N + 1):
		if inDegree[x] == 0:
			q.append(x)
			Dp[x] = time[x]

	while q:
		cur = q.popleft()
		for x in tree[cur]:
			inDegree[x] -= 1
			Dp[x] = max(Dp[cur] + time[x], Dp[x])
			if inDegree[x] == 0:
				q.append(x)
				#print(Dp)
	answer = int(sys.stdin.readline())

	print(Dp[answer])
