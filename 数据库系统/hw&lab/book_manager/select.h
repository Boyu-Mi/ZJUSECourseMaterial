#ifndef SELECT_H
#define SELECT_H

#include <QWidget>
#include <QLineEdit>
#include <QMainWindow>
#include <QPushButton>
#include <QTableView>
#include <QStandardItemModel>
#include "ui_select.h"
#include <QSqlTableModel>
#include <QComboBox>

namespace Ui {
class select;
}

class select : public QWidget
{
    Q_OBJECT

public:
    explicit select(QWidget *parent = nullptr);
    ~select();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::select *ui;
    QSqlTableModel *model;
};

#endif // SELECT_H
