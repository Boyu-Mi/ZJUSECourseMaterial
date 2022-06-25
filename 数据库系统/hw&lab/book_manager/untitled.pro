QT       += core gui
QT += sql


greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    add.cpp \
    batch.cpp \
    borrow.cpp \
    insert.cpp \
    login.cpp \
    main.cpp \
    menu.cpp \
    return_book.cpp \
    select.cpp

HEADERS += \
    add.h \
    batch.h \
    borrow.h \
    insert.h \
    login.h \
    menu.h \
    return_book.h \
    select.h

FORMS += \
    add.ui \
    batch.ui \
    borrow.ui \
    insert.ui \
    login.ui \
    menu.ui \
    return_book.ui \
    select.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    image/img.qrc
