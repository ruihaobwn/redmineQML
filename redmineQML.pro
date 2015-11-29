TEMPLATE = app

QT += qml quick widgets network
CONFIG += c++11

SOURCES += main.cpp \
    deliver.cpp \
    gerneric.cpp \
    listdata.cpp \
    myissuelist.cpp \
    mynetwork.cpp \
    myprojectlist.cpp \
    myway.cpp \
    singledata.cpp \
    user.cpp \
    usermessage.cpp

RESOURCES += qml.qrc \
    activities.qrc \
    broads.qrc \
    welcome.qrc \
    projects.qrc \
    pages.qrc \
    news.qrc \
    issues.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    deliver.h \
    gerneric.h \
    listdata.h \
    myissuelist.h \
    mynetwork.h \
    myprojectlist.h \
    myway.h \
    singledata.h \
    user.h \
    usermessage.h

