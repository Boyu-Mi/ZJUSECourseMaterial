## DBS hw3

### 3.8

a.

```sql
select ID from depositer 
except
select ID from borrower;
```

b.

```sql
select ID 
from customer as c1, customer as c2 
where c2.ID='12345' and c1.customer_street = c2.customer_street and c1.city = c2.city;
```

c.

```sql
select branch_name 
from account as a, customer as c, depositor as d
where c.ID = d.ID and a.account_number = d.account_number and c.city = "Harrison";
```

### 3.9

a.

```sql
select ID, person_name, city
from employee natural join works
where company_name = "First Bank Corporation";
```

b.

```sql
select ID, person_name, city
from employee natural join works
where company_name = "First Bank Corporation" and salary > 10000
```

c.

```sql
select ID from employee
except
select ID from employee natural join works
where company_name = "First Bank Corporation";
```

d.

```sql
select ID
from employee natural join works
where salary > (select max(salary) 
                from employee natural join works 
                where company_name = "Small Bank Corporation");
```

e.

```sql
select c1.company_name
from company as c1, company as c2
where c1.city = c2.city and c2.company_name = "Small Bank Corporation";
```

f.

```sql
select company_name
from works
group by company_name
having count(distinct ID) >= all
	(select count(distinct ID)
     from works
     group by company_name);
```

g.

```sql
select name
from works
group by company_name
having avg(salary) > (select avg(salary)
                      from works
                      where company_name="First Bank Coropration");
```

### 3.10

a.

```sql
update employee
set city="Newtown"
where ID='12345';
```

b.

```sql
update works as w
set w.salary = w.salary*
    (case
        when (w.salary*1.1>10000) then 1.03
        else 1.1
    end)
where s.ID in (select manager_id 
               from manages) and
               s.company_name="First Bank Corporation"
```

### 3.11

a.

```sql
select student.ID, distinct name
from student natural join takes natural join section natural join course
where dept_name = "Comp_Sci.";
```

b.

```sql
select s.ID from student as s
     where s.ID = any (select ID from takes group by ID having min(year)>2017); 
```

c.

```sql
select dept_name, max(salary)
from instructor
group by dept_name;
```

d.

```sql
select min(salary)
from instructor
where salary = any(select max(salary) 
               from instructor
               group by dept_name);
```



### 3.15

a.

```sql
with branch_count as
(select count(*)
branch
where branch_city = 'Brooklyn')
select customer_name
from customer as c
where branch_count =
select(count(branch_name)
from (customer natural join branch natural join account) as d
where c.customer_name = d.customer_name
);
```

b.

```sql
select sum(amount)
from loan;
```

c.

```sql
select branch_name
from branch
where assets > some(
select assets
from branch
where branch_city = 'Brooklyn'
);
```

