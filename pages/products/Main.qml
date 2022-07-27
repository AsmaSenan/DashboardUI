import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts

import utils 1.0
import "../../mainui"
import myControls
import "tabPages"

Item{
    id: root
    anchors.fill: parent

    property bool fullSize: true

    Page{
        id: productPage
        anchors.fill: parent

        header: TabBar {
            id: bar
            height: 45

            width: parent.width
            anchors.top: productPage.top
//            height: 40
            currentIndex: 0
            TabButton {
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                contentItem: Item {
                    anchors.fill: parent
                    Label{
                        text: qsTr("Entitys")
                        anchors.centerIn: parent
                        font.family: Style.fontFamilyBold
                        color: bar.currentIndex === 0 ? "#fff" : Style.mainColor
                    }
                }
                background: Rectangle {
                    color: bar.currentIndex === 0 ? Style.mainColor : Style.inactiveColor
                }
            }
            TabButton {
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                contentItem: Item {
                    anchors.fill: parent
                    Label{
                        text: qsTr("Entity Types")
                        anchors.centerIn: parent
                        color: bar.currentIndex === 1 ? "#fff" : Style.mainColor
                    }
                }
                background: Rectangle {
                    color: bar.currentIndex === 1 ? Style.mainColor : Style.inactiveColor
                }
            }
            TabButton {
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter

                contentItem: Item {
                    anchors.fill: parent
                    Label{
                        text: qsTr("Units")
                        anchors.centerIn: parent
                        color: bar.currentIndex === 2 ? "#fff" : Style.mainColor
                    }
                }
                background: Rectangle {
                    color: bar.currentIndex === 2 ? Style.mainColor : Style.inactiveColor
                }
            }

            background: Rectangle{
                anchors.fill: bar
                color:Style.inactiveColor
            }
        }

        background: Rectangle{
            anchors.fill: parent
            color:Style.bgColor
        }


        contentItem: StackLayout {
            width: parent.width
            height: parent.height - bar.height
            currentIndex: bar.currentIndex

            Item {
                id: homeTab
                anchors.fill: parent
                anchors.margins: 20

                Entities{

                }
            }
            Item {
                id: discoverTab
                anchors.fill: parent
                anchors.margins: 20

                Button{
                    anchors.centerIn: parent
                    text: "my button"
                }
            }
            Item {
                id: activityTab
            }
        }

    }
}
