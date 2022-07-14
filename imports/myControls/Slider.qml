import QtQuick 2.11
import QtQuick.Templates 2.4 as T

import utils 1.0

T.Slider {
    id: root

    implicitWidth: 170
    implicitHeight: 20

    background: Rectangle {
        width: parent.width
        height: (parent.height / 4)
        anchors.verticalCenter: parent.verticalCenter
        radius: 20
        color: Style.inactiveColor
        Rectangle {
            width: (root.value * parent.width)
            height: parent.height
            color: Style.mainColor
            radius: 20
        }
    }

    handle: Rectangle {
        property int calcDim: (root.height < 10) ? root.height : (root.height / 2)
        width: calcDim
        height: calcDim
        anchors.verticalCenter: parent.verticalCenter
        x: (root.value * (root.width - calcDim))
        radius: (width / 2)
        color: Style.mainColor
    }
}
