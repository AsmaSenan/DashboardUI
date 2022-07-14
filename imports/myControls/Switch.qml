import QtQuick 2.11
import QtQuick.Templates 2.4 as T

import utils 1.0

T.Switch {
    id: root

    implicitWidth: 170
    implicitHeight: 30

    background: Rectangle {
        id: background
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        border.color: Style.inactiveColor
        radius: width / 3
    }

    indicator: Rectangle {
        id: indicator
        width: background.width / 2
        height: parent.height
        color: Style.mainColor
        radius: width / 2
        x: root.checked ? (background.width - width) : 0
        Behavior on x {
            NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 200 }
        }
    }

    contentItem: Item {
        width: (parent.width - background.width - 10)
        height: parent.height
        anchors.left: background.right
        anchors.leftMargin: 10
        Label {
            anchors.verticalCenter: parent.verticalCenter
            color: Style.inactiveColor
            text: root.text
        }
    }
}
