
import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

RowLayout{
    id:operationLayout
    signal newData()


    Item{
        width: 20
    }

    TextField {
        Layout.fillWidth: true
        implicitHeight: 40
        verticalAlignment : TextInput.AlignVCenter
        font.pointSize: 12
        placeholderText: "Search"

    }
    Label{
        text: "in"
        font.pointSize: 12
        Layout.leftMargin: 8
        Layout.rightMargin: 8
    }

    ComboBox {
        implicitHeight: 40
        implicitWidth: 100
        editable: true
        model: ListModel {
            id: model
            ListElement { text: "All fields" }
            ListElement { text: "Number" }
            ListElement { text: "Name" }
            ListElement { text: "Foreign Name" }
        }
        onAccepted: {
            if (find(editText) === -1)
                model.append({text: editText})
        }
    }

    ButtonStyle {
        txt: "Search"
        txtColor: "black"

    }


    ButtonStyle {

        id: addRowBtn
        txt: "Add Item"
        btnColor: "#309afc"
        txtColor: hovered? "blak": "white"
        onClicked: operationLayout.newData()

    }
    Item{
        width: 20
    }
}
