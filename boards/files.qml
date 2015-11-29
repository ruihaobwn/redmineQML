import QtQuick 2.0

Rectangle {
    id: files
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#files1"}
        ListElement{name: "#files2"}
        ListElement{name: "#files3"}
        ListElement{name: "#files7"}
    }

    BoardsDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

