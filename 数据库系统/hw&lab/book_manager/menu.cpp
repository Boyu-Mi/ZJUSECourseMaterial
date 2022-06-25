#include "menu.h"
#include "ui_menu.h"
#include "login.h"
#include "ui_login.h"
#include "insert.h"
#include "ui_insert.h"
#include "add.h"
#include "ui_add.h"
#include "return_book.h"
#include "ui_return_book.h"
#include "borrow.h"
#include "ui_borrow.h"
#include "select.h"
#include "ui_select.h"
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>
#include <QSql>
#include <QSqlQueryModel>
#include <QSqlQuery>
extern QSqlDatabase db;
menu::menu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::menu)
{
    ui->setupUi(this);
}

menu::~menu()
{
    delete ui;
}

void menu::on_pushButton_insert_clicked()
{
    insert* ist = new insert;
    this->close();
    ist->show();
}


void menu::on_pushButton_quit_clicked()
{
    MainWindow* main = new MainWindow;
    this->close();
    main->show();
}


void menu::on_pushButton_add_clicked()
{
    add* ad = new add;
    this->close();
    ad->show();
}


void menu::on_pushButton_return_clicked()
{
    return_book* ret = new return_book;
    this->close();
    ret->show();
}

void menu::on_pushButton_borrow_clicked()
{
    borrow* bor = new borrow;
    this->close();
    bor->show();
}

void menu::on_pushButton_search_clicked()
{
    select* sel = new select;
    this->close();
    sel->show();
}

