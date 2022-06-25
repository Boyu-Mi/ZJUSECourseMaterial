#include "login.h"
#include "ui_login.h"
#include "menu.h"
#include "ui_menu.h"
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QLineEdit>

QString admin_id;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->lineEdit_2->setEchoMode(QLineEdit::Password);

}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    admin_id = ui->lineEdit->text(); // 修改
    QString ID = admin_id;
    QString Password = ui->lineEdit_2->text();
    QSqlDatabase db;
    if(QSqlDatabase::contains("qt_sql_default_connection"))
      db = QSqlDatabase::database("qt_sql_default_connection");
    else
      db = QSqlDatabase::addDatabase("QODBC");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("library");
    db.setUserName(ID);
    db.setPassword(Password);
    bool issuccess = db.open();
    if (issuccess && !ID.isEmpty() && !Password.isEmpty()){
        QMessageBox::information(this, "infor", "登录成功");
        this->close();
        menu* ist = new menu;
        ist->show();

    }
    else {
        QMessageBox::information(this, "infor", "账号或密码错误");
        qDebug()<<"error open database because"<<db.lastError().text();

    }

}


void MainWindow::on_lineEdit_editingFinished()
{

}


void MainWindow::on_lineEdit_2_editingFinished()
{

}

