import QtQuick 2.0

Rectangle {
    id: myActivities
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#activities1"}
        ListElement{name: "#activities2"}
        ListElement{name: "#activities7"}
    }

    ActDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

