## physical storages systems

### 存储介质

- volatile storage 易失存储 断电后即失去内容 

  速度快，成本高

- non-volatile storage 非易失存储 断电后内容仍然保留

  单价较低

### 存储级别

![image-20220425204250150](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220425204250150.png)

一级存储：数据处理

二级存储：数据传送

三级存储：数据备份

介于主存和缓存之间：NVM Non-Volatile Memory

### 磁盘结构 Magnetic Disk

![image-20220425205535388](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220425205535388.png)

每个盘面（platter）被分为若干环形磁道（track），每个磁道分为若干扇区（sector）。

一个扇区是数据读写的最小单位。

### 对磁盘表现的度量

- 访问时间： 从读写命令发出到数据转移开始的时间

  - seek time  寻道时间 把arm移动到正确磁道的时间， 4-10ms

  - rotation latency 旋转延迟 4-11ms
- 数据传输率 25-100MB/s
- Disk block
- 顺序访问模式
  - 只需一次定位（开始块）
- 随机访问模式
  - 每访问一块就需要定位一次
- IOPS 每秒钟IO操作数
  - 每秒可提供的读取操作数量， 50-200

- mean time to failure 平均故障时间，一块磁盘大概3-5年发生一次故障。

### 磁盘访问优化

buffering：缓冲区

prefetch： 提前读入相邻的数据

磁盘臂调度： 重新排列请求，最小化磁盘臂移动

文件组织： 尽可能把文件放在一块连续空间内

Log Disk



### Flash Storage 闪存

page——4KB

一次读取一个page，一个page只能写一次，重写前必须擦除。

Solid State Disks 固态硬盘

wear leveling: 磨损均衡，将擦除操作尽可能均衡。

### Storage Class Memory（NVM）

- persistence
- byte-addressable
- not endurance

## Chap13 数据存储结构

### 文件组织

- The database is stored as a collection of *files*. 
- Each file is a sequence of *records.* 
- A record is a sequence of fields.

- One approach:

  - assume record size is fixed

  - each file has records of one particular type only 

  - different files are used for different relations

This case is easiest to implement; will consider variable length records later.

We assume that records are smaller than a disk block.

#### 定长记录

空闲列表，记录空闲的记录位置，替代移动。

![image-20220426102658162](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220426102658162.png)

#### 变长记录

偏移量+长度

![image-20220426103454932](E:\typorapic\image-20220426103454932.png)

每个变长属性用开始地址+字节数表示，定长属性直接存储

0000表示四个属性均不为null

#### 分槽页 soltted page structure

![image-20220426103947435](E:\typorapic\image-20220426103947435.png)

**Slotted page** header contains:

- number of record entries

- end of free space in the block

- location and size of each record

Records can be moved around within a page to keep them contiguous with no empty space between them; entry in the header must be updated.

Pointers should not point directly to record — instead they should point to the **entry** for the record in header.

间接寻址，通过编号

### 记录组织

- 堆

  - 树形map，记录内存空间数量

- 线性存储

  - 类似链表的结构

    ![image-20220426112832182](E:\typorapic\image-20220426112832182.png)

  - 只起到临时管理作用，最终仍然需要重组使其恢复线性状态

- multitable clustering

  - 多个表放在一个文件中

- B树

- 散列

