#include "return_book.h"
#include "ui_return_book.h"

return_book::return_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::return_book)
{
    ui->setupUi(this);
}

return_book::~return_book()
{
    delete ui;
}

void return_book::on_pushButton_clicked() // 还书
{
    QString bno = ui->lineEdit->text(); // 书号
    QString cno = ui->lineEdit_2->text(); // 卡号
    QString str = QString("select count(*) from borrow where cno = '%1' and bno = '%2'").arg(cno, bno);
    QSqlQuery query;
    query.exec(str);
    bool flag = true;
    if(query.next()) // 检查是否有借书记录
    {
        QString str2 = query.value(0).toString();
        if(str2.compare("0") == 0)
            flag = false;
    }
    if(flag == true) // 有借书记录
    {
        str = QString("delete from borrow where cno = '%1' and bno = '%2'").arg(cno, bno); // 删除borrow 记录
        query.exec(str);
        str = QString("update book set stock = stock + 1 where bno = '%1'").arg(bno); // 存货加一
        query.exec(str);
        QMessageBox::information(this, tr("info"), tr("还书成功"));
    }
    else // 没有借书记录
        QMessageBox::information(this, tr("info"), tr("书号或卡号错误"));

}

void return_book::on_pushButton_2_clicked() // 返回主菜单
{
    menu *men = new menu;
    this->close();
    men->show();
}

void return_book::on_pushButton_3_clicked() // 查询借书记录
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
    QString cno = ui->lineEdit_2->text(); // 借书证号
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
