import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import QtQuick.Controls.Styles 1.4
import "../pages"
import "../issues"
import MyData 1.0


Rectangle{

    id: show_login

    signal logSucess()

    Rectangle{
        id: logo
        height: parent.height * 0.1
        width: parent.width
        anchors.top: parent.top
        color: "lightblue"
        Text{
            anchors.centerIn: parent
            text:"Redmine"
            anchors.verticalCenterOffset: 3
            anchors.horizontalCenterOffset: 0
            font.pointSize : 18
            font.family: "微软雅黑"
        }
    }

    Column{
        id:col

        width: show_login.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: show_login.height*0.05
        Column{
            id:col2
            width: parent.width
            spacing: 0.5
            TextField{
                id: user_input
                width: parent.width

                placeholderText:qsTr("用户名")
                inputMethodHints: Qt.ImhNoPredictiveText
                focus: true
            }

            TextField{
                id: pass_input
                width: parent.width

                echoMode:TextInput.Password
                placeholderText: qsTr("密码")
                focus:true
            }
        }


        Button {
            id: button1
            function passMessage(){
                var flag = false

                user.setLoginName(user_input.text)

                user.setPassWord(pass_input.text);
                flag = user.verify();
                if(flag)
                {
                    show_login.destroy()
                    show_login.logSucess()
                }

            }
            width: parent.width*0.8
            height: show_login.height*0.05
            text: qsTr("登录")
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {                                                    //登陆函数
                id: mouseArea2

                anchors.fill: parent
                onClicked: button1.passMessage()
            }
        }
    }

}


//            Row{
//                anchors.top: input.bottom
//                anchors.bottom: parent.bottom
//                //点击取消按钮时，按钮颜色变化
//                RowLayout{
//                    Button{
//                        id: cancel_btn
//                        text: "取消"
//                        MouseArea{
//                            anchors.fill: parent
//                            onClicked: {
//                                //show_login.destroy();  //销毁登陆框的qml
//                            }
//                        }
//                    }
//                    Button{
//                        id: log_btn
//                        text: "登录"
//                        MouseArea{    //跳转至项目界面

//                            anchors.fill: parent
//                            onClicked: {
//                                 //network.getQmlUrl(1,"http://localhost:3000/redmine/projects");
//                                 show_login.destroy();
//                                 show_login.logSucess();

//    //                            var page = Qt.createComponent("../pages/page1.qml");
//    //                            if(page.status == Component.Ready)
//    //                            {
//    //                                page.createObject(window);

//    //                            }

//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }



