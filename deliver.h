#ifndef DELIVER
#define DELIVER
#include <QObject>
#include "mynetwork.h"
#include "listdata.h"
#include "usermessage.h"


class Deliver : public QObject
{
    Q_OBJECT
public:
    explicit Deliver(QObject* parent = 0);

    ~Deliver();

    Q_INVOKABLE ListData* acquireObject(QString url);   //提供给qml的接口，调用CreateObect 返回对象指针给qml


    Q_INVOKABLE ListData* makeObject(int number);




private:
    QList<ListData* > m_listdata;


private:
    class Private;
    friend class Private;
    Private* d;
};

class Deliver::Private
{
public:
    Private()
    {
        netWorker = MyNetwork::instance();
    }

    MyNetwork *netWorker;
};


#endif // DELIVER





