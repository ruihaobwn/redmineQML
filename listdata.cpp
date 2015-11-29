
#include <QDebug>
#include "mynetwork.h"
#include "singledata.h"
#include "listdata.h"
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonParseError>

ListData::ListData():d(new ListData::Private)
{

}

ListData::ListData(QList<SingleData *> source)
{
    m_source = source;
}


ListData::~ListData()
{

}

void ListData::setSourceData(const QList<SingleData *> data)
{
    m_source = data;
}

QByteArray ListData::getSourceData() const
{
    QVariantList list;

    for(int i = 0;i < m_source.count();i++)
    {
        list.append(m_source.at(i)->getValue());
    }
    QVariant variant(list);
    return variant.toByteArray();
}

void ListData::insertItem(int index, SingleData *data)
{
    QList<SingleData*> temp;
    temp.append(data);
    insertItems(index,temp);
}

void ListData::insertItems(int index, QList<SingleData *> data)
{
    if(index < 0||index > m_source.count())
        return;
    beginInsertRows(QModelIndex(),index,index+data.count()-1);
    for(int i = 0;i<data.count(); i++)
    {
        m_source.insert(index+i,data.at(i));
    }
    endInsertRows();
    return;
}

void ListData::appendItems(QList<SingleData *> data)
{

    insertItems(m_source.count(),data);
}

void ListData::appendOne(SingleData *data)
{
    QList<SingleData*> temp;
    temp.append(data);
    insertItems(m_source.count(),temp);
}

int ListData::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_source.count();
}

QVariant ListData::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_source.count())
        return QVariant();

    const SingleData *sidata = m_source[index.row()];
    QByteArray array = m_roles.value(role);

    return sidata->getData(QString(array));

}

bool ListData::setInModelData(const int index, QVariant &value, QString role)
{
    if(index < 0 || index >= m_source.count())
        return false;
    SingleData *sdata = m_source[index];
    sdata->setData(role,value);
    return true;
}

bool ListData::setInItemData(int index, QMap<QString, QVariant> roles)
{
    qDebug()<<roles;
    for (QMap<QString, QVariant>::Iterator it = roles.begin(); it != roles.end(); ++it)
    {
        setInModelData(index, it.value(), it.key());

    }
    return true;
}

void ListData::postNetworkData()
{

}

void ListData::postOneData(int index)
{

}

void ListData::getNetworkData()
{


}

bool ListData::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(QModelIndex(),row,row+count-1);
    for(int i = 0; i<count; i++)
    {
        SingleData *data = new SingleData;
        m_source.insert(row+i,data);
    }
    endInsertRows();
}

void ListData::setModelData()
{

    return;
}


void ListData::setRoleName()
{

}

bool ListData::replyFinished()
{
    if(m_replyType->type == 1)    //有数据返回
    {
        setModelData();
        return true;
    }
    else
    {
        return true;
    }
    return false;
}

//void ListData::setModelData(const int index, QVariant value)
//{
//    if(index<0||index>=m_singleList.count())
//        return;
//    SingleData *sigdata = m_singleList[index];
//    sigdata->setData(value);
//}
