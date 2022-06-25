#include "batch.h"
#include "ui_batch.h"
#include "insert.h"
#include "ui_insert.h"
#include <QRegExpValidator>
#include <QMessageBox>
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QFileDialog>
batch::batch(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::batch)
{
    ui->setupUi(this);
    filename = new QLineEdit(this);
    filename->setGeometry(QRect(50,50,230,25));
    button = new QPushButton(this);
    button->setGeometry(QRect(280,50,80,25));
    button->setText("浏览");
    connect(button,SIGNAL(clicked()),this,SLOT(readfiles()));
}

batch::~batch()
{
    delete ui;
}

void batch::readfiles(){
    file_name =  QFileDialog::getOpenFileName(this,"open file()","/","text file(*.txt);;C file();;All file(*.*)");
    filename->setText(file_name);
}

void batch::on_pushButton_clicked(){

    QFile file(filename->text());
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug()<<"打开文件出错!"<<endl;
    }
    int success_cnt = 0;
    while(!file.atEnd()) {
        QByteArray line = file.readLine();
        QString str(line);
        QStringList strs=  str.split(", ");
        QString bno = strs.at(0);
        QString category = strs.at(1);
        QString title = strs.at(2);
        QString press = strs.at(3);
        QString year = strs.at(4);
        QString author = strs.at(5);
        QString price = strs.at(6);
        QString stock = strs.at(7).simplified();
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
            QSqlQuery  query;
            QString que = QString("insert into book values ('%1', '%2', '%3', '%4', %5, '%6', %7, %8, %8)").arg(bno,category,title,press,year,author,price,stock);
            qDebug() << que;
            bool  flag  =  query.exec(que);
            if(false  ==  flag){
              qDebug()  <<  query.lastError();
            }
            else{
                success_cnt++;
            }
        }
    }
    QString info = QString("已插入%1行.").arg(QString::number(success_cnt));
    QMessageBox::information(this, tr("info"), info);
}


void batch::on_pushButton_2_clicked()
{
    this->close();
    insert* ist = new insert;
    ist->show();
}

