## lab3 SQL数据完整性实验报告

3200102888 米博宇

**实验目的：**

1. 熟悉通过SQL进行数据完整性控制的方法。

**实验平台：**

1.    数据库管理系统：mySQL或其它。

**实验内容和要求：**

1.    定义若干表，其中包括primary key, foreign key 和check的定义。

2.    让表中插入数据，考察primary key如何控制实体完整性。

3.    删除被引用表中的行，考察foreign key 中on delete 子句如何控制参照完整性。

4.    修改被引用表中的行的primary key，考察foreign key 中on update 子句如何控制参照完整性。

5.    修改或插入表中数据，考察check子句如何控制校验完整性。

6.    定义一个trigger, 并通过修改表中数据考察触发器如何起作用。

**实验三过程和实验结果：**

**1.**  **创建library数据库，在数据库中创建数据表**

```sql
mysql> create table book (bno char(8) ,
    -> category char(10),
    -> title varchar(40),
    -> press varchar(30),
    -> year int,
    -> author varchar(20),
    -> price decimal(7,2),
    -> total int ,        
    -> stock int,
    -> primary key(bno));
Query OK, 0 rows affected (0.08 sec)
```

**2.**  **编写创建数据表**

```sql
mysql> create table card(
    -> cno char(7),     
    -> name varchar(10),
    -> department  varchar(40),
    -> type enum('T','G','U','O'),
    -> primary key(cno));
Query OK, 0 rows affected (0.04 sec)
```

**3.**  **编写创建数据表**

  borrow(  cno char(7),  bno  char(8),  borrow_date  datetime,  return_date  datetime,)      外键：bno，cno。 分别对应book和card的bno和cno，同时外键 bno 级联删除 ，cno 级联更新  

 ```sql
 mysql> create table borrow(
     -> cno char(7),
     -> bno char(8),
     -> borrow_date datetime,
     -> return_date datetime,
     -> foreign key (bno) references book(bno) on delete cascade,
     -> foreign key (cno) references card(cno) on update cascade);
 Query OK, 0 rows affected (0.04 sec)
 ```

**4.**  **插入基本数据**

  Book表('10', '心理学','新的世界','浙江大学',2002,'高云鹏',48.00,20,4)      Card表('zju1001','雷锋','计算机','T');     Borrow表('zju1001','10','2011-09-10','2012-2-23');  

 ```sql
 mysql> insert into book values('10', '心理学','新的世界','浙江大学',2002,'高云鹏',48.00,20,4);
 Query OK, 1 row affected (0.02 sec)
 
 mysql> insert into card values('zju1001','雷锋','计算机','T');
 Query OK, 1 row affected (0.01 sec)
 
 mysql> insert into borrow values('zju1001','10','2011-09-10','2012-2-23');
 Query OK, 1 row affected (0.01 sec)  
 ```

**5.**  **向book表，再次插入一条记录， 看看数据库的提示。**

  ('10', '生物学','物种起源','哈佛大学',2002,'Darwin',48.00,20,4)  

 ```sql
 mysql> insert into book values  ('10', '生物学','物种起源','哈佛大学',2002,'Darwin',48.00,20,4);
 ERROR 1062 (23000): Duplicate entry '10' for key 'book.PRIMARY'
 #bno为主键，不允许重复
 ```

**6.**  **向card表添加一条记录，看看数据库的提示。**

  ('zju1002','凤姐','心理学','K')  

 ```sql
 mysql> insert into card values('zju1002','凤姐','心理学','K');
 ERROR 1265 (01000): Data truncated for column 'type' at row 1
 #type 只能为'T','G','U','O'
 ```

**7.**  **删除card表中的记录，观察数据库的提示。**

 ```sql
 mysql> delete from card;
 ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`mylibrary`.`borrow`, CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `card` (`cno`) ON UPDATE CASCADE)
 #borrow中的'cno'是card中'cno'的外键，borrow中的'zju0001'的借书记录对card中的借书卡信息有外键约束作用，而且没有设置级联删除，因此在删除外键记录前无法删除主键记录。
 ```

**8.**  **更新Book表中‘新的世界’bno 为‘100’看看borrow表中的记录**

 ```sql
 alter book set bno=100 where title='新的世界';
 select * from borrow;
 mysql> select * from borrow;
 +---------+------+---------------------+---------------------+
 | cno     | bno  | borrow_date         | return_date         |
 +---------+------+---------------------+---------------------+
 | zju1001 | 100  | 2011-09-10 00:00:00 | 2012-02-23 00:00:00 |
 +---------+------+---------------------+---------------------+
 1 row in set (0.00 sec)
 
 mysql> select * from book;
 +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
 | bno | category  | title        | press        | year | author    | price | total | stock |
 +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
 | 100 | 心理学    | 新的世界     | 浙江大学     | 2002 | 高云鹏    | 48.00 |    20 |     4 |
 +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
 1 row in set (0.01 sec)
 ```

**9.**  **编写触发器**

  作用是一个借书证不能同时借三本书（简化一点，认为借书记录中有记录即为借了书）。大家尝试编写下先验（before）触发器，作为对比，下面是后验触发器的例子（例子为sql server语法，同学们的答案可以是mysql）。

```sql
DELIMITER $

CREATE TRIGGER st1
BEFORE INSERT
ON borrow
FOR EACH ROW
BEGIN
	DECLARE mycno char(10);
	DECLARE num int;
	set mycno = NEW.cno;
	select count(bno) into num from borrow where borrow.cno = mycno;
	if(num > 2) then
	signal sqlstate '45000' set message_text = "最多只能借三本书!";
	end if;
END$
DELIMITER ;

mysql> insert into borrow values('zju1001','100','2011-09-10','2012-2-23');
ERROR 1644 (45000): 最多只能借三本书!
```

**10.** **实验总结及思考**

这次实验中，我学习了为数据表添加外键约束，理解了外键的约束作用：为外键添加值时，必须先确保有对应的主键；删除主键时，必须先删除关联的外键。为了避免操作的繁琐，可以设置级联删除和更新，在操作主键时自动对外键进行相应的操作。我还学习了触发器的编写和使用，了解了触发器的种类：先验、后验和作用：在进行特定操作时触发某些事件。



