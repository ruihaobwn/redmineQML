import QtQuick 2.0
import "../issues"

Rectangle {
    id: onePro
    width: parent.width
    height: parent.height

    //导航栏
    //backButton + 所有问题和参与的问题/讨论和共享文件/成员和我自己/日历和甘特图
    Rectangle{
        id: proNav
        height: parent.height * 0.1
        width: parent.width
        Rectangle{
            id: backButton
            anchors.left: parent.left
            height: parent.height
            width: parent.width * 0.2
            radius: 4
            color: backmouse.pressed ? "yellow" : "lightblue"
            //返回上一页面时，删除此页面
            MouseArea {
                id: backmouse
                anchors.fill: parent
                onClicked:{
                    onePro.destroy();
                }
            }
        }
        Text{
            height: parent.height
            width: parent.width * 0.6
            anchors.centerIn: parent
            anchors.left: backButton.right
            text: "names"
        }
    }

    //内容区域  +  主菜单栏（使用pages资源文件下的页面代理delegate）
    /*所有问题和参与的问题列表,讨论和共享文件列表,成员和我自己列表,日历和甘特图列表*/
    PageControl{
        height: parent.height * 0.9
        width: parent.width
        id:area
        listModel: listModel
        listModel_1: models
        anchors.top: proNav.bottom
        anchors.bottom: parent.bottom
    }

    //内容区域的model页面
    ListModel {
        id: listModel
        ListElement { name: "问题"; url: "../issues/tab.qml"}
        ListElement { name: "讨论"; url: "../issues/tab.qml"}
        ListElement { name: "成员"; url: "../issues/tab.qml" }
        ListElement { name: "日历"; url: "../issues/tab.qml"}
    }

    //底部主菜单的model
    ListModel{
        id: models
        ListElement{names:"问题1"; pic:""}
        ListElement{names:"讨论1"; pic:""}
        ListElement{names:"成员1"; pic:""}
        ListElement{names:"日历1"; pic:""}
    }
}

