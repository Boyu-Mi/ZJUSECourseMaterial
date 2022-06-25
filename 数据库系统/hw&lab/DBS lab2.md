# DBS lab2

**1.**   **建立数据库**

**1)**  以自己学号为数据库名字建立数据库。

 ```sql
 create DATABASE 3200102888_;
 ```

**2.**   **在新建的数据库中新建三张表**

**1)**  书book(书号, 类别, 书名,出版社,出版年份,作者,价格,总藏书量,目前库存量)

  各属性的类型如下:

bno char(8) primary key, 

category char(10),

title varchar(40),

press varchar(30),

year int,

author varchar(20),

price decimal(7,2),

total int ,

stock int,

```sql
 CREATE TABLE book(
    bno CHAR(8) NOT NULL,
    category CHAR(10) NOT NULL,
    title VARCHAR(30) NOT NULL,
    press VARCHAR(30) NOT NULL,
    year INT NOT NULL,
    author VARCHAR(20) NOT NULL,
    price DECIMAL(7,2) NOT NULL,
    total INT NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (bno)
    )ENGINE = InnoDB DEFAULT CHARSET=utf8;
```



**2)**  借书证card(卡号,姓名,单位,类别--其中T, G, U, O分别代表教师、研究生、本科生、管理人员)  

各属性的类型如下:

cno char(7) primary key,

name varchar(10),

department varchar(40),

type char(1) 

```sql
CREATE TABLE card(
     cno CHAR(7) NOT NULL,
     name VARCHAR(7) NOT NULL, 
     department VARCHAR(40) NOT NULL,
     type CHAR(1) NOT NULL,
     PRIMARY KEY (cno)
     )ENGINE = InnoDB DEFAULT CHARSET=utf8;
```



**3)**  借书记录borrow(卡号,书号,借期,还期) 各属性的类型如下:

  cno   char(7),

  bno   char(8),

  borrow_date date,

  return_date date,

 ```sql
 CREATE TABLE borrow(    
      cno CHAR(7) NOT NULL,   
      bno CHAR(8) NOT NULL,
      borrow_date DATE NOT NULL,
      return_date DATE NOT NULL  
      )ENGINE = InnoDB DEFAULT CHARSET=utf8;
 ```



**3.**   **修改表结构、索引操作、视图操作**

**1)**    给book表添加一个字段author_country varchar(30)。

```sql
DESC book;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| bno      | char(8)     | NO   | PRI | NULL    |       |
| category | char(10)    | NO   |     | NULL    |       |
| title    | varchar(30) | NO   |     | NULL    |       |
| press    | varchar(30) | NO   |     | NULL    |       |
| year     | int         | NO   |     | NULL    |       |
| author   | varchar(20) | NO  |     | NULL    |       |
| total    | int         | NO   |     | NULL    |       |
| stock    | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
ALTER TABLE book ADD author_country VARCHAR(30);
DESC book;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |    
+----------------+-------------+------+-----+---------+-------+    
| bno            | char(8)     | NO   | PRI | NULL    |       |    
| category       | char(10)    | NO   |     | NULL    |       |    
| title          | varchar(30) | NO   |     | NULL    |       |    
| press          | varchar(30) | NO   |     | NULL    |       |    
| year           | int         | NO   |     | NULL    |       |    
| author         | varchar(20) | NO  |     | NULL    |       |    
| total          | int         | NO   |     | NULL    |       |    
| stock          | int         | NO   |     | NULL    |       |    
| author_country | varchar(30) | YES  |     | NULL    |       |    
+----------------+-------------+------+-----+---------+-------+ 
```

**2)**    删除book表新添加的字段author_country。

```sql
ALTER TABLE book DROP author_country;
DESC book;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| bno      | char(8)     | NO   | PRI | NULL    |       |
| category | char(10)    | NO   |     | NULL    |       |
| title    | varchar(30) | NO   |     | NULL    |       |
| press    | varchar(30) | NO   |     | NULL    |       |
| year     | int         | NO   |     | NULL    |       |
| author   | varchar(20) | NO  |     | NULL    |       |
| total    | int         | NO   |     | NULL    |       |
| stock    | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
```

**3)**    在book表title字段增加一个索引。

```sql
ALTER TABLE book ADD index title_index(title);
mysql> DESC book;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| bno      | char(8)     | NO   | PRI | NULL    |       |
| category | char(10)    | NO   |     | NULL    |       |
| title    | varchar(30) | NO   | MUL | NULL    |       |
| press    | varchar(30) | NO   |     | NULL    |       |
| year     | int         | NO   |     | NULL    |       |
| author   | varchar(20) | NO   |     | NULL    |       |
| total    | int         | NO   |     | NULL    |       |
| stock    | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
```

**4)**    删除前面刚建立的索引。

```sql
drop index title_index on book; 
mysql> DESC book;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| bno      | char(8)     | NO   | PRI | NULL    |       |
| category | char(10)    | NO   |     | NULL    |       |
| title    | varchar(30) | NO   |     | NULL    |       |
| press    | varchar(30) | NO   |     | NULL    |       |
| year     | int         | NO   |     | NULL    |       |
| author   | varchar(20) | NO   |     | NULL    |       |
| total    | int         | NO   |     | NULL    |       |
| stock    | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
```

**5)**    以book表为基础建立视图book_view，包括bno,category,title,press,year,author这些字段。

 ```sql
 CREATE VIEW book_view AS SELECT bno,category,title,press,year,author FROM book;
 mysql> desc book_view;
 +----------+-------------+------+-----+---------+-------+
 | Field    | Type        | Null | Key | Default | Extra |
 +----------+-------------+------+-----+---------+-------+
 | bno      | char(8)     | NO   |     | NULL    |       |
 | category | char(10)    | NO   |     | NULL    |       |
 | title    | varchar(30) | NO   |     | NULL    |       |
 | press    | varchar(30) | NO   |     | NULL    |       |
 | year     | int         | NO   |     | NULL    |       |
 | author   | varchar(20) | NO   |     | NULL    |       |
 +----------+-------------+------+-----+---------+-------+
 ```



**4.**   **导入数据**

**1)**    批量执行如下语句插入如下数据供后面实验使用。

```sql
insert into book values('bno1','计算机','SQL Server 2008完全学习手册','清华出版社',2001,'郭郑州',79.80,5,3);

insert into book values('bno2','计算机','程序员的自我修养','电子工业出版社',2013,'俞甲子',65.00,5,5);

insert into book values('bno3','教育','做新教育的行者','福建教育出版社',2002,'高云鹏',25.00,3,2);

insert into book values('bno4','教育','做孩子眼中有本领的父母','电子工业出版社',2013,'高云鹏',23.00,5,5);

insert into book values('bno5','英语','实用英文写作','高等教育出版社',2008,'庞继贤',33.00,3,2);

 

insert into card values('cno1','张三','计算机学院','U');

insert into card values('cno2','李四','农学院','U');

insert into card values('cno3','王五','计算机学院','T');

insert into card values('cno4','朱六','计算机学院','G');

insert into card values('cno5','延七','经济学院','O');

insert into card values('cno6','凤姐','经济学院','O');

 

insert into borrow values('cno1','bno1','2010-6-4','2010-6-10');

insert into borrow values('cno1','bno2','2010-6-5','2010-6-10');

insert into borrow values('cno2','bno2','2010-7-4','2010-7-10');

insert into borrow values('cno3','bno3','2010-8-4','2010-8-10');

insert into borrow values('cno4','bno4','2010-9-4','2010-9-10');

```

**5.**   **按要求插入删除数据**

**1)**    删除名字为’凤姐’的借书卡记录。

```sql
mysql> select * from card;
+------+--------+-----------------+------+
| cno  | name   | department      | type |
+------+--------+-----------------+------+
| cno1 | 张三   | 计算机学院      | U    |
| cno2 | 李四   | 农学院          | U    |
| cno3 | 王五   | 计算机学院      | T    |
| cno4 | 朱六   | 计算机学院      | G    |
| cno5 | 延七   | 经济学院        | O    |
| cno6 | 凤姐   | 经济学院        | O    |
+------+--------+-----------------+------+
DELETE FROM card WHERE name='凤姐';
mysql> select * from card;
+------+--------+-----------------+------+
| cno  | name   | department      | type |
+------+--------+-----------------+------+
| cno1 | 张三   | 计算机学院      | U    |
| cno2 | 李四   | 农学院          | U    |
| cno3 | 王五   | 计算机学院      | T    |
| cno4 | 朱六   | 计算机学院      | G    |
| cno5 | 延七   | 经济学院        | O    |
+------+--------+-----------------+------+
```

**2)**    修改名字为’延七’的借书卡记录中department改为’管理学院’

 ```sql
  UPDATE card SET department='管理学院' WHERE NAME='延七';
  mysql> select * from card;
 +------+--------+-----------------+------+
 | cno  | name   | department      | type |
 +------+--------+-----------------+------+
 | cno1 | 张三   | 计算机学院      | U    |
 | cno2 | 李四   | 农学院          | U    |
 | cno3 | 王五   | 计算机学院      | T    |
 | cno4 | 朱六   | 计算机学院      | G    |
 | cno5 | 延七   | 管理学院        | O    |
 +------+--------+-----------------+------+
 ```



**6.**   **SQL****查询、修改等操作**

**1)**    列出当前库存在5本以下的书（书名、作者、出版社、年份，库存量）。

```sql
SELECT author,title,press,year,stock FROM book WHERE STOCK<5;
mysql> SELECT author,title,press,year,stock FROM book WHERE STOCK<5;
+-----------+-----------------------------------+-----------------------+------+-------+
| author    | title                             | press
     | year | stock |
+-----------+-----------------------------------+-----------------------+------+-------+
| 郭郑州    | SQL Server 2008完全学习手册       | 清华出版社       
     | 2001 |     3 |
| 高云鹏    | 做新教育的行者                    | 福建教育出版社   
     | 2002 |     2 |
| 庞继贤    | 实用英文写作                      | 高等教育出版社   
     | 2008 |     2 |
+-----------+-----------------------------------+-----------------------+------+-------+
```

**2)**    列出张三同学借过的书的信息（列出姓名、书名、借书时间字段）。

```sql
SELECT name,title,borrow_date  FROM book a JOIN borrow b JOIN card c on b.cno=c.cno and a.bno=b.bno WHERE name ='张三'; 
+--------+-----------------------------------+-------------+
| name   | title                             | borrow_date |       
+--------+-----------------------------------+-------------+       
| 张三   | SQL Server 2008完全学习手册       | 2010-06-04  |       
| 张三   | 程序员的自我修养                  | 2010-06-05  |       
+--------+-----------------------------------+-------------+       
```

**3)**    列出book表中价格最高的书的所有字段信息。

```sql
mysql> SELECT *  
    -> FROM book 
    -> WHERE price=(SELECT MAX(price) FROM book);
    +------+-----------+-----------------------------------+-----------------+------+-----------+-------+-------+-------+
| bno  | category  | title                             | press     
      | year | author    | price | total | stock |
+------+-----------+-----------------------------------+-----------------+------+-----------+-------+-------+-------+
| bno1 | 计算机    | SQL Server 2008完全学习手册       | 清华出版社
      | 2001 | 郭郑州    | 79.80 |     5 |     3 |
+------+-----------+-----------------------------------+-----------------+------+-----------+-------+-------+-------+
```

**4)**    求当前库所有书的总藏书量、最高书价、最低书价。

```sql
mysql> SELECT MAX(price) AS max_price FROM book;
+-----------+
| max_price |
+-----------+
|      5.00 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT MIN(price) AS min_price FROM book;  
+-----------+
| min_price |
+-----------+
|      2.00 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT SUM(stock) AS sum_stock  FROM book; 
+-----------+
| sum_stock |
+-----------+
|        19 |
+-----------+
1 row in set (0.00 sec)
```

**5)**    列出藏书量大于1的出版社的名称和藏书数。

```sql
SELECT press,stock FROM book WHERE stock>1;
+-----------------------+-------+
| press                 | stock |
+-----------------------+-------+
| 清华出版社            |     3 |
| 电子工业出版社        |     5 |
| 福建教育出版社        |     3 |
| 电子工业出版社        |     5 |
| 高等教育出版社        |     3 |
+-----------------------+-------+
```

**6)**    列出从未借过书的借书证卡号。

```sql
mysql> SELECT a.cno FROM card a LEFT JOIN borrow b ON a.cno=b.cno WHERE borrow_date IS NULL;
+------+
| cno  |
+------+
| cno5 |
+------+
1 row in set (0.00 sec)
```

**7)**    通过 book_view视图 列出所有的书籍字段信息（bno,category,title,press,year,author）。

```sql
select * from book_view;
+------+-----------+-----------------------------------+-----------------------+------+-----------+
| bno  | category  | title                             | press     
            | year | author    |
+------+-----------+-----------------------------------+-----------------------+------+-----------+
| bno1 | 计算机    | SQL Server 2008完全学习手册       | 清华出版社
            | 2001 | 郭郑州    |
| bno2 | 计算机    | 程序员的自我修养                  | 电子工业出
版社        | 2013 | 俞甲子    |
| bno3 | 教育      | 做新教育的行者                    | 福建教育出
版社        | 2002 | 高云鹏    |
| bno4 | 教育      | 做孩子眼中有本领的父母            | 电子工业出
版社        | 2013 | 高云鹏    |
| bno5 | 英语      | 实用英文写作                      | 高等教育出
版社        | 2008 | 庞继贤    |
+------+-----------+-----------------------------------+-----------------------+------+-----------+
```

**8)**    通过 book_view视图 更新 '实用英文写作' 的年份 改为 2010 年（注意观察book表中的数据也相应发生了变化，理解视图与数据表的区别与联系） 。

```sql
 update book_view set year=2010 where title='实用英文写作'; 
 mysql> select * from book_view;
+------+-----------+-----------------------------------+-----------------------+------+-----------+
| bno  | category  | title                             | press     
            | year | author    |
+------+-----------+-----------------------------------+-----------------------+------+-----------+
| bno1 | 计算机    | SQL Server 2008完全学习手册       | 清华出版社
            | 2001 | 郭郑州    |
| bno2 | 计算机    | 程序员的自我修养                  | 电子工业出
版社        | 2013 | 俞甲子    |
| bno3 | 教育      | 做新教育的行者                    | 福建教育出
版社        | 2002 | 高云鹏    |
| bno4 | 教育      | 做孩子眼中有本领的父母            | 电子工业出
版社        | 2013 | 高云鹏    |
| bno5 | 英语      | 实用英文写作                      | 高等教育出
版社        | 2010 | 庞继贤    |
+------+-----------+-----------------------------------+-----------------------+------+-----------+
```

### 视图与数据表的区别与联系

在从数据表中查询数据时，需要使用select语句。对于某些需要频繁查询的数据，使用select语句不方便，因此可使用其对应的select语句预先完成查询，再将查询结果存至视图内，需要查询时查看视图即可。因此，视图相当于预先执行完毕的select语句，方便查询且节省时间。

在更改视图数据时，数据表中的数据也会相应改变，可能成为不安全因素。因此使用视图时尽量只作查看用途，不要修改内部数据。

### 心得与体会

1. select语句语法较为复杂，需要加深记忆。
2. 为防止新建同名表覆盖原有表造成数据丢失，可使用CREATE TABLE IF NOT EXISTS '表名'(...)建立数据表。
3. 在对多个表的数据进行查询时，应灵活使用连接运算。
