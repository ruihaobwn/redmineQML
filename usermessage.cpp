
#include "UserMessage.h"
#include "mynetwork.h"
#include "gerneric.h"

#include <QDebug>
#include <QEventLoop>
#include <QJsonObject>
#include <QJsonDocument>


UserMessage::UserMessage():d(new UserMessage::Private)
{
    m_replyType = new ReplyType;
}

UserMessage::~UserMessage()
{

}

QString UserMessage::loginName() const
{
    return m_loginName;

}

QString UserMessage::passWord() const
{
    return m_password;
}

void UserMessage::setLoginName(const QString name)
{
    m_loginName = name;
    emit loginNameChanged(name);
}

void UserMessage::setPassWord(const QString pass)
{
    m_password = pass;

    emit passWordChanged(pass);
}

bool UserMessage::verify()
{

    QJsonObject jobject;
    jobject.insert("loginName",m_loginName);
    jobject.insert("passWord",m_password);
    QJsonDocument jdoc(jobject);
    QByteArray array = jdoc.toJson();


    QEventLoop eventLoop;
    m_replyType->m_reply = d->netWorker->postUrl(Gerneric::Base_url+"login",array);
    connect(m_replyType->m_reply,SIGNAL(finished()),&eventLoop,SLOT(quit()));
    m_replyType->type = 1;
    m_replyType->url = "login";
    eventLoop.exec();

    if(m_replyType->m_reply->error() == QNetworkReply::NoError)
    {
        QByteArray array = m_replyType->m_reply->readAll();
        QJsonParseError error;
        QJsonDocument jsonDoc = QJsonDocument::fromJson(array,&error);
        if(error.error==QJsonParseError::NoError)
        {
            if(jsonDoc.isObject())
            {
                QJsonObject object = jsonDoc.object();
                QJsonValue value = object.value("value");
                if(value.isString())
                {
                    api_key = value.toString();
                }
            }
        }
        return true;
    }
    return false;
}

void UserMessage::getNetworkData()
{

}

void UserMessage::postNetworkData()
{

}

bool UserMessage::replyFinished()
{
    if(m_replyType->type ==1)
    {
        setModelData();
        return true;
    }
    return false;
}

void UserMessage::setModelData()
{

}


