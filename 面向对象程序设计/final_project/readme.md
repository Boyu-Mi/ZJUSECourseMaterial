## final project

### 实现功能

int,float,char, bool, vector,set,list,map,pair,用户自定义类型的二进制，XML序列化，反序列化。

Bonus：XML文件的Base64编码。

### 测试

见main.cpp中相关测试代码。

测试输出：

```c++
test for binary serialization and deserialization
n0 = 1461360418
n1 = 1461360418
n0 == n1: true
f0 = 1.2816e+06
f1 = 1.2816e+06
f0 == f1: true
b0 = 1
b1 = 1
b0 == b1: true
c0 = c
c1 = c
c0 == c1: true
v0 = {0 1 2 3 4 }
v1 = {0 1 2 3 4 }
l0 = {4 3 2 1 0 }
l1 = {4 3 2 1 0 }
set0 = {0 1 2 3 4 }
set1 = {0 1 2 3 4 }
m0 = {
0: a
1: b
2: c
3: d
4: e
5: f
6: g
7: h
8: i
9: j
10: k
11: l
12: m
13: n
14: o
15: p
16: q
17: r
18: s
19: t
20: u
21: v
22: w
23: x
24: y
25: z
}
m1 = {0: a
1: b
2: c
3: d
4: e
5: f
6: g
7: h
8: i
9: j
10: k
11: l
12: m
13: n
14: o
15: p
16: q
17: r
18: s
19: t
20: u
21: v
22: w
23: x
24: y
25: z
}
p0 = {123, 456.789}
p1 = {123: 456.789}
t1:
34483
test_for_UserDefinedType
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19

t2:
34483
test_for_UserDefinedType
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19

test for XML serialization and deserialization
n0 = 1461360418
n1 = 1461360418
n0 == n1: true
f0 = 1.2816e+06
f1 = 1.2816e+06
f0 == f1: true
b0 = 1
b1 = 1
b0 == b1: true
c0 = c
c1 = c
c0 == c1: true
v0 = {0 1 2 3 4 }
v1 = {0 1 2 3 4 }
l0 = {4 3 2 1 0 }
l1 = {4 3 2 1 0 }
set0 = {0 1 2 3 4 }
set1 = {0 1 2 3 4 }
m0 = {
0: a
1: b
2: c
3: d
4: e
5: f
6: g
7: h
8: i
9: j
10: k
11: l
12: m
13: n
14: o
15: p
16: q
17: r
18: s
19: t
20: u
21: v
22: w
23: x
24: y
25: z
}
m1 = {0: a
1: b
2: c
3: d
4: e
5: f
6: g
7: h
8: i
9: j
10: k
11: l
12: m
13: n
14: o
15: p
16: q
17: r
18: s
19: t
20: u
21: v
22: w
23: x
24: y
25: z
}
p0 = {123, 456.789}
p1 = {123: 456.789}
t1:
34483
test_for_UserDefinedType
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19

serialize t1 into user_defined_type.xml
Process finished with exit code 0

```

生成的二进制文件和XML文件在\cmake-build-debug\中

对用户自定义类型，Base64编码为: （\cmake-build-debug\base64_1.bin)

PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPFNlcmlhbGl6YXRpb24+CiAgICA8c3RkX2ludCB2YWw9IjM0NDgzIi8+CiAgICA8c3RkX3N0cmluZyB2YWw9InRlc3RfZm9yX1VzZXJEZWZpbmVkVHlwZSIvPgogICAgPHN0ZF92ZWN0b3Igc2l6ZT0iMTUiPgogICAgICAgIDxzdGRfaW50IHZhbD0iNSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iNiIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iNyIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iOCIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iOSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTAiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjExIi8+CiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxMiIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTMiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjE0Ii8+CiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxNSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTYiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjE3Ii8+CiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxOCIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTkiLz4KICAgIDwvc3RkX3ZlY3Rvcj4KPC9TZXJpYWxpemF0aW9uPm==

解码结果为：

https://base64.us/#d=PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPFNlcmlhbGl6YXRpb24%2BCiAgICA8c3RkX2ludCB2YWw9IjM0NDgzIi8%2BCiAgICA8c3RkX3N0cmluZyB2YWw9InRlc3RfZm9yX1VzZXJEZWZpbmVkVHlwZSIvPgogICAgPHN0ZF92ZWN0b3Igc2l6ZT0iMTUiPgogICAgICAgIDxzdGRfaW50IHZhbD0iNSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iNiIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iNyIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iOCIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iOSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTAiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjExIi8%2BCiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxMiIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTMiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjE0Ii8%2BCiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxNSIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTYiLz4KICAgICAgICA8c3RkX2ludCB2YWw9IjE3Ii8%2BCiAgICAgICAgPHN0ZF9pbnQgdmFsPSIxOCIvPgogICAgICAgIDxzdGRfaW50IHZhbD0iMTkiLz4KICAgIDwvc3RkX3ZlY3Rvcj4KPC9TZXJpYWxpemF0aW9uPm%3D%3D

与预期一致。