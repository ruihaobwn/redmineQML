import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: parent.width
    height: parent.height

    TabView{
        Tab{
            title: "讨论区"
            source: "boards.qml"
            active: true
        }
        Tab{
            title: "共享文件"
            source: "files.qml"
            active: true
        }
    }
}

