import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Item {
    id: firstshow
    signal beclick()
    Rectangle{
        id: picControl
        height: parent.height*8/9
        width: parent.width
        clip: true

        Component {
            id: wel_delegate
            Rectangle {
                smooth: true
                width: picControl.width
                height: picControl.height
                Image {
                    source: pic
                    anchors.centerIn: parent
                }
            }
        }

        //三张图片介绍redmine，以pathView形式展示
        ListModel{
            id: model
            ListElement{pic:""}              //图片的来源
            ListElement{pic:""}
            ListElement{pic:""}
        }

        PathView {
            id: myPathView
            model: model
            delegate: wel_delegate

            width: parent.width
            anchors.top: parent.top
            anchors.bottom: picIndicator.top
            focus: true
            Keys.onRightPressed: if (!moving && interactive) incrementCurrentIndex()
            Keys.onLeftPressed: if (!moving && interactive) decrementCurrentIndex()

            flickDeceleration: 500  //滑动速度

            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            interactive: true
            path: Path {
                startX: - picControl.width * model.count / 2 + picControl.width / 2
                startY: picControl.height / 2
                PathLine {
                    x: picControl.width * model.count / 2 + picControl.width / 2
                    y: picControl.height / 2
                }
            }
        }

        Rectangle {
            id: picIndicator
            width: parent.width
            height: 40
            anchors.bottom: parent.bottom

            Row {
                anchors.centerIn: parent
                Repeater {
                    model: model.count
                    delegate: Rectangle {
                        width: 20
                        height: picIndicator.height
                        color: "white"
                        Rectangle {
                            anchors.centerIn: parent
                            width: 10
                            height: 10
                            color: (myPathView.currentIndex == index ? "black" : "gray")
                        }
                    }
                }
            }
            color: "white"
        }
    }

    //登录按钮
    Rectangle{
        id: login
        height: parent.height*1/9
        width: parent.width
        anchors.top: picControl.bottom
        color: "lightblue"
        Button{
            id: login_btn
            anchors.centerIn: parent

            text: "登录"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: login.width * 0.4
                    implicitHeight: login.height * 0.7
                    radius: 4
                    // 点击登录按钮时，按钮颜色变化
                    color: login_btn.pressed ? "green" : "lightgreen"
                }
            }
            onClicked: {
                firstshow.beclick();
                firstshow.destroy();
            }

        }
    }
}
