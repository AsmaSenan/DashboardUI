import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import Qt5Compat.GraphicalEffects

import utils 1.0

T.CheckBox {
    id: root

    implicitWidth: 120
    implicitHeight: 50

    background: Rectangle {
        id: checkRec
        width: parent.height
        height: width
        color: "transparent"
        border.color: Style.mainColor
    }

    indicator: Image {
        id: buttonImage
        width: (checkRec.width - 20)
        height: (checkRec.height - 20)
        anchors.centerIn: checkRec
        source: Style.image("icons/check")
        visible: root.checked
        ColorOverlay {
            anchors.fill: buttonImage
            source: buttonImage
            color: Style.mainColor
            visible: root.checked
        }
    }
    contentItem: Item{
        width: (parent.width - checkRec.width - 10)
        height: parent.height
        anchors.left: checkRec.right
        anchors.leftMargin: 10

        Label {
            text: root.text
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
