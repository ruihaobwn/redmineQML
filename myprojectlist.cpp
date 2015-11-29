
#include "myprojectlist.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

MyProjectList::MyProjectList()
{
    m_replyType = new ReplyType;
    setRoleName();
}

//MyProjectList::MyProjectList(QByteArray byte):
//    ListData(byte)
//{
//    setRoleName();
//}

void MyProjectList::setRoleName()
{
    int n = Qt::UserRole;
    QStringList list;
    list<<"id"<<"name"<<"created_on"<<"description"<<"parent_id";
    for (int i = 0; i < list.size(); ++i)
    {
        m_roles[++n] = list[i].toUtf8();
    }
}

QHash<int, QByteArray> MyProjectList::roleNames() const
{
    return m_roles;
}

void MyProjectList::getNetworkData()
{
    qDebug()<<"myprojectlist getNetworkdata";
    m_replyType->m_reply = d->netWorker->getUrl("http://127.0.0.1:3000/redmine/projects");
    m_replyType->type = 1;
    m_replyType->url = "projects";

    connect(m_replyType->m_reply,SIGNAL(finished()),this,SLOT(replyFinished()));
}

void MyProjectList::setModelData()
{
    m_replyType->m_reply->deleteLater();

    if(m_replyType->m_reply->error() == QNetworkReply::NoError&&
            m_replyType->type == 1)
    {
        QByteArray array = m_replyType->m_reply->readAll();
        qDebug()<<QString(array);
        QJsonParseError error;
        QJsonDocument jsonDoc = QJsonDocument::fromJson(array,&error);

        if(error.error == QJsonParseError::NoError)
        {
            if(jsonDoc.isArray())
            {
                SingleData* singdata;
                foreach (QVariant variant, jsonDoc.toVariant().toList())
                {
                    singdata = new SingleData();
                    singdata->setVelue(variant);
                    appendOne(singdata);
                }
            }
        }
    }
}



