import QtQuick 2.11
import QtQuick.Controls 2.4
import Qt5Compat.GraphicalEffects

import utils 1.0
import myControls


Item {
    id: root

    property string currentItemName: menuModel.get(mainMenuList.currentIndex).text

    signal menuItemClicked(var name)
    ListModel {
        id: menuModel
        ListElement { text: "Dashboard" }
        ListElement { text: "Products" }
        ListElement { text: "Calendar" }
        ListElement { text: "Courses" }
        ListElement { text: "Latest News" }
        ListElement { text: "Web Radio" }
    }

    Rectangle {
        id: mainMenuColorFill
        width: parent.width
        height: parent.height
//        height: Style.resize(402)

        color: Style.mainColor
        ListView {
            id: mainMenuList
            anchors.fill: parent
//            anchors.centerIn: parent
            anchors.topMargin: 100
            interactive: false

            spacing: 15
            model: menuModel
            highlight: Item{
                id: selectedItem
                width: parent.width
                height: 47

                // Tall Rectangle
                Rectangle{
                    width: parent.height - 20
                    height: parent.height * 2
                    color: Style.bgColor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                }
                //the above circle
                Rectangle{
                    height: 50
                    width: height
                    radius: width
                    anchors.right: parent.right
                    anchors.bottom: parent.top
                    color: Style.mainColor
                }
                //the below circle
                Rectangle{
                    height: 50
                    width: height
                    radius: width
                    anchors.right: parent.right
                    anchors.top: parent.bottom
                    color: Style.mainColor
                }
                //the text highlight
                Rectangle{
                    width: parent.width - 10
                    height: parent.height
                    color: Style.bgColor
                    radius: height
                    anchors.right: parent.right

                }
            }

            delegate: ItemDelegate {
                id: itemDelegate
                width: parent.width
                height: 47
                anchors.leftMargin: 50
                background: Item { }

                contentItem: Item {
                    anchors.fill: parent
                    anchors.leftMargin: 50
                    Label {
                        id: label
                        anchors.leftMargin: Style.resize(20)
                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.verticalCenterOffset: Style.resize(3)
                        text: model.text
//                        color:  ? Style.mainColor : Style.inactiveColor
                        color: itemDelegate.ListView.isCurrentItem? Style.mainColor : "#fff"
                    }
                }

                onClicked: {
                    mainMenuList.currentIndex = index;
                    root.menuItemClicked(label.text);
                    console.log(currentItemName)
                }
            }
        }
    }
}
