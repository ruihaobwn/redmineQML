#ifndef MYNETWORK
#define MYNETWORK
#include <QObject>
#include <QNetworkAccessManager>

class QNetworkAcessManager;
class QNetworkReply;
class QNetworkRequest;

class MyNetwork : public QObject
{
    Q_OBJECT
public:
    static MyNetwork* instance();
    ~MyNetwork();

     QNetworkReply* getUrl(QString url);

     QNetworkReply* postUrl(QString url,QByteArray byte);


private:
    class Private;
    friend class Private;
    Private *d;

    explicit MyNetwork(QObject *parent = 0);
    MyNetwork(const MyNetwork &) Q_DECL_EQ_DELETE;
    MyNetwork operator=(MyNetwork rhs) Q_DECL_EQ_DELETE;
};

class MyNetwork::Private
{
public:
    Private(MyNetwork *q) :
        manager(new QNetworkAccessManager(q))
    {}

    QNetworkAccessManager *manager;
};

#endif // MYNETWORK

