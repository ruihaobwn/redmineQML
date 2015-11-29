import QtQuick 2.0

Rectangle {
    id: someIssues
    height: parent.height
    width: parent.height

    ListModel{
        id: model
        ListElement{name: "#issues1"}
        ListElement{name: "#issues2"}
        ListElement{name: "#issues3"}
        ListElement{name: "#issues5"}
        ListElement{name: "#issues7"}
    }

    IssuesDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

