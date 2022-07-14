import QtQuick 2.11
import QtQuick.Templates 2.4 as T

import utils 1.0

T.RadioButton {
    id: root

    implicitWidth: 120
    implicitHeight: 50

    property string checkedColor: Style.mainColor

    indicator: Rectangle {
        id: indicatorRect
        width: root.height
        height: root.height
        radius: (width / 2)
        color: root.checked ? root.checkedColor : Style.inactiveColor
    }

    contentItem: Item {
        width: (parent.width - indicatorRect.width - 10)
        height: parent.height
        anchors.left: indicatorRect.right
        anchors.leftMargin: 10
        Label {
            anchors.verticalCenter: parent.verticalCenter
            color: root.checked ? root.checkedColor : Style.inactiveColor
            text: root.text
        }
    }
}
