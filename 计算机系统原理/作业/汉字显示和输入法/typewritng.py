def proc(s):
    line = ""
    for i in range(len(s)):
        c = s[i]
        if c in "īíǐì":
            line += 'i'
        elif c in "āáǎà":
            line += 'a'
        elif c in "ūúǔù":
            line += 'u'
        elif c in "êēéěè":
            line += 'e'
        elif c in "ōóǒò":
            line += 'o'
        elif c in "ǖǘǚǜü":
            line += 'v'
        elif c in "U+1234567890ABCDEF:#":
            pass
        else:
            line += c
    return line
f = open('./kHanyuPinlu.txt','r',encoding='UTF-8')

def get_key(val):
    return list(filter(lambda k: dict[k] == val, dict))

dict = {}
for line in f:
    line = proc(line)
    lst = line.split()
    if(',' in lst[0]):
        lst1 = lst[0].split(',')
        mykey = lst[1]
        dict[mykey] = lst1[0]
    else:
        mykey = lst[1]
        dict[mykey] = lst[0]
    
s = input("输入拼音：")
print(get_key(s))
