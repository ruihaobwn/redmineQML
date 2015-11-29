import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    id: one_project
    visible: true
    Rectangle{
        id: rect1
        anchors.top:parent.top
        width: parent.width
        height: parent.height*0.05
        color: "yellow"
        MouseArea{
            id:back
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width*0.1;
            height: parent.height
            onClicked: one_project.destroy()
        }

        ListView {
            id: listView1
            anchors.left:back.right
            anchors.right: parent.right
            height: parent.height
            flickableDirection: Flickable.HorizontalFlick
            orientation: ListView.Horizontal
            spacing: 10
            layoutDirection: Qt.LeftToRight
            model: ["概述","活动","问题","甘特图","日历","新闻"]
            delegate: Text {

                text: modelData
                anchors.verticalCenter: parent.verticalCenter
                color: (listView2.currentIndex == index ? "red" : "black")
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listView2.currentIndex = index
                    }
                }
            }
        }
    }

    ListView {
        id: listView2
        anchors.top: rect1.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        focus: true
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 1                              //快速的滑动


        interactive: true
        model: ListModel {
            ListElement {name: "概述";url:"./proJieshao.qml"}
            ListElement {name: "活动";url:"./proActive.qml"}
            ListElement {name: "问题";url:"./oneIssue.qml"}
//            ListElement {name: "甘特图"}
//            ListElement {name: "日历"}
//            ListElement {name: "新闻"}
        }
        delegate: Item{
            width: ListView.view.width
            height: ListView.view.height
            Loader{
                anchors.fill: parent
                source: url
            }
        }
    }
}

