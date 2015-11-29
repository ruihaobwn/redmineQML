#ifndef MYISSUELIST
#define MYISSUELIST
#include "listdata.h"
class MyIssueList:public ListData
{
    Q_OBJECT
public:
    MyIssueList();
    MyIssueList(QByteArray byte);
    void setRoleName();
    QHash<int, QByteArray> roleNames() const;
};

#endif // MYISSUELIST

