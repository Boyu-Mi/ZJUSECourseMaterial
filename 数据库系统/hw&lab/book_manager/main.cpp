#include "login.h"

#include <QApplication>
#include <QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QSqlError>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
