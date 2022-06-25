#ifndef BATCH_H
#define BATCH_H

#include <QWidget>
#include <QLineEdit>
#include <QMainWindow>
#include <QPushButton>
namespace Ui {
class batch;
}

class batch : public QWidget
{
    Q_OBJECT

public:
    explicit batch(QWidget *parent = nullptr);
    ~batch();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();
    void readfiles();
private:
    Ui::batch *ui;
    QLineEdit *filename;
    QPushButton *button;
    QString file_name;
};

#endif // BATCH_H
