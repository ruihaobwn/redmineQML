#ifndef MYPROJECTLIST
#define MYPROJECTLIST
#include "listdata.h"

class MyProjectList : public  ListData
{
    Q_OBJECT
public:
    MyProjectList();

    MyProjectList(QByteArray byte);

    void setRoleName();

    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE virtual void getNetworkData();

    virtual void setModelData();

};

#endif // MYPROJECTLIST

