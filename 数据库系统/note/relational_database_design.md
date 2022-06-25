## relational database design

### function dependencies(FD) 函数依赖

如果合法关系r(R)中，两行的attribute $$\alpha$$ 相等可得出 $\beta$ 也相等，则函数依赖
$$
\alpha \rightarrow \beta
$$
成立。

*A* functional dependency is **trivial**(无关紧要) if it is satisfied by all instances of a relation

In general, a --> *b* is trivial if *b* $\subset$ a 

#### lossless decomposition 

$$
R1 \and R2 \rightarrow R1
\\or
\\R1 \and R2 \rightarrow R2
$$



![image-20220413111215412](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220413111215412.png)

![image-20220413111227006](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220413111227006.png)

![image-20220413111356298](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220413111356298.png)

If attribute a only appears in left side of non trivial FDs in F, it should be part of a candidate key

If attribute a only appears in right side of non trivial FDs in F, it should not be part of a candidate key

If attribute a does not appear in any non trivial FDs of F, it should be part of a candidate key

Example1: R=(A, B, C, D, E), F= {A B→C, B→D, AD→E}

Candidate key: AB





