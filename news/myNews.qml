import QtQuick 2.0
import QtQuick.Controls 1.2

/* 管理员：所有项目新闻 + 参与项目任务的项目新闻
   项目组长/报告人/开发人 ：参加的所有项目新闻*/

Rectangle {
    id: myNews
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#news1"}
        ListElement{name: "#news2"}
        ListElement{name: "#news5"}
    }

    NewsDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

