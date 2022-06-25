#ifndef RETURN_BOOK_H
#define RETURN_BOOK_H

#include <QWidget>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QSqlError>
#include <menu.h>

namespace Ui {
class return_book;
}

class return_book : public QWidget
{
    Q_OBJECT

public:
    explicit return_book(QWidget *parent = nullptr);
    ~return_book();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

private:
    Ui::return_book *ui;
};

#endif // RETURN_BOOK_H
