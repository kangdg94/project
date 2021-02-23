T=int(input())
for x in range(T):
    n,m=map(int,input().split())
    fenzi=1
    fenmu=1
    for y in range(1,n+1):
        fenzi*=(m-y+1)
        fenmu*=y
    print(int(fenzi/fenmu))
