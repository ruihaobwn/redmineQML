
#include "user.h"
#include <QDebug>

User::User()
{
    m_replyType = new ReplyType;
}

User::~User()
{

}

void User::setRoleName()
{
    int n = Qt::UserRole;
    QStringList list;
    list<<"loginName"<<"passWord";
    for (int i = 0; i < list.size(); ++i)
    {
        m_roles[++n] = list[i].toUtf8();
    }
}

QHash<int, QByteArray> User::roleNames() const
{
    return m_roles;
}



void User::getNetworkData()
{

}



void User::postNetworkData()
{
    QByteArray array = getSourceData();

    m_replyType->m_reply = d->netWorker->postUrl("http://127.0.0.1:3000/redmine/login",array);

    qDebug()<<"hello";
    m_replyType->url = "login";
    m_replyType->type = 1;
    QObject::connect(m_replyType->m_reply,SIGNAL(finished()),this,SLOT(replyFinished()));
}
