#ifndef USER
#define USER
#include "listdata.h"

class User : public ListData
{
    Q_OBJECT
public:
    User();
    ~User();
    void setRoleName();

    QHash<int, QByteArray> roleNames() const;

    virtual void getNetworkData();
    virtual void postNetworkData();

};



#endif // USER

