#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    QString hostName;
    QString dbName;
    QString userName;
    QString password;

    ui->setupUi(this);
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("2");
    db.setUserName("root");
    db.setPassword("111111");
    bool ok = db.open();
    if (ok){
        QMessageBox::information(this, "infor", "success");
    }
    else {
        QMessageBox::information(this, "infor", "open failed");
        qDebug()<<"error open database because"<<db.lastError().text();
    }
    QSqlQuery query(db);
    // 使数据库支持中文
    query.exec("select * from book");

}

MainWindow::~MainWindow()
{
    delete ui;
}



void MainWindow::on_lineEdit_editingFinished()
{

}


void MainWindow::on_lineEdit_2_editingFinished()
{

}

void MainWindow::on_pushButton_clicked()
{
    QString name = ui->lineEdit_Name->text();
    int ID = ui->lineEdit_ID->text().toInt();
    QString Phone_num = ui->lineEdit_PhoneNumber->text();
    QString Password = ui->lineEdit_Password->text();
    if(name == NULL || Phone_num.length() != 11 || ui->lineEdit_ID == NULL||Password == NULL){
        QMessageBox::information(this, "infor", QString("please input complete information,%1").arg(Phone_num.length()));
    }else{
        QString str = QString("create user '%1'@'%' identified by '%2'").arg(ID).arg(Password);
        QSqlQuery query;
        query.exec(str); //执行插入操作
        str = QString("grant all on library.* to '%1' with grant option").arg(ID);
        query.exec(str);
        ui->lineEdit_Name->clear();
        ui->lineEdit_PhoneNumber->clear();
        ui->lineEdit_ID->clear();
        ui->lineEdit_Password->clear();
        QMessageBox::information(this, "infor", "创建成功");
    }
}

