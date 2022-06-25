#ifndef BORROW_H
#define BORROW_H

#include <QWidget>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QSqlError>
#include <QDateTime>
#include <menu.h>
#include <login.h> // 添加

namespace Ui {
class borrow;
}

class borrow : public QWidget
{
    Q_OBJECT

public:
    explicit borrow(QWidget *parent = nullptr);
    ~borrow();

private slots:
    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_clicked();

private:
    Ui::borrow *ui;
};

#endif // BORROW_H
