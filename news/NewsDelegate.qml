import QtQuick 2.0

Rectangle {
    id: news
    width: parent.width
    height: parent.height

    property ListModel listModel
    //点击单独的项目时，进入新的界面
    Component{
        id: newsDelegate
        Text{
            text: name
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var newsPage = Qt.createComponent("details.qml");
                    if(newsPage.status == Component.Ready)
                    {
                        var page = newsPage.createObject(window);
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
        delegate: newsDelegate
    }
}

