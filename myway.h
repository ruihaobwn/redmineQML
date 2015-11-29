#ifndef MYWAY
#define MYWAY
#include <QObject>

class QJsonDocument;
class QJsonObject;
class QJsonArray;

class MyWay : public QObject
{
    Q_OBJECT
public:
    MyWay();
    ~MyWay();

    static QByteArray JsontoByte(QJsonObject &object);

    static QByteArray JsontoByte(QJsonArray &array);


};

#endif // MYWAY

