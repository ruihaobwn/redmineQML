import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: allActivities
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#activities1"}
        ListElement{name: "#activities2"}
        ListElement{name: "#activities3"}
        ListElement{name: "#activities4"}
        ListElement{name: "#activities5"}
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

