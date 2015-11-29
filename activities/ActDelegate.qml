import QtQuick 2.0

Rectangle {
    id: act
    width: parent.width
    height: parent.height

    property ListModel listModel
    //点击单独的项目时，进入新的界面
    Component{
        id: actDelegate
        Text{
            text: name
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var actPage = Qt.createComponent("details.qml");
                    if(actPage.status == Component.Ready)
                    {
                        var page = actPage.createObject(window);
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
        delegate: actDelegate
    }
}

