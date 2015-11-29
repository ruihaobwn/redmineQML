
#include"singledata.h"

SingleData::SingleData(QObject *parent):
    QObject(parent)
{

}

void SingleData::setVelue(QVariant variant)
{
    QMapIterator<QString,QVariant> i(variant.toMap());
    while (i.hasNext()) {
        i.next();
        m_propertys[i.key()] = i.value();
    }
}

QVariantMap SingleData::getValue() const
{
    return m_propertys;
}

QVariant SingleData::getData(QString str) const
{
    return m_propertys.value(str);
}

void SingleData::setData(const QString str, const QVariant &value)
{
    m_propertys.insert(str,value);
}

