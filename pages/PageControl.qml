import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {   
    id: pageControl
    clip: true
    property ListModel listModel
    property ListModel listModel_1
    //signal pageChanged(int page)

    //滑动切换页面的delegate
    Component{
        id: pageDelegate
        Rectangle{
            width: pageControl.width  //必须有宽度高度设定
            height: pageControl.height * 0.9
            smooth: true
            Loader{
                id: load
                source: url
            }
        }
    }

    //pathView实现滑动切换页面
    PathView {
        id: myPathView
        anchors.top: parent.top
        anchors.bottom: menuIndicator.top

        model: listModel
        delegate: pageDelegate

        width: parent.width  //必须有宽度设定

        focus: true
        Keys.onRightPressed: if (!moving && interactive) incrementCurrentIndex()
        Keys.onLeftPressed: if (!moving && interactive) decrementCurrentIndex()

        flickDeceleration: 500  //滑动速度

        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5

        interactive: true

        path: Path {
            startX: - parent.width * listModel.count / 2 + parent.width / 2
            startY: pageControl.height / 2
            PathLine {
                x: parent.width * listModel.count / 2 + parent.width / 2
                y: parent.height / 2
            }
        }
    }



    //主菜单切换的delegate
    Component{
        id: menuDeleagte
        Rectangle{
            width: pageControl.width * 0.25
            height: pageControl.height * 0.1
            border.color: "lightblue"
            color: (myPathView.currentIndex == index ? "lightblue" : "lightyellow")
            ColumnLayout{
                anchors.centerIn: parent
                Image{
                    id: btnImage
                    source: pic
                }
                Label{
                    id: btn
                    text: names
                    color: (myPathView.currentIndex == index ? "blue" : "lightblue")
                }
            }
            //点击指定一个view时切换到指定的page页面
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
    }

    //用listView横向放置model，实现切换后的效果
    ListView{
        id: menuIndicator
        width: parent.width
        height: parent.height * 0.1
        anchors.bottom: pageControl.bottom
        focus: true
        model: listModel_1
        delegate: menuDeleagte

        orientation: Qt.Horizontal
        layoutDirection: Qt.LeftToRight
    }
}



