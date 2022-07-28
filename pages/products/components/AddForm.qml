import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import utils 1.0

ColumnLayout {

    property int rowTable


    GroupBox {
        id: gridBox
        title: "Grid layout"
        Layout.fillWidth: true
        Layout.minimumWidth: gridLayout.Layout.minimumWidth + 30

        GridLayout {
            id: gridLayout
            columns: 7
            rows: 8
            flow: GridLayout.TopToBottom
            anchors.fill: parent

            Item {
                Label{
                    text: "image"
                }

                Layout.rowSpan: 8
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
                Layout.minimumWidth: 100     // guesstimate, should be size of largest word
            }

            //2end col
            Label { text: "Number" }
            Label { text: "Name" }
            Label { text: "Forign Name" }
            Label { text: "Start Date" }
            Label { text: "رقم المخزون" }
            Label { text: "الكمية القصوى" }
            Label { text: "السعر" }
            Label { text: "ملاحظات" }

            //3th col
            InputField {
                id:number
                text:tableEntity.rows[rowTable].num
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: name
                text:tableEntity.rows[rowTable].name

                Layout.columnSpan: 5
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: forignNmae
//                text: tableEntity.rows[rowTable].forignNmae
                Layout.columnSpan: 5
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: startDate
//                text: tableEntity.rows[rowTable].startDate
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                placeholderText: "رقم المخزون"
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                placeholderText: "الكمية القصوى"
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                placeholderText: "السعر"
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            TextArea {
                id: notes
//                text: tableEntity.rows[rowTable].notes
                Layout.columnSpan: 5
                wrapMode: TextArea.Wrap
                Layout.fillHeight: true
                Layout.fillWidth: true
                height: 40
                verticalAlignment : Qt.AlignVCenter
                font.pointSize: 10
                background: Rectangle {
                    radius: 2
                    border.color: "#9c9c9c"
                    border.width: 1
                }

            }

            //4th col
            Label { text: "Id" }
            InputField {
                id: id
                text: tableEntity.rows[rowTable].id
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            Label {
                text: "End Date"
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
            Label {
                text: "الكمية المتوفرة"
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
            Label {
                text: "كمية الطلب"
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
            Label {
                text: "أقل كمية"
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter

            }

            //5th column
            Label { text: "Type" }
            InputField {
                id: endDate
//                text: tableEntity.rows[rowTable].endDate
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: avaQuantity
//                text: tableEntity.rows[rowTable].avaQuantity
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: reqQuantity
//                text: tableEntity.rows[rowTable].reqQuantity
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: lessQuantity
//                text: tableEntity.rows[rowTable].lessQuantity
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }
            InputField {
                id: type
                text: tableEntity.rows[rowTable].type
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
            }



        }
    }

    GroupBox{
        id: units
        title: "Units"
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true

        ColumnLayout{
            anchors.fill: parent
            spacing: 20
            clip: true

            Button {

                id: addUnitBtn
                text: "+ Add Unit"
                Layout.alignment: Qt.AlignHCenter

                onClicked: function(){
                    console.log(unitsTable.height)
                    console.log(units.height)

                    var newUnit = {
                        quantity: "",
                        unit: "",
                        level: "",
                        barcode: "",
                        defaultUnit: false,
                        deleteUnit: "/",
                    }
                    unitsTable.insertNewUnit(newUnit)
                }
            }
            TableTemplate {

                id: unitsTable
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter

                tableContent: TableModel {
                    id:unitData

                    TableModelColumn { display: "quantity" }
                    TableModelColumn { display: "unit" }
                    TableModelColumn { display: "level" }
                    TableModelColumn { display: "barcode" }
                    TableModelColumn { display: "defaultUnit" }
                    TableModelColumn { display: "deleteUnit" }

                    // Each row is one type of fruit that can be ordered


                    rows: [
                        {
                            quantity: "Quantity",
                            unit: "Unit",
                            level: "Level",
                            barcode: "Barcode",
                            defaultUnit: "Default",
                            deleteUnit: "/"
                        },
                        {
                            quantity: "It is long word",
                            unit: "It is long word",
                            level: "It is long word",
                            barcode: "It is long word",
                            defaultUnit: false,
                            deleteUnit: "/"
                        },
                        {
                            // Each property is one cell/column.
                            quantity: 1111,
                            unit: 1010,
                            level: "ZZZ",
                            barcode: "Barcode",
                            defaultUnit: false,
                            deleteUnit: "/"
                        },
                        {
                            // Each property is one cell/column.
                            quantity: 1111,
                            unit: 1010,
                            level: "XXX",
                            barcode: "Barcode",
                            defaultUnit: true,
                            deleteUnit: "/"
                        },
                        {
                            quantity: "It is long word",
                            unit: "It is long word",
                            level: "It is long word",
                            barcode: "It is long word",
                            defaultUnit: false,
                            deleteUnit: "/"
                        }
                    ]



                }
            }
        }
    }


    GroupBox {
        id: buttons
        title: "Button layout"
        Layout.fillWidth: true

            Button {
                anchors.centerIn: parent
                text: "Save"
            }
    }

}
