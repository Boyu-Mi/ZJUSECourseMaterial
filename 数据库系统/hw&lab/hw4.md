## 4.7

```sql
create table employee(
	ID char(10) not null,
    person_name varchar(20) not null,
    street varchar(20) not null,
    city varchar(10) not null,
    primary key (ID)
);

create table works(
	ID char(10) not null,
    company_name varchar(20) not null,
    salary int not null,
    primary key (ID),
    foreign key (ID) references employee(ID) on delete cascade on update cascade,
    foreign key (company_name) references company(company_name) on delete cascade on update cascade
);

create table company(
	company_name varchar(20) not null,
    city varchar(10) not null,
    primary key (company_name)
);

create table manages(
	ID char(10) not null,
    manager_id char(10) not null,
    primary key (ID),
    foreign key (ID) references employee(ID) on delete cascade on update cascade,
    foreign key (manager_id) references employee(ID) on delete cascade on update cascade
);
```

## 4.9

When a tuple in relation manager is deleted, the tuple of manager whose employee_ID is equal to the manager_ID of the tuple will also be deleted because there is a cascade delete.

## 4.15

```sql
select * from section inner join classroom on section.room_number=classroom.room_number;
```

## 4.17

```sql
select ID from student left outer join advisor on ID=s_id where advisor.i_ID is null;
```

## 4.20

```sql
select year,sum(credits) from takes natural join course where grade <> 'F' and grade is not null group by year;
```

