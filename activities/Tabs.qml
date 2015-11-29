import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: parent.width
    height: parent.height

    TabView{
        Tab{
            title: "所有活动"
            source: "allActivities.qml"
            active: true
        }
        Tab{
            title: "项目活动"
            source: "someActivities.qml"
            active: true
        }
        Tab{
            title: "我的活动"
            source: "myActivities.qml"
            active: true
        }
    }
}

