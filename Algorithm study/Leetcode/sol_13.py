class Solution:
    def romanToInt(self, s: str) -> int:
        result = 0
        dic = { 'I' : 1,
                'V' : 5,
                'X' : 10,
                'L' : 50,
                'C' : 100,
                'D' : 500,
                'M' : 1000
                }

        while s:
            if len(s) == 1:
                result += dic[s]
                return result
            cur = s[0]
            s = s[1:]
            if cur == 'I' :
                if s[0] == 'V':
                    result += 4
                    s = s[1:]
                elif s[0]=='X':
                    result += 9
                    s = s[1:]
                else: result += 1
            elif cur == 'X' :
                if s[0] == 'L':
                    result += 40
                    s = s[1:]
                elif s[0]=='C':
                    result += 90
                    s = s[1:]
                else:
                    result += 10
            elif cur == 'C' :
                if s[0] == 'D':
                    result += 400
                    s = s[1:]
                elif s[0]=='M':
                    result += 900
                    s = s[1:]
                else:
                    result += 100
            else : result += dic[cur]
        return result