import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import Qt5Compat.GraphicalEffects

import utils 1.0

T.ToolButton {
    id: root

    implicitWidth: 140
    implicitHeight: 40

    property bool colorize: true

    background: Item {
        id: background
        anchors.fill: parent
        Image {
            id: iconImg
            width: sourceSize.width
            height: sourceSize.height
            anchors.verticalCenter: parent.verticalCenter
            source: icon.source
            ColorOverlay {
                anchors.fill: parent
                visible: root.colorize
                source: parent
                color: Style.mainColor
            }
        }
    }

    contentItem: Item {
        width: (parent.width - iconImg.width)
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: (iconImg.width > 0) ? (iconImg.width + 10) : 0
        Label {
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            text: root.text
            color: root.pressed ? Style.mainColor : Style.inactiveColor
        }
    }
}
