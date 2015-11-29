import QtQuick 2.0

Rectangle {
    id: oneIssue

    ListView {
        id: listView1
        anchors.fill: parent
        delegate: Item{
            width: listView1.width
            height: 62
            Text{
                text: subject
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5
            }
        }

        model: myObject.isuOfPro
    }
}


