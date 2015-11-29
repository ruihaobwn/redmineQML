/* 需要在qml中按列表显示的类;例如项目列表
*/

#ifndef LISTDATA
#define LISTDATA

#include <QAbstractListModel>
#include "mynetwork.h"
#include <QNetworkReply>
#include "singledata.h"

struct ReplyType
{
    QNetworkReply *m_reply;
    int type;
    QString url;
};

class MyNetwork;

class ListData : public QAbstractListModel
{
    Q_OBJECT
public:
    ListData();

    explicit ListData(QList<SingleData*> source);

    virtual ~ListData();

    //与 Network 进行交互
    Q_INVOKABLE virtual void postNetworkData();       //上传数据的所有对象
    Q_INVOKABLE virtual void postOneData(int index);  //上传单个数据项
    Q_INVOKABLE virtual void getNetworkData();    //获取项目的数据

    //与qml进行交互
public:
    //qml 向对象模型中插入项
    Q_INVOKABLE virtual bool insertRows(int row, int count, const QModelIndex &parent);

    Q_INVOKABLE inline bool insertRow(int row, const QModelIndex &parent = QModelIndex());

    void setSourceData(const QList<SingleData*> data);

    QByteArray getSourceData() const;

    void insertItem(int index, SingleData* data);

    void insertItems(int index, QList<SingleData*> data);

    void appendItems(QList<SingleData*> data);

    void appendOne(SingleData* data);

    virtual void setRoleName();

    virtual int rowCount(const QModelIndex & parent = QModelIndex()) const;

    virtual QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    bool setInModelData(const int index, QVariant &value, QString role);

    Q_INVOKABLE bool setInItemData(const int index, QMap<QString, QVariant> roles);


    //virtual bool setData(const QModelIndex &index, const QVariant &value, int role);

     //virtual void setItemData(const QModelIndex &index, const QMap<int, QVariant> &roles);

    //Q_INVOKABLE void setModelData(const int index, QVariant value);

protected slots:
    bool replyFinished();

protected:
    QHash<int,QByteArray> m_roles;     //QByteArray 保存的是role值
    virtual void setModelData();
    ReplyType *m_replyType;

    class Private;
    friend class Private;
    Private* d;


private:
    QList<SingleData*> m_source;


};

class ListData::Private
{
public:
    Private()
    {
        netWorker = MyNetwork::instance();
    }

    MyNetwork *netWorker;
};


inline bool ListData::insertRow(int row, const QModelIndex &parent)
{
    insertRows(row,1,parent);
    return true;
}

#endif // LISTDATA

