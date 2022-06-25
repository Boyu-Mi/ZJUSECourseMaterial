## sql 

### join

- left outer join
- right outer join
- natural join
- join

#### using :

A join B where (A.attri = B.attri) is equal to

A join B using attri

- 不等于：<>

### rename

A as B: rename A to B

### string operation

**like**

- '%' matches any substring.
- '_' matches any character.

e.g.

```sql
select name 
from instructor
where name like '%dar';
```

### order by

- ascending(default): order by (A1,A2...)
- descending: order by (A1,A2,...) desc

#### limit

limit ofs, num: 筛选排序后从第ofs个开始num个数据。因此需要二者非负。

the default of ofs is 0.

-  nList names of instructors whose salary is among top 3. 

```sql
select  name	
from    instructor		
order by salary desc
limit 3；   //  limit 0,3 
```

### set opreation

#### union

```sql
(select course_id from section where sem = ‘Fall’ and year = 2009) 
union
(select course_id from section where sem = ‘Spring’ and year = 2010)

```

#### intersect

```sql
(select course_id from section where sem = ‘Fall’ and year = 2009) 
intersect
(select course_id from section where sem = ‘Spring’ and year = 2010)
```

#### except

```sql
(select course_id from section where sem = ‘Fall’ and year = 2009) 
except
(select course_id from section where sem = ‘Spring’ and year = 2010)
```

Suppose a tuple occurs *m* times in *r* and *n* times in *s,* then, it occurs:

*m*  *+ n* times in *r* **union all** *s*

min(*m,n**)* times in *r* **intersect all** *s*

max(0, *m – n)* times in *r* **except all** *s*

### null

**is null** can be used to check for null values.

### Aggregate Functions 

- avg
- min
- max
- sum
- count

 find average salary:

```sql
select avg (salary)
from instructor
where dept_name= ’Comp. Sci.’;
```

Find the total number of instructors who teach a course in the Spring 2010 semester

```sql
select count (distinct *ID*)
from teaches
where semester = ’Spring’ and year = 2010
```


Find the number of tuples in the *course* relation
```sql
select count (*)
from course;
```

#### group by

```sql
select avg(salary)
from ***
where **
group by ***;
```

**error**:

```sql
select ID, max(salary) from instructor;
```

错误原因：max只有一行一列，没有ID，无法搜索。

### having clause

```sql
select dept_name, avg(salary)
from instructor
where salary>30000
group by dept_name
having avg(salary)>42000 #筛选运算后的值
```

### null value and aggregate

aggregate: ignore all **null** tuples  except count(*)

only null values : count return 0 and other return null

### nested subqueries

subquery: a select-from-where expression that is nested within a query.

predicate: 

whether the value of an attribute is in a subset; 

whether the value of an attribute is greater than some of or all the values in a subset;

whether the subset is empty or not;

whether the subset cardinality <= 1 or not.

#### in

find instructor names who are advisors of students

```sql
select name from instructor where ID in (select i_id from advisor)
```

find instructor names who are not advisors of students

```sql
select name from instructor where ID not in (select i_id from advisor)
```

 find courses offered in Fall 2009 and in Spring 2010

```sql
select distinct course_id
from section
where semester = ’Fall’ and year= 2009 and course_id   in (select course_id
                                 from section
                                 where semester = ’Spring’ and year= 2010);
```

### some & all

find names of instructors with salary greater than that of some (at least one) / all instructor in the Biology department.

```sql
select name
from instructor
where salary > some/all (select salary
                     from instructor
                     where dept_name = ’Biology’);
```

### exists

判断是否为空

select name from instructor where exists (select * from advisor where i_id  = ==instructor.ID==)

**correlation variables**  关联变量：主查询中的列出现在子查询中

#### use 'not exists' to realize division

### unique

### with

Find all departments where the total salary is greater than the average of the total salary at all departments

```sql
with dept_total (dept_name, value) as
        (select dept_name, sum(salary)
         from instructor
         group by dept_name),
dept_total_avg(value) as
       (select avg(value)
       from dept_total)
select dept_name
from dept_total, dept_total_avg
where dept_total.value >= dept_total_avg.value;
```

Find all departments with the maximum budget
```sql
with max_budget (value) as 
(select max(budget)
from department)
select dept_name
from department, max_budget
where department.budget = max_budget.value;
```

### transaction

<--- !more -- >

### view

```sql
create view dept_total_salary(dept_name,total_salary) as 
select ...
```

#### Materializing a view

create a physical table containing all the tuples in the result of the query defining the view.

### index

```sql
create index studentName_index on student(Name);
```

speed up the searching

### assertion

check something

```sql
create assertion credits_earned_constraint check
     (not exists 
		(select ID 
              from student
              where tot_cred <> (
                          select sum(credits)
                          from takes natural join course
                          where student.ID=takes.ID
                                      and grade is not null 
                                      and grade<>’F’))
   #保证学分不会出错
```

### create domain

自定义数据类型

```sql
create domain person_name char(20) not null;
```



### quiz2

Find the ID of students whose advisor's name is "Mike"

```sql
select s_id from advisor where i_id in (select ID from instructor where name="Mike");
```

Find the ID of students who have not advisors(using outer join)

```sql
select s_id from student left outer join advisor on student.ID = s_id where i_id is null;
```

Find the name of advisors with more than 5 students who are from "Compter Scien

**group by ins.ID and ins.name**

要想选择name，则group by中的列必须包含name！！！！



### Authorization 授权

#### forms

select insert update delete (database)

database schema:

- index : creation and deletion
- resources: allow creation of new relations
- alteration: addition or deletion of attributes
- drop: deletion of relations

#### privileges

```sql
grant select on instructor to U1, U2, U3
grant select on department to public
grant update (budget) on department to U1, U2
grant all privileges on department to U1
```

#### revoking authorization(回收权限)

```sql
revoke <privilege list>
on < relation name>
from <user list>
```

- <privilege-list> may be **all** to revoke all privileges the revokee may hold.
- If <revokee-list> includes **public**, all users lose the privilege except those granted it explicitly.
- If the same privilege was granted twice to the same user by different grantees, the user may retain the privilege after the revocation.
- All privileges that depend on the privilege being revoked are also revoked.

####  roles

```sql
create role instructor;#创建讲师权限
grant instructor to Amit;
```

Privileges can be granted to roles:
```sql
grant select on takes to instructor;
```
Roles can be granted to users, as well as to other roles
```sql
create role teaching_assistant
grant teaching_assistant to instructor;
Instructor inherits all privileges of teaching_assistant
```
Chain of roles:
```sql
create role dean;
grant instructor to dean;
grant dean to Satoshi;
```

#### other authorizations features

**grant reference** (*dept_name*) **on** *department* **to** Mariano

#### transfer

**references** privilege to create foreign key

**grant reference** (*dept_name*) **on** *department* **to** Mariano;

#### with grant option:

允许将该用户的权限赋给其他用户