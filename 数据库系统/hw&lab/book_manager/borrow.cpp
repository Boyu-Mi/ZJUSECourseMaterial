#include "borrow.h"
#include "ui_borrow.h"

borrow::borrow(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::borrow)
{
    ui->setupUi(this);
}

borrow::~borrow()
{
    delete ui;
}

void borrow::on_pushButton_2_clicked() // 查询借书记录
{
    QString bno[100];
    QString category[100];
    QString title[100];
    QString press[100];
    QString year[100];
    QString author[100];
    QString price[100];
    QString total[100];
    QString stock[100];
    int i = 0;
    QString cno = ui->lineEdit->text(); // 借书证号
    QSqlQuery query;
    QString str = QString("select * from book where bno in (select bno from borrow where cno = '%1') order by title;").arg(cno);
    query.exec(str);//查询所有的信息
    while(query.next())
    {
        bno[i] = query.value(0).toString();
        category[i] = query.value(1).toString();
        title[i] = query.value(2).toString();
        press[i] = query.value(3).toString();
        year[i] = query.value(4).toString();
        author[i] = query.value(5).toString();
        price[i] = query.value(6).toString();
        total[i] = query.value(7).toString();
        stock[i] = query.value(8).toString();
        i++;
    }
    ui->textEdit->clear();
    str = "<table border='1' cellpadding='10'>"
          " <tr><td>书号</td> <td>类别</td> <td>标题</td> <td>出版社</td> <td>出版年份</td> <td>作者</td> <td>价格</td> <td>总量</td> <td>库存</td></tr> ";
    int j = 0;
    for(j = 0; j < i; j++)//将这些信息都显示在下方的文本编辑框中
        str += " <tr><td>"+bno[j]+"</td> <td>"+category[j]+"</td> <td>"+title[j]+"</td> <td>"+press[j]+"</td> <td>"+year[j]+"</td> <td>"+author[j]+"</td> <td>"+price[j]+"</td> <td>"+total[j]+"</td> <td>"+stock[j]+"</td> </tr> ";
    str += "</table> ";
    ui->textEdit->insertHtml(str);
}

void borrow::on_pushButton_3_clicked() // 借书
{
    QString cno = ui->lineEdit->text(); // 借书证号
    QString bno = ui->lineEdit_2->text(); // 书号
    QSqlQuery query;
    QString str;
    int flag = 0;

    // 检查是否有库存
    str = QString("select stock from book where bno = '%1';").arg(bno);
    query.exec(str);
    if(query.next())
    {
        int stock = query.value(0).toInt();
        if(stock == 0)
            flag = 1; // 没有库存了
    }
    else flag = 1; // 没有这本书

    // 检查借书证是否存在
    str = QString("select count(*) from card where cno = '%1';").arg(cno);
    query.exec(str);
    query.next();
    int exist = query.value(0).toInt();
    if(exist == 0)
        flag = 2; // 借书证不存在

    // 检查是否借过这本书
    str = QString("select count(*) from borrow where cno = '%1' and bno = '%2';").arg(cno, bno);
    query.exec(str);
    query.next();
    int dup = query.value(0).toInt();
    if(dup == 1)
        flag = 3; // 书已经借过了

    // 一切正常，可以借书
    if(flag == 0)
    {
        QDateTime borrow_date_time = QDateTime::currentDateTime();
        QString borrow_date = borrow_date_time.toString("yyyy-MM-dd hh:mm:ss");
        QDateTime return_date_time = QDateTime::currentDateTime();
        QString return_date = return_date_time.addDays(30).toString("yyyy-MM-dd hh:mm:ss"); // 借书周期30天
        str = QString("insert into borrow (cno, bno, admin_id, borrow_date, return_date) values('%1', '%2', '%3', '%4', '%5');").arg(cno, bno, admin_id, borrow_date, return_date);
        query.exec(str);
        str = QString("update book set stock = stock - 1 where bno = '%1'").arg(bno); // 存货减一
        query.exec(str);
        QMessageBox::information(this, tr("info"), tr("借书成功"));
    }

    // 书没有库存了
    if(flag == 1)
    {
        qDebug() << query.lastError();
        str = QString("select min(return_date) from borrow where bno = '%1';").arg(bno); // 查询最早还回的书
        query.exec(str);
        QString return_date;
        query.next();
        return_date = query.value(0).toString();
        return_date.replace("T", " "); // 调整格式
        return_date.replace(".000", "");
        if(return_date == NULL) // 如果书不存在
            QMessageBox::information(this, tr("info"), tr("没有这本书"));
        else // 如果书处于外借状态
        {
            return_date = "库存不足，最近归还时间为" + return_date;
            QByteArray ba = return_date.toUtf8(); // 时间显示有些小问题
            char* ch = ba.data();
            QMessageBox::information(this, tr("info"), tr(ch));
        }
    }

    // 借书证错误
   if(flag == 2)
       QMessageBox::information(this, tr("info"), tr("借书证不存在，请重新输入"));

   // 重复借书
   if(flag == 3)
       QMessageBox::information(this, tr("info"), tr("您已经借过这本书"));
}

void borrow::on_pushButton_clicked() // 返回
{
    menu *men = new menu;
    this->close();
    men->show();
}
