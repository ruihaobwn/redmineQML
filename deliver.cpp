
#include "deliver.h"
#include "user.h"
#include "myprojectlist.h"


Deliver::Deliver(QObject* parent):
    QObject(parent)
{

}

Deliver::~Deliver()
{

}

ListData* Deliver::acquireObject(QString url)
{

    ListData *data = new ListData;
    m_listdata.append(data);
    return data;
}


ListData* Deliver::makeObject(int number)
{
    ListData *listdata = NULL;
    switch (number) {
    case 1:                                       //user类
        listdata = new User;
        m_listdata.append(listdata);

        break;
    case 2:                                       //项目列表
        listdata = new MyProjectList;
        m_listdata.append(listdata);
        break;

    default:
        break;
    }
    return listdata;
}










