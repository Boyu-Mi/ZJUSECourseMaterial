#include "insert.h"
#include "ui_insert.h"
#include "batch.h"
#include "ui_batch.h"
#include "menu.h"
#include "ui_menu.h"
#include <QRegExpValidator>
#include <QMessageBox>
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>
insert::insert(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::insert)
{
    ui->setupUi(this);
    ui->lineEdit_5->setMaxLength(4);
}

insert::~insert()
{
    delete ui;
}
//( 书号, 类别, 书名, 出版社, 年份, 作者, 价格, 数量 )
//Note: 其中 年份、数量是整数类型； 价格是两位小数类型； 其余为字符串类型
//Sample：
//(  book_no_1, Computer Science, Computer Architecture, xxx, 2004, xxx, 90.00, 2 )

void insert::on_pushButton_clicked()
{
    QString bno = ui->lineEdit->text();
    QString category = ui->lineEdit_2->text();
    QString title = ui->lineEdit_3->text();
    QString press = ui->lineEdit_4->text();
    QString year = ui->lineEdit_5->text();
    QString author = ui->lineEdit_6->text();
    QString price = ui->lineEdit_7->text();
    QString stock = ui->lineEdit_8->text();
    ui->lineEdit_5->setValidator(new QRegExpValidator(QRegExp("[0-9]+$")));
    ui->lineEdit_8->setValidator(new QRegExpValidator(QRegExp("[0-9]+$")));
    QRegExp rxp_price("[0-9]+\\.\\d{2,2}$");
    QRegExp rxp_int("[0-9]+$");
    if(!rxp_price.exactMatch(price)){
        QMessageBox::information(this, tr("错误"), tr("价格必须为两位小数!"));
    }else if(!rxp_int.exactMatch(year)){
        QMessageBox::information(this, tr("错误"), tr("年份必须为整数!"));
    }
    else if(!rxp_int.exactMatch(stock)){
            QMessageBox::information(this, tr("错误"), tr("库存必须为整数!"));
    }
    else{
        QString str = QString("insert into book values ('%1', '%2', '%3', '%4', %5, '%6', %7, %8, %8)").arg(bno,category,title,press,year,author,price,stock);
        QSqlQuery  query;
        bool  flag  =  query.exec(str);
        if(flag == false)
        {
          qDebug()  <<  query.lastError();
        }else
            QMessageBox::information(this, tr("info"), tr("已插入"));
    }
}


void insert::on_lineEdit_editingFinished()
{

}


void insert::on_lineEdit_5_editingFinished()
{

}


void insert::on_pushButton_2_clicked()
{
    batch *bch = new batch;
    this->close();
    bch->show();
}


void insert::on_pushButton_3_clicked()
{
    menu *men = new menu;
    this->close();
    men->show();
}

