## 事务

### 事务的ACID要求

- 原子性 atomicity 如果执行过程中失败，则该事务对数据库造成的所有修改都要撤销。
- 一致性 consistency 
- 隔离性 isolation 事务执行不会受到并发事务的干扰。
- 持久性 durability  事务成功后对数据库的改变是永久的。

事实上，A I D 保证了 C。

### 事务状态图

![image-20220518101446886](E:\typorapic\image-20220518101446886.png)

active：初始状态。

paritially committed：部分提交的，最后一条语句执行后。

failed：正常的执行不能继续。

aborted：事务回滚，恢复到执行前状态。

committed：成功完成。

### schedule 调度

#### 1.串行调度(serial)

![image-20220518102049734](E:\typorapic\image-20220518102049734.png)

#### 2.等价的并发调度

![image-20220518102322372](E:\typorapic\image-20220518102322372.png)

#### 3.不一致的调度

![image-20220518102547466](E:\typorapic\image-20220518102547466.png)

T2读的A不是A-50，导致A+B值不一致。

#### 可串行化 Serializability

只考虑读、写操作

两条命令 $I_i$,$I_j$ 冲突 iff  $I_i$,$I_j$ 同时操作itemQ且至少一个为写操作
$$
\\1.l_i = read(Q), l_j=read(Q).  They\ don’t\ conflict.
  \\2. l_i = read(Q), l_j =write(Q). They\ conflict.
  \\3. l_i = write(Q), l_j =read(Q).  They\ conflict.
  \\4. l_i = write(Q), l_j =write(Q). They\ conflict.
$$
若I J是调度S的两条连续指令，如果其属于不同事务且不冲突，则交换二者可以得到一个等价于S的调度。

如果调度$S$可以经过一系列非冲突交换变为$S^{'}$，则称二者冲突等价。

如果调度$S$与一个串行调度冲突等价， 则其为**冲突可串行化的(conflict serializability)**。

**如何判断？**

- 优先图 precedence graph

由调度S构造有向图G(V,E), 顶点集为所有参与调度的事务。

> We draw an arc from Ti to Tj if the two transaction conflict, and Ti accessed the data item on which the conflict arose earlier.

如果优先图有环，则其不是冲突可串行化的，反之为冲突可串行化。

最终执行顺序可由拓扑序得到。

#### 可恢复调度

不可恢复的例子：

![image-20220518110220121](E:\typorapic\image-20220518110220121.png)

如果T9提交后，T8需要回滚，则A的值应该变为T8执行前的，但T9已经提交了，无法回滚，所以这是不可恢复调度。

- 级联回滚

  >**Cascading rollback** – a single transaction failure leads to a series of transaction rollbacks. Consider the following schedule where none of the transactions has yet committed (so the schedule is recoverable)

- 非级联回滚

  >**Cascadeless** **schedules** — for each pair of transactions *T*i and *T*j such that *T*j reads a data item previously written by *T*i, the commit operation of *T*i appears before the read operation of *T*j.

无级联调度应该满足：如果Tj读取了Ti所写的数据，Ti必须在这个Tj之前提交。

#### 隔离等级

serializabale 保证可串行化调度

repeatable read 只允许读已提交数据，且在一个事务两次读取一个数据期间其他事务不得更新该数据。

read committed 只允许读已提交数据，且在一个事务两次读取一个数据期间其他事务可以更新该数据。

read uncommitted 允许读取未提交数据。

从上到下并发性增加，数据准确性降低。

#### 实现方式：

- 锁

- 时间戳

- 多版本&快照

## Concurrency Control 并发控制

### lock-based protocol

两种锁

- 排他的(exclusive) X 可读可写 与共享锁不相容
- 共享的(shared) S 只读
#### 2-phase locking protocol 二阶段上锁协议

1. 增长阶段 事务可以获得锁，但不能释放
2. 收缩阶段 事务可以释放锁，但不能获得新锁

保证冲突可串行化

> The protocol assures serializability. It can be proved that the transactions can be serialized in the order of their **lock points**  (i.e., the point where a transaction acquired its final lock). 

为了避免级联回滚：

> **strict two-phase locking** -- a transaction must hold all its exclusive locks till it commits/aborts.

> **Rigorous two-phase locking** 强严格两阶段锁 is even stricter. Here, *all* locks are held till commit/abort. In this protocol transactions can be serialized in the order in which they commit.

#### DeadLock 死锁

![image-20220518120429579](E:\typorapic\image-20220518120429579.png)

T3 T4互相等待对方的锁释放，导致死锁。

解决：回滚并释放锁（牺牲一个事务）。

#### Starvation 饿死

一个事务一直在等待获得锁，永远无法取得进展

#### lock manager

维护数据结构 lock table：hash table + linked list

![image-20220518121318032](E:\typorapic\image-20220518121318032.png)

可以推断T1 T8有共享锁 （不互斥）T2等待获得独占锁（互斥）



***



## chap19 recovery

### 故障分类

- 事务故障
  - 逻辑错误
  - 系统错误（系统进入死锁等不良状态）
- 系统崩溃
- 磁盘故障

​		

事务恢复依赖于稳定存储器。

每个事务T都有一个私有工作区，里面含有所操作数据的拷贝。事务通过read和write与缓存块进行数据交换，缓存与disk通过input和output进行数据交换。使用最广泛的数据库修改的记录就是日志。

![image-20220525110845033](E:\typorapic\image-20220525110845033.png)

日志记录有多种

**更新日志记录**

每当写数据时，将记录记在log buffer中（读数据不需要记录）

具有字段：

- 事务标识 transaction identifier
- 数据项标识 data-item identifier
- old value
- new value

形如
$$
< T_i, X_j, V_1, V_2>
$$
其他种日志用于记录事务的开始、提交、中止等信息。

立即修改方法：允许在事务仍然活跃时对数据库进行修改

- The immediate-modification scheme allows updates of an uncommitted transaction to be made to the buffer, or the disk itself, before the transaction commits

- Output of updated blocks to disk storage can take place at any time before or after transaction commit

- Order in which blocks are output can be different from the order in which they are written.

- **Update log record must be written before a database item is written**修改数据前先写日志

- **Related log records must be output before a database page is output**写硬盘以前先写日志

当事务的日志已经被写在稳定存储时，就认为事务已经提交了，即使相关数据项还没有被写在数据库中。

### 重做与回滚

redo：将事务所更新过的所有数据项都设置成新值

undo：将事务所更新过的所有数据项都设置成旧值，**并且写日志记录执行的恢复过程**

完成undo后再写一个<T_i abort>表明撤销完成。



### 检查点

原则上恢复需要搜索所有日志决定撤销和重做的事务

为了降低搜索日志的开销和恢复过程，采用检查点机制

执行过程：

1. 将位于主存的所有日志输出到稳定存储器
2. 将所有修改的缓冲块输出到磁盘
3. 输出一个checkpoint L 日志记录到稳定存储器，L为执行检查点时正在活跃的事务列表

如此，在检查点记录前完成的事务不需要重做

崩溃时找到最后一个检查点L（反向搜索），将L中事务和L之后执行的事务集合记作T，对于T中事务，若日志中既没有commit也没有abort，则undo，否则redo

![image-20220525121056278](E:\typorapic\image-20220525121056278.png)

![image-20220531212711662](E:\typorapic\image-20220531212711662.png)



### 故障恢复的例子

### 逻辑回滚

Operations like B+-tree insertions and deletions release locks early. 

They cannot be undone by restoring old values (**physical undo**), since once a lock is released, other transactions may have updated the B+-tree.

Instead, insertions (resp. deletions) are undone by executing a deletion (resp. insertion) operation (known as **logical undo**). 

## 事务，锁和故障恢复复习

