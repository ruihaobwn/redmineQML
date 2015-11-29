import QtQuick 2.0

Rectangle {
    id: someActivities
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#activities1"}
        ListElement{name: "#activities3"}
        ListElement{name: "#activities4"}
        ListElement{name: "#activities6"}
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

