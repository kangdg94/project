T=int(input())
for i in range(T):
    count=0
    start=[int(x) for x in input().split()]
    N=int(input())
    board = [[int(x) for x in input().split()] for y in range(N)]
    for j in range(N):
        if((((abs(board[j][0]-start[0])**2)+(abs(board[j][1]-start[1])**2))**0.5)<board[j][2]):
            if ((((abs(board[j][0] - start[2]) ** 2) + (abs(board[j][1] - start[3]) ** 2))**0.5) > board[j][2]):
                count+=1
        if ((((abs(board[j][0] - start[0]) ** 2) + (abs(board[j][1] - start[1]) ** 2)) ** 0.5) > board[j][2]):
            if ((((abs(board[j][0] - start[2]) ** 2) + (abs(board[j][1] - start[3]) ** 2)) **0.5) < board[j][2]):
                count+=1
    print(count)