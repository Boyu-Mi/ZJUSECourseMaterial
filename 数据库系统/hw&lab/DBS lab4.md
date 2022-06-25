## DBS lab4

1. 基于上一次实验的library数据库的book表。先用root账户登录，创建一个账户A，并授予A在library数据库上的“All”和“grant option”权限。

   ```sql
   PS C:\WINDOWS\system32> mysql -u root -p
   Enter password: ******
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 22
   Server version: 8.0.28 MySQL Community Server - GPL
   
   Copyright (c) 2000, 2022, Oracle and/or its affiliates.
   
   Oracle is a registered trademark of Oracle Corporation and/or its
   affiliates. Other names may be trademarks of their respective
   owners.
   
   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   
   mysql>  create user 'A'@'%' identified by '1234';
   Query OK, 0 rows affected (0.02 sec)
   
   mysql> grant all on library.* to A with grant option;
   Query OK, 0 rows affected (0.01 sec)
   ```

   

2. 创建B，不授予权限。以账户B登录，测试B能否对book表进行CRUD（增、删、改、查）操作。

   ```sql
   mysql>  create user 'B'@'%' identified by '1234';
   Query OK, 0 rows affected (0.01 sec)
   PS C:\WINDOWS\system32> mysql -u B -p
   Enter password: ****
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 25
   Server version: 8.0.28 MySQL Community Server - GPL
   
   Copyright (c) 2000, 2022, Oracle and/or its affiliates.
   
   Oracle is a registered trademark of Oracle Corporation and/or its
   affiliates. Other names may be trademarks of their respective
   owners.
   
   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   
   mysql> use library;
   ERROR 1044 (42000): Access denied for user 'B'@'%' to database 'library'
   ```

   发现无法访问library数据库，也无法操作book表。

3. 用A登录，利用grant语句赋给B对于Book表的查询和插入的权限。

   ```sql
   PS C:\WINDOWS\system32> mysql -u A -p
   Enter password: ****
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 26
   Server version: 8.0.28 MySQL Community Server - GPL
   
   Copyright (c) 2000, 2022, Oracle and/or its affiliates.
   
   Oracle is a registered trademark of Oracle Corporation and/or its
   affiliates. Other names may be trademarks of their respective
   owners.
   
   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   
   mysql> grant select, insert on library.book to B;
   Query OK, 0 rows affected (0.01 sec)
   
   mysql> \q
   Bye
   ```

4. 用B登录测试是否具有相应的权限。

   ```sql
   PS C:\WINDOWS\system32> mysql -u B -p
   Enter password: ****
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 27
   Server version: 8.0.28 MySQL Community Server - GPL
   
   Copyright (c) 2000, 2022, Oracle and/or its affiliates.
   
   Oracle is a registered trademark of Oracle Corporation and/or its
   affiliates. Other names may be trademarks of their respective
   owners.
   
   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   
   mysql> use library;
   Database changed
   mysql> select * from book;
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   | bno | category  | title        | press        | year | author    | price | total | stock |
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   | 100 | 心理学    | 新的世界     | 浙江大学     | 2002 | 高云鹏    | 48.00 |    20 |     4 |
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   1 row in set (0.00 sec)
   
   mysql> insert into book values ('10', 'CS', 'Database', 'ZJU', 2020, 'author', 50.00, 20, 5);
   Query OK, 1 row affected (0.01 sec)
   
   mysql> select * from book;
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   | bno | category  | title        | press        | year | author    | price | total | stock |
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   | 10  | CS        | Database     | ZJU          | 2020 | author    | 50.00 |    20 |     5 |
   | 100 | 心理学    | 新的世界     | 浙江大学     | 2002 | 高云鹏    | 48.00 |    20 |     4 |
   +-----+-----------+--------------+--------------+------+-----------+-------+-------+-------+
   2 rows in set (0.00 sec)
   ```

   发现可以正常进行查询和删除。

5. 用A登录，利用revoke语句收回B的book表的操作权限，再登录B测试B是否有相应权限。

   ```sql
   mysql> revoke select, insert on library.book from B;
   Query OK, 0 rows affected (0.00 sec)
   
   PS C:\WINDOWS\system32> mysql -u B -p
   Enter password: ****
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 29
   Server version: 8.0.28 MySQL Community Server - GPL
   
   Copyright (c) 2000, 2022, Oracle and/or its affiliates.
   
   Oracle is a registered trademark of Oracle Corporation and/or its
   affiliates. Other names may be trademarks of their respective
   owners.
   
   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   
   mysql> use library
   ERROR 1044 (42000): Access denied for user 'B'@'%' to database 'library'
   ```

   无访问权限。

6. 用root登录数据库，删除账户A和账户B。

   ```sql
   mysql> drop user A,B;
   Query OK, 0 rows affected (0.01 sec)
   
   mysql> \q
   Bye
   PS C:\WINDOWS\system32> mysql -u A -p
   Enter password: ****
   ERROR 1045 (28000): Access denied for user 'A'@'localhost' (using password: YES)
   ```

   此时用户已被删除，无法访问。

7. 实验总结及思考

   在mysql中创建用户：

   ```sql
    create user 'username'@'%' identified by 'password';
   ```

   "username" 为注册的用户名，% 为通配符，若希望在本地注册，可改为"localhost"，'password'为注册密码。

   授予权限：

   ```sql
   grant all on library.* to A with grant option;
   ```

   “all” 指所有权限。“library”为要授予权限的数据库名称, “.”后为授予权限的表，此处为*表示所有表。

   回收权限：

   与授予权限格式类似，grant 改为 revoke， to 改为 from

   删除用户：

   drop + username

   

   

