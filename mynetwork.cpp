
#include "mynetwork.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QJsonObject>
#include <QJsonDocument>
#include <QByteArray>
#include <QDebug>


MyNetwork *MyNetwork::instance()
{
    static MyNetwork netWorker;
    return &netWorker;
}

MyNetwork::MyNetwork(QObject *parent):
    QObject(parent),d(new MyNetwork::Private(this))
{


}

MyNetwork::~MyNetwork()
{
    delete d;
    d = 0;
}

QNetworkReply* MyNetwork::getUrl(QString url)
{
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    QNetworkReply *reply =  d->manager->get(request);
    return reply;

}


QNetworkReply* MyNetwork::postUrl(QString url,QByteArray byte)
{

    QNetworkRequest request;

    request.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json"));
    request.setUrl(QUrl(url));
    QNetworkReply *reply = d->manager->post(request,byte);
    return reply;
}

//void MyNetwork::deleteQmlUrl(int type,QString str)
//{

//}

//bool MyNetwork::replyFinished(QNetworkReply *reply)
//{
//    reply->deleteLater();
//    if(reply->error()==QNetworkReply::NoError)
//    {
//        for (int i = 0; i < m_response.size(); ++i)
//        {
//            if (m_response.at(i)->m_reply == reply)
//            {
//                QByteArray bytes = reply->readAll(); //获取字节
//                qDebug()<<bytes;
//                emit dataRecieved(m_response.at(i)->data,bytes);
//                return true;
//            }
//        }

//    }
//    return false;
//}
