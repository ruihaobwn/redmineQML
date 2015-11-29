import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: parent.width
    height: parent.height

    TabView{
        Tab{
            title: "所有问题"
            source: "allIssues.qml"
            active: true
        }
        Tab{
            title: "项目问题"
            source: "someIssues.qml"
            active: true
        }
        Tab{
            title: "我的问题"
            source: "myIssues.qml"
            active: true
        }
    }
}

