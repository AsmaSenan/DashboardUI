import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtGraphicalEffects 1.0

import utils 1.0

T.Button {
    id: root
    implicitWidth: 120
    implicitHeight: 40

    background: Item {
        anchors.fill: parent
        DropShadow {
            anchors.fill: backgroundFill
            verticalOffset: 3
            radius: 8
            samples: 17
            color: "#80000000"
            source: backgroundFill
        }
        Rectangle {
            id: backgroundFill
            anchors.fill: parent
            radius: 30
            color: (root.pressed || !enabled) ? Style.inactiveColor : Style.mainColor
        }
    }

    contentItem: Item {
        anchors.fill: parent
        Label {
            anchors.centerIn: parent
            color: Style.fontContrastColor
            text: root.text
        }
    }
}
