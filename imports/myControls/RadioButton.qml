import QtQuick 2.11
import QtQuick.Templates 2.4 as T

import utils 1.0

T.RadioButton {
    id: root

    implicitWidth: 120
    implicitHeight: 50

    property string checkedColor: Style.mainColor

    background: Rectangle {
        id: fillRect
        width: parent.height
        height: width
        radius: width / 2
        color: "transparent"
        border.color:  Style.mainColor
    }
    indicator:  Rectangle {
        width: (fillRect.width - 10)
        height: width
        anchors.centerIn: fillRect
        radius: width / 2
        visible: root.checked
        color: Style.mainColor
    }
    contentItem:  Item{
        width: (parent.width - fillRect.width - 10)
        height: parent.height
        anchors.left: fillRect.right
        anchors.leftMargin: 10

        Label {
            text: root.text
            anchors.verticalCenter: parent.verticalCenter
        }

    }
}
