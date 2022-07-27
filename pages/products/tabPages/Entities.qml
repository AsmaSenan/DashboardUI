import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import utils 1.0
import "../../../mainui"
import myControls
import "../components"


Item {
    id: root
    anchors.fill: parent

//    clip: true

    ColumnLayout {
        id: colLayout
        anchors.fill: parent
        spacing: 20


        Label {
            id: txt1
            width: parent.width
            wrapMode: Label.Wrap
            font.pixelSize: Style.fontSizeL
            text: "Items"
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Qt.AlignHCenter
//            topPadding: 30
        }

        OperationsMenu{
            Layout.fillWidth: true
            Layout.fillHeight: true
            onNewData:     function(){
                var newRow={
                    id: "",
                    num: "",
                    name: "",
                    type: "",
                    amount: 0,
                    price: 0.0,
                    edit: "/",
                    del: "/",
                }
                mainTable.insertNewRow(newRow)
            }

        }



        EntitysTable {
            id: mainTable
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter

            tableContent: TableModel {
                id:tableEntity
                TableModelColumn { display: "id" }
                TableModelColumn { display: "num" }
                TableModelColumn { display: "name" }
                TableModelColumn { display: "type" }
                TableModelColumn { display: "amount" }
                TableModelColumn { display: "price" }
                TableModelColumn { display: "edit" }
                TableModelColumn { display: "del" }

                // Each row is one type of fruit that can be ordered
                rows: [
                    {
                        id: "ID",
                        num: "Number",
                        name: "Name",
                        type: "Type",
                        amount: "Amount",
                        price: "Price",
                        edit: "/",
                        del: "/"
                    },
                    {
                        // Each property is one cell/column.
                        id: 1111,
                        num: 1010,
                        name: "Item 1rrrrrrrrrrrrrrr ",
                        type: "A",
                        amount: 500,
                        price: 1.50,
                        edit: "/",
                        del: "/"

                    },
                    {
                        // Each property is one cell/column.
                        id: 1111,
                        num: 1010,
                        name: "BBB",
                        type: "Item type 2",
                        amount: 500,
                        price: 1.50,
                        edit: "/",
                        del: "/"

                    },
                    {
                        id: 2222,
                        num: 2020,
                        name: "It is loooong name",
                        type: "C",
                        amount: 1500,
                        price: 0.50,
                        edit: "/",
                        del: "/"

                    }
                ]

            }


            visibleEdit: true

            editBtn: 6
            delBtn: 7

        }

    }

}
