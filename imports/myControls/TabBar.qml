import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

import utils 1.0

T.TabBar {
    id: root
    implicitWidth: parent.width
    implicitHeight: 40

    currentIndex: 0
    TabButton {
        text: qsTr("Home")
    }
    TabButton {
        text: qsTr("Discover")
    }
    TabButton {
        text: qsTr("Activity")

    }


    background: Rectangle {
        color: "#eeeeee"
    }


}
