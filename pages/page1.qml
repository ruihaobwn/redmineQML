import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../activities"
import "../issues"
import "../news"
import "../projects"

//用户登录成功后，进入的主界面

Rectangle {
    id: pages
//    width: parent.width
//    height: parent.height

    //导航栏
    Rectangle{
        id:nav
        color: "lightblue"
        height: parent.height*0.1
        width: parent.width
        anchors.top: pages.top

        Text{
            anchors.centerIn: parent
            text:"Redmine"
            font.pixelSize: 20
            font.family: "微软雅黑"
        }
//    }

    //搜索栏
    Rectangle{
        id: search
        color: "blue"
        width: parent.width
        height: parent.height*0.08
        //anchors.top: nav.bottom
        anchors.top: parent.top
        TextField{
            anchors.fill: parent
            placeholderText: "搜索"
            font.pixelSize: 18
            horizontalAlignment: TextInput.AlignHCenter
        }
    }

    //内容区域的model页面
    ListModel {
        id: listModel
        ListElement { name: "项目"; url: "../projects/Tabs.qml"}
        ListElement { name: "问题"; url: "../issues/Tabs.qml"}
        ListElement { name: "活动"; url: "../activities/Tabs.qml" }
        ListElement { name: "新闻"; url: "../news/Tabs.qml"}
    }
    //底部主菜单的model
    ListModel{
        id: models
        ListElement{names:"项目"; pic:""}
        ListElement{names:"问题"; pic:""}
        ListElement{names:"活动"; pic:""}
        ListElement{names:"新闻"; pic:""}
    }

    //内容区域 + 底部菜单栏
    //方式一：通过tab的点击切换界面
    //方式二：通过手势滑动实现界面切换(滑动时更改tab的id)
    PageControl{
        id:area
        listModel: listModel
        listModel_1: models
        width: parent.width
        height: parent.height*0.82
        anchors.top: search.bottom
        anchors.bottom: parent.bottom
    }
}

}
