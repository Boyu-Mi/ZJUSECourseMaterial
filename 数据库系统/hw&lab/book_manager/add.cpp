#include "add.h"
#include "ui_add.h"
#include <QRegExpValidator>
#include <QMessageBox>
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>
#include "menu.h"
#include "ui_menu.h"
add::add(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::add)
{
    ui->setupUi(this);
    ui->lineEdit->setMaxLength(7);
    ui->lineEdit_4->setMaxLength(7);
    ui->lineEdit_2->setMaxLength(10);
    ui->lineEdit_3->setMaxLength(40);
}

add::~add()
{
    delete ui;
}

void add::on_pushButton_clicked()
{
    QString ID = ui->lineEdit->text();
    QString name = ui->lineEdit_2->text();
    QString dept = ui->lineEdit_3->text();
    QString type = ui->comboBox->currentText();
    if(ID.length() != 7){
         QMessageBox::information(this, tr("error"), tr("借书证号长度为7!"));
    }else{
        QString str = QString("insert into card values ('%1', '%2', '%3', '%4')").arg(ID,name,dept,type);
        QSqlQuery  query;
        bool flag = query.exec(str);
        if(flag == false)
        {
            QMessageBox::information(this, tr("error"), query.lastError().text());
        }else
            QMessageBox::information(this, tr("info"), tr("已添加"));
        }
    }


void add::on_pushButton_2_clicked()
{
    menu *men = new menu;
    this->close();
    men->show();
}


void add::on_pushButton_3_clicked()
{
    QString delete_id = ui->lineEdit_4->text();
    QString str = QString("select count(*) from card where cno='%1'").arg(delete_id);
    QSqlQuery  query;
    bool flag = query.exec(str);
    if(flag == false)
    {
        QMessageBox::information(this, tr("error"), query.lastError().text());
    }else{
        query.next();
        if(query.value(0) == 0){
            QMessageBox::information(this, tr("error"), tr("该借书证不存在"));
        }else{
            str = QString("delete from card where cno='%1'").arg(delete_id);
            flag = query.exec(str);
            if(flag == false)
            {
                QMessageBox::information(this, tr("error"), query.lastError().text());
            }else{
                QMessageBox::information(this, tr("infor"), tr("删除成功"));
            }
        }
    }
}

