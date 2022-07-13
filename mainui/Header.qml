import QtQuick 2.11
import QtQuick.Controls 2.4
import Qt5Compat.GraphicalEffects

import utils 1.0

Item {
    id: root

    property alias menuItemText: menuTextLabel.text
    property bool reorderSwitchVisible: false

    DropShadow {
        anchors.fill: backgroundColor
        verticalOffset: 3
        radius: 0.5
        color: "#80000000"
        source: backgroundColor
    }

    Rectangle {
        id: backgroundColor
        width: parent.width
        height: parent.height
        anchors.right: parent.right
        color: "#fff"
    }

    Label {
        id: menuTextLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 90
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20
        Switch {
            width: 130
            height: 26
            visible: (opacity > 0.0)
            opacity: root.reorderSwitchVisible ? 1.0 : 0.0
            Behavior on opacity { NumberAnimation { duration: 200 } }
            text: "Reorder"
            //TODO implement checked property
            onClicked: {
                //TODO enable reorder tiles mode
            }
        }
        ToolButton {
            id: settings
            width: 26
            height: 26
            icon.source: Style.image("header/settings")
            onClicked: {
                //TODO open dropDownMenu
            }
        }
        ToolButton {
            width: 26
            height: 26
            icon.source: Style.image("header/onoff")
            onClicked: {
                Qt.quit();
            }
        }
    }

    Control {
        id: dropDownMenu
        width: 228
        height: 127
        property bool open: false
        anchors.top: parent.top
        anchors.topMargin: ((height / 2) + 10)
        anchors.right: parent.right
        anchors.rightMargin: 45
        opacity: open ? 1.0 : 0.0
        visible: (opacity > 0.0)
        Behavior on opacity { NumberAnimation { duration: 200 } }

//        background: Image {
//            width: sourceSize.width
//            height: sourceSize.height
//            source: Style.image("header/dropdown")
//        }

        contentItem: Column {
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 30
            spacing: 8
            Label {
                text: "Select theme"
            }
            RadioButton {
                width: 100
                height: 26
                text: "Green"
                onClicked: {
                    //TODO set green theme
                }
            }
            RadioButton {
                width: 100
                height: 26
                text: "Orange"
                onClicked: {
                    //TODO set orange theme
                }
            }
        }
    }
}
