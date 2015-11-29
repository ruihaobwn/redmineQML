#include <QApplication>
#include <QQmlContext>
#include <QQuickView>
#include "listdata.h"
#include "mynetwork.h"
#include "deliver.h"
#include "usermessage.h"
#include <QScreen>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickView view;

    Deliver *deliver = new Deliver(&view);
    UserMessage* usermessage = new UserMessage;


//    qmlRegisterType<MyProjectList>("MyData",1,0,"prolist");
//    qmlRegisterType<MyIssueList>("MyData",1,0,"isulist");
    qmlRegisterType<ListData>("MyData",1,0,"listdata");

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    view.rootContext()->setContextProperty("user",usermessage);

    view.rootContext()->setContextProperty("deliver",deliver);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();
    return app.exec();
}
