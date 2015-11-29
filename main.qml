import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
import "./welcome"
import "./projects"

//欢迎界面 + 登录界面

Rectangle {
    id: window
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    //欢迎界面，介绍redmine图片
    PicControl{
        id: pictures
        anchors.fill: parent
        onBeclick: login.visible = true
    }

    //登录界面
    Login{
        id:login

        anchors.fill: parent
        visible: false
    }
    Connections{
        target: login
        onLogSucess:{
            var page = Qt.createComponent("projects/AllPro.qml");

            if(page.status == Component.Ready)
            {
                var pagelogin = page.createObject(window);
                pagelogin.width=window.width;
                pagelogin.height = window.height;


            }
        }
    }
}

//        Connections{
//            target: login
//            onLogSucess: {

//                var page = Qt.createComponent("./pages/page1.qml");


//                if(page.status == Component.Ready)
//                {
//                    console.log("hello");
//                    var pagelogin = page.createObject(main);
//                    pagelogin.width=main.width;
//                    pagelogin.height = main.height;
//                }







    /*Rectangle{
        id: rect
        width: parent.width
        height: parent.height

        Button{
            id: click
            text: "按下"
            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    var pages = Qt.createComponent("../pages/page1.qml");
                    if(pages.status == Component.Ready)
                    {
                        var page = pages.createObject(window);
                    }
                }
            }
        }
    }

    /*Rectangle{
        states: [
            State{
                name:"hide"
                PropertyChanges{
                    target: click
                    opacity: 0
                    enabled:false
                }
            },
            State{
                name: "show"
                PropertyChanges{
                    target: click
                    opacity: 1
                    enabled:true
                }
            }
        ]

        transitions: [
            Transition {
                from: "hide"
                to: "show"
                NumberAnimation { properties: "opacity"; easing.type: Easing.Linear;
                    duration: 200
                }
            },
            Transition {
                from: "show"
                to: "hide"
                NumberAnimation { properties: "opacity"; easing.type: Easing.Linear;
                    duration: 200
                }
            }
        ]
    }*/


