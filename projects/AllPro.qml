import QtQuick 2.0
import QtQuick.Controls 1.3
Rectangle {
    id: allProjects

    ListView {
        id: listView1

        width: parent.width
        height: parent.height*0.9
        anchors.bottom: parent.bottom
        model: deliver.makeObject(2)

        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true

        delegate: Item {
            width: listView1.width
            height: 62

            Text {

                text: name
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 3
                font.pixelSize: 12
            }

            Text {

                text: created_on
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                font.pixelSize: 12
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    myObject.projectList.symbol = index;
                    listView1.currentIndex = index
                    var path = "http://127.0.0.1:3000/redmine/projects/%1";
                    network.getQmlUrl(2,path.arg(id));
                    var path2 = "http://127.0.0.1:3000/redmine/projects/%1/issues";
                    network.getQmlUrl(3,path2.arg(id));

                    var oneProject = Qt.createComponent("oneProject.qml");

                    if(oneProject.status == Component.Ready)
                    {
                        var oneProjectObject = oneProject.createObject(allProjects);
                        oneProjectObject.width=allProjects.width;
                        oneProjectObject.height = allProjects.height;
                    }
                }
            }
        }
    }


    Rectangle{
        id: rectangle1
        height: parent.height * 0.1
        width: parent.width
        anchors.top: parent.top
        color: "lightblue"
        Text{
            anchors.centerIn: parent
            text:"所有项目"
            font.pointSize: 15
            font.family: "Times New Roman"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text1

            width: 40
            height: 20
            text: qsTr("添加")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.family: "Courier"
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            MouseArea {
                id: mouseArea1
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }
    Component.onCompleted: listView1.model.getNetworkData()
}

