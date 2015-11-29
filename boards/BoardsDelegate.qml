import QtQuick 2.0

Rectangle {
    id: boards
    width: parent.width
    height: parent.height

    property ListModel listModel
    //点击单独的项目时，进入新的界面
    Component{
        id: boardsDelegate
        Text{
            text: name
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var boardsPage = Qt.createComponent("details.qml");
                    if(boardsPage.status == Component.Ready)
                    {
                        var page = boardsPage.createObject(window);
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
        delegate: boardsDelegate
    }
}

