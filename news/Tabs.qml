import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: parent.width
    height: parent.height

    TabView{
        Tab{
            title: "所有新闻"
            source: "allNews.qml"
            active: true
        }
        Tab{
            title: "项目新闻"
            source: "someNews.qml"
            active: true
        }
        Tab{
            title: "我的新闻"
            source: "myNews.qml"
            active: true
        }
    }
}

