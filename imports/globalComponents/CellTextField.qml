import QtQuick 2.12
import QtQuick.Controls 2.5

import utils 1.0

Item {
    id:root
    implicitWidth: textField.contentWidth + 40
    implicitHeight: 40

    property var text

    TextField {
        id: textField
        text: parent.text
        selectByMouse: true
        anchors.fill: parent
        bottomPadding: 9
        onAccepted: parent.text = text
        horizontalAlignment: TextInput.AlignHCenter
//        verticalAlignment: AlignVCenter
        readOnly: (row !== 0)? false : true;
        font.family: Style.fontFamilyRegular
        color: "black"
        font.pixelSize: Style.fontSizeM

        background: Rectangle {
            CustomBorder{
                commonBorder: true
                commonBorderWidth: 1
                borderColor: "#9c9c9c"
            }
        }

    }
}
