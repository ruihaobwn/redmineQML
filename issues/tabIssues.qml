import QtQuick 2.0

Rectangle {
    id: tabIssues
    width: parent.width
    height: parent.height

    ListModel{
        id: model
        ListElement{name: "#tabIssues1"}
        ListElement{name: "#tabIissues2"}
        ListElement{name: "#tabIssues3"}
        ListElement{name: "#tabIssues7"}
    }

    IssuesDelegate{
        listModel: model
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}

