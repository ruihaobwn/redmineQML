#ifndef USERMESSAGE
#define USERMESSAGE
#include <QObject>
#include <QNetworkReply>
#include "listdata.h"

class UserMessage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString  loginName READ loginName WRITE setLoginName NOTIFY loginNameChanged)
    Q_PROPERTY(QString passWord READ passWord WRITE setPassWord NOTIFY passWordChanged)
public:
    UserMessage();
    ~UserMessage();

    Q_INVOKABLE QString loginName() const;
    Q_INVOKABLE QString passWord() const;

    Q_INVOKABLE bool verify();

    Q_INVOKABLE void getNetworkData();
    Q_INVOKABLE void postNetworkData();

public slots:
    void setLoginName(const QString name);
    void setPassWord(const QString pass);


signals:
    void passWordChanged(QString str);
    void loginNameChanged(QString str);


protected slots:
    bool replyFinished();

protected:
    QHash<int,QByteArray> m_roles;     //QByteArray 保存的是role值
    void setModelData();


    ReplyType *m_replyType;

    class Private;
    friend class Private;
    Private* d;

private:
    QString m_loginName;
    QString m_password;
    QString api_key;
};

class UserMessage::Private
{
public:
    Private()
    {
        netWorker = MyNetwork::instance();
    }

    MyNetwork *netWorker;
};


#endif // USERMESSAGE

