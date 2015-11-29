import QtQuick 2.0

Rectangle {
    id: issues
    width: parent.width
    height: parent.height

    property ListModel listModel
    //点击单独的项目时，进入新的界面
    Component{
        id: issuesDelegate
        Text{
            text: name
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var issuessPage = Qt.createComponent("details.qml");
                    if(issuessPage.status == Component.Ready)
                    {
                        var page = issuessPage.createObject(window);
                    }
                }
            }
        }
    }

    ListView{
        id: item
        width: parent.width
        height: parent.height
        focus: true
        model: listModel
        delegate: issuesDelegate
    }
}

