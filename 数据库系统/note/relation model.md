# DBS chap2 Relation model

relation (table)

attribute (column names)

tuples(row names)

## relation schema:

![image-20220302100327817](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220302100327817.png)

domain of attribute : set of allowed values of attributes.

attribute are required to be atomic (indivisible)

**null** is a member of every domain, mean: the values is unknown or doesn't exist.

superkey: sufficient to identify a unique tuple.

candidate key : minimal superkey(if remove any attribute -> not a superkey)

primary key: one of candidate key

foreign key consraint: value in one relation must appear in another.

## Relational Algebra

procedural language

select：$\sigma$

project（投影）$\Pi$

rename$\rho$

### select operation:![image-20220302105311800](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220302105311800.png)

### project opreation

remove some columns and remove **Duplicate** rows

![image-20220302105345648](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220302105345648.png)

### Cartesian product:

![image-20220302112128153](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220302112128153.png)

result may be huge, hence select it by "primary key = foregin key"

### rename opreation

![image-20220303111610457](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220303111610457.png)

example:

![image-20220303111931719](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220303111931719.png)

1.select all instructors from physics department

2.rename instructor to d

3.cartesian product(every instructor with every instructor from physics department(d))

4.if a instructor's salary > any instructor's from physics department, it will be selected

5.project.

### set-intersection operation

 *r* $\cap$ *s* = { *t* | *t* $\in$*r* **and** *t* $\in$ *s* }

Assume:

*r*, *s* have the *same arity* 

attributes of *r* and *s* are compatible

Note: *r* $\cap$ *s* = *r* – (*r* – *s*)

### natural-join operation

![image-20220303194859354](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220303194859354.png)

自然连接具有交换律和结合律

### outer join

left outer join：接受左表的所有行，然后与右表匹配。

例：将课程表与教师表自然连接，得到的是所有开课的教师ID与其所开课程的对应关系。而如果左连接，结果中包含所有教师（允许某些教师没有开课，记为null）同理，如果右连接，允许某些课没有教师。

full outer join 为同时进行左&右外连接

### Division Operation

relations : r(R) and s(S),$S\subset{R}$,$r\div{s}$ is the largest relation t(R-s) such that $t\times{s}\subset{r}$

![image-20220303202206130](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220303202206130.png)

r:学生与其所选课程的对应关系

s：所有生物系所开课程的课号

t为某些学生，$t\times{s}$为所有t中学生与所有生物系课程对应的关系，要使$t\times{s}\subset{r}$，则t中任意学生一定选了生物系所有课程。而由于除法定义中“最大”的限制，t为选了生物系所有课程的全部学生。

### **Aggregate Functions and Operations**

