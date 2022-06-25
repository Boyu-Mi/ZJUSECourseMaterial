## Entity-Relationship Model

### entity set 实体集合

An **entity** is an object that exists and is distinguishable from other objects.

Example: specific person, company, event, plant

Entities have **attributes**

Example: people have *names* and *addresses* 

### attributes

**Simple** and **composite** attributes.

**Single-valued** and **multivalued** attributes

Example: multivalued attribute: *phone_numbers*

**Derived** attributes(可计算的)

Can be computed from other attributes

Example: age, given date_of_birth

### **Relationship Set**

relation among entities
$$
(44553,22222) \in advisor
$$

### binary relationship

involve 2 entity sets

### extra attributes

student - course relationship, extra attribute can be the time of taking the course

### key for entity sets

super/candidate/primary

### **Redundant（冗余） Attribute** 

如果instructor和department之间有联系，则instructor中的inst_dept为冗余，应该舍去。

### 关系主键的选取

一对一：任何一方的主键

一对多/多对一 ：多一方的主键

多对多：两方主键的并集

## ER图

### 表示

长方形表示实体，菱形表示关系

实体中，组合用缩进表示，多值用大括号表示，可计算值在其后加括号表示。

![image-20220406103334920](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220406103334920.png)

## role

ER图中，entityset可以只有一个，在一个关系中有不同的作用，要在连线上标明。

![image-20220406103645832](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220406103645832.png)

### arrow

arrow 箭头表示“只能一个”

### 练习：

Draw an ER diagram for application about the campus ID cards used in Zhejiang University. Entities include students, campus ID cards, position of sales machines (POS, the machines that read and write campus ID information when consuming), places that students consume (stores, canteens). The application should store the balance in each card, and how much a card consumes every time. The information about commodities and foods that the students buy is not required.

problem：

attribute中放最基本的属性，**不要放其他entity的主键！！**比如不要把卡号写在学生信息中，学生和卡号的联系已经用关系表示了。

消费记录只有在card和pos发生关系的时候才产生，可以用**Relationship Sets with Attributes**表示（**虚线**）**避免extra attribute！！**

![image-20220406111010066](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220406111010066.png)

没有必要写在card里面。

### totally participate

双线，表示全部参与了关系

### weak entity set 弱势实体 

双边框菱形，必须依赖另一方的主键才能构成自身主键，自身attribute下方为虚线

## 将ER模型转换为关系模式

具有简单属性的强实体集：直接转化，主键不变。

如果有复合属性，直接拆分。

如果有多值属性，则构建主键---每一个值的新表

弱实体集：添加主键以及相应的外键

