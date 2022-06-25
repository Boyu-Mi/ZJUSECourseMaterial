#include "select.h"
#include "ui_select.h"
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
#include <QSqlTableModel>
#include <QTableView>

select::select(QWidget *parent)
    :QWidget(parent),
    ui(new Ui::select)
{
    ui->setupUi(this);

    //初始化tableView
    model = new QSqlTableModel();
    model->setTable("book");
//    model->setColumnCount(9);
    model->setHeaderData(0,Qt::Horizontal,"书号");
    model->setHeaderData(3,Qt::Horizontal,"类别");
    model->setHeaderData(6,Qt::Horizontal,"书名");
    model->setHeaderData(9,Qt::Horizontal,"出版社");
    model->setHeaderData(12,Qt::Horizontal,"年份");
    model->setHeaderData(15,Qt::Horizontal,"作者");
    model->setHeaderData(18,Qt::Horizontal,"价格");
    model->setHeaderData(21,Qt::Horizontal,"总藏书量");
    model->setHeaderData(24,Qt::Horizontal,"库存");
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    ui->tableView->setModel(model);
//    for(int i=0; i<9; i++){
//        ui->tableView->setColumnWidth(i*3+1,0);
//        ui->tableView->setColumnWidth(i*3+2,0);
//    }

    //初始化comboBox
    ui->comboBox->setCurrentIndex(2);
}

select::~select()
{
    delete ui;
}




void select::on_pushButton_clicked()
{
    //读取查询要求
//    QSqlQuery query;
//    QString category0, title0, press0, year0, author0, price0;
    QString category = ui->lineEdit->text();
    QString title = ui->lineEdit_2->text();
    QString press = ui->lineEdit_3->text();
    QString min_year = ui->lineEdit_5->text();
    QString max_year = ui->lineEdit_6->text();
    QString author = ui->lineEdit_4->text();
    QString min_price = ui->lineEdit_8->text();
    QString max_price = ui->lineEdit_7->text();
    ui->lineEdit_5->setValidator(new QRegExpValidator(QRegExp("[0-9]+$")));
    ui->lineEdit_6->setValidator(new QRegExpValidator(QRegExp("[0-9]+$")));
    int Imin_year,Imax_year;
    double Dmin_price,Dmax_price;
    Imin_year = QString(min_year).toInt();
    Imax_year = QString(max_year).toInt();
    Dmin_price = QString(min_price).toDouble();
    Dmax_price = QString(max_price).toDouble();

    if(category.isEmpty() && title.isEmpty() && press.isEmpty() && min_year.isEmpty() && min_year.isEmpty()
               &&max_year.isEmpty() && author.isEmpty() && min_price.isEmpty() && max_price.isEmpty()) //查不到书
    {
            QMessageBox::warning(this,tr("错误"),tr("输入信息不足"));
            return;
    }

    QRegExp rxp_price("[0-9]+\\.\\d{2,2}$");
    if(!min_price.isEmpty() && !max_price.isEmpty() && (!rxp_price.exactMatch(min_price) || !rxp_price.exactMatch(max_price))){
        QMessageBox::warning(this, tr("错误"), tr("价格必须为两位小数!"));
        return;
    }
    if(((!min_year.isEmpty() || !max_year.isEmpty()) && !(!min_year.isEmpty() && !max_year.isEmpty())) || min_year > max_year){
        QMessageBox::warning(this, tr("错误"), tr("年份输入错误"));
        return;
    }
    if((!min_price.isEmpty() || !max_price.isEmpty()) && min_price > max_price){
        QMessageBox::warning(this, tr("错误"), tr("价格输入错误"));
        return;
    }

    QString Scategory =  QString(" category = '%1'").arg(category);
    QString Stitle =  QString(" title = '%1'").arg(title);
    QString Spress =  QString(" press = '%1'").arg(press);
    QString Syear =  QObject::tr("year >= %1 and year <= %2" ).arg(Imin_year).arg(Imax_year);
    QString Sauthor =  QString(" author = '%1'").arg(author);
    QString Sprice =  QObject::tr( "price >= %1 and price <= %2" ).arg(Dmin_price).arg(Dmax_price);
    QString filterStr = "";

    if(!category.isEmpty()){
        filterStr.append(Scategory);
    }

    if(!title.isEmpty())
    {
        if(!filterStr.isEmpty())
            filterStr.append(" and ");
        filterStr.append(Stitle);
    }
    if(!press.isEmpty())
    {
        if(!filterStr.isEmpty())
            filterStr.append(" and ");
        filterStr.append(Spress);
    }
    if(!min_year.isEmpty() && !max_year.isEmpty())
    {
        if(!filterStr.isEmpty())
            filterStr.append(" and ");
        filterStr.append(Syear);
    }
    if(!min_price.isEmpty() && !max_price.isEmpty())
    {
        if(!filterStr.isEmpty())
            filterStr.append(" and ");
        filterStr.append(Sprice);

    }
    if(!author.isEmpty())
    {
        if(!filterStr.isEmpty())
            filterStr.append(" and ");
        filterStr.append(Sauthor);
    }
    model->setFilter(filterStr);
    qDebug() << filterStr;
    int index = ui->comboBox->currentIndex();
    model->setSort(index*3,Qt::AscendingOrder);
    model->select();
//    qDebug() << model->data(0);
//    if(flag == )
}

void select::on_pushButton_3_clicked()
{
    menu *men = new menu;
    this->close();
    men->show();
}

void select::on_pushButton_2_clicked()
{

}
