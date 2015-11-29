import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: parent.width
    height: parent.height

    TabView{
        Tab{
            title: "所有问题"
            source: "tabIssues.qml"
            active: true
        }
        Tab{
            title: "我的问题"
            source: "tabMyIssues.qml"
            active: true
        }
    }
}

