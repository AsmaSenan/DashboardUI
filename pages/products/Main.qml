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
            TabButton {
                text: qsTr("Entity")
            }
            TabButton {
                text: qsTr("Entity Type")
            }
            TabButton {
                text: qsTr("Units")
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
            }
            Item {
                id: activityTab
            }
        }
    }
}
