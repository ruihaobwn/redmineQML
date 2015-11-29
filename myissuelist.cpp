
#include"myissuelist.h"

MyIssueList::MyIssueList()
{
    setRoleName();
}

//MyIssueList::MyIssueList(QByteArray byte):
//    ListData(byte)
//{
//    setRoleName();
//}

void MyIssueList::setRoleName()
{
    int n = Qt::UserRole;
    QStringList list;
    list<<"subject";
    for (int i = 0; i < list.size(); ++i)
    {
        m_roles[++n] = list[i].toUtf8();
    }
}

QHash<int, QByteArray> MyIssueList::roleNames() const
{
    return m_roles;
}
