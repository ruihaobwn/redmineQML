#ifndef SINGLEDATA
#define SINGLEDATA

//作为单个的数据对象储存数据
#include <QObject>
#include <QDebug>


/*非常重要的一点：Qt Qmap中的string和数据库中的名称一致
    qml的所用数据的名称也是一致的   后期考虑改动*/

class SingleData : public QObject
{
    Q_OBJECT
public:
    explicit SingleData(QObject *parent = 0);

    void setVelue(QVariant variant);            //设置对象的初始值

    QVariantMap getValue() const;

    QVariant getData(QString str) const;        //从对象中取数据

    void setData(const QString str,const QVariant &value);                  //改变对象中的值

private:
    QMap<QString, QVariant> m_propertys;           //QString 保存的是role QVariant 保存的是值
};
#endif // SINGLEDATA

