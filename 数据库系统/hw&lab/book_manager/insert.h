#ifndef INSERT_H
#define INSERT_H

#include <QWidget>


namespace Ui {
class insert;
}

class insert : public QWidget
{
    Q_OBJECT

public:

    explicit insert(QWidget *parent = nullptr);
    ~insert();

private slots:
    void on_pushButton_clicked();

    void on_lineEdit_editingFinished();

    void on_lineEdit_5_editingFinished();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

private:
    Ui::insert *ui;
};

#endif // INSERT_H
