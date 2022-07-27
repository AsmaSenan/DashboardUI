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
        anchors.fill: parent

        header: TabBar {
            id: bar
            width: parent.width
            currentIndex: 0
            TabButton {
                text: qsTr("Entitys")
                height: parent.height
                background: Rectangle {
                    color: bar.currentIndex === 0 ? Style.mainColor : Style.inactiveColor
                }
            }
            TabButton {
                text: qsTr("Entity Types")
                height: parent.height

                background: Rectangle {
                    color: bar.currentIndex === 1 ? Style.mainColor : Style.inactiveColor
                }

            }
            TabButton {
                text: qsTr("Units")
                height: parent.height

                background: Rectangle {
                    color: bar.currentIndex === 2 ? Style.mainColor : Style.inactiveColor
                }
            }

            background: Rectangle{
                anchors.fill: parent
                color:Style.inactiveColor
            }
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
