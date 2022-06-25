#ifndef MENU_H
#define MENU_H

#include <QWidget>
#include <QSqlDatabase>
namespace Ui {
class menu;
}

class menu : public QWidget
{
    Q_OBJECT

public:
    explicit menu(QWidget *parent = nullptr);
    ~menu();

private slots:
    void on_pushButton_insert_clicked();

    void on_pushButton_quit_clicked();

    void on_pushButton_add_clicked();

    void on_pushButton_return_clicked();

    void on_pushButton_borrow_clicked();

    void on_pushButton_search_clicked();

private:
    Ui::menu *ui;

};

#endif // MENU_H
