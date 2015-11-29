import QtQuick 2.0

Rectangle {
    id: boards
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#boards1"}
        ListElement{name: "#boards2"}
        ListElement{name: "#boards3"}
        ListElement{name: "#boards7"}
    }

    BoardsDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

