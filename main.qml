import QtQuick 2.15
import QtQuick.Window 2.15
import utils 1.0
import "mainui"
import myControls
Window {
    id: root
    width: Style.screenWidth
    height: Style.screenHeight
    color: "black"
    visible: true

    //TODO make UI responsive
    //TODO implement second theme switching

    title: qsTr("QML Course")

    Item {
        anchors.fill: parent
        DashboardContent {
            id: dashboardAppContent
            anchors.fill: parent
        }

    }

}
