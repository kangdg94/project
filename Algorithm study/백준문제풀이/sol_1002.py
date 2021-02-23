T=int(input())
for _ in range(T):
    x1,y1,r1,x2,y2,r2=map(int,input().split())
    result=0
    dist=((abs(x1-x2))**2+(abs(y1-y2))**2)**0.5
    if dist ==0 and r1 == r2:
        print(-1)
        continue
    if r1 + r2 < dist and max(r1,r2) < dist:
        print(0)
        continue
    if dist+min(r1,r2) < max(r1,r2):
        print(0)
        continue
    if r1+r2 == dist or dist+min(r1,r2)==max(r1,r2):
        print(1)
        continue
    else: print(2)

