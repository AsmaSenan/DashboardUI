
import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels 1.0


TableView {

    property alias tableContent :  tableUnits.model
    property bool visibleEdit
    property int editBtn
    property int delBtn
    property int checkBtn


    id: tableUnits
    columnSpacing: 1
    rowSpacing: 1
    boundsBehavior: Flickable.StopAtBounds

    model: tableContent
//    interactive: false

    delegate: DelegateChooser {

        DelegateChoice {
            column: delBtn
            delegate: Button {
                implicitWidth: 50
                implicitHeight: 30
                text: (row != 0)? "" : "Delete";
                icon.name: "Delete"
                icon.source: (row != 0)? "/images/icons/images/icons/delete.png" : "/";
                onClicked: (row != 0)? tableData.removeRow(row) : "" ;
                hoverEnabled: (row != 0)? true : false;
                background: Rectangle {
                    CustomBorder
                    {
                        commonBorder: true
                        commonBorderWidth: 1
                        borderColor: "#9c9c9c"
                    }


                }


            }
        }
        DelegateChoice {
            column: 4
            delegate:RadioBtn  {
                txt: (row != 0)? "" : "Default";
                visibleRadio: (row != 0)? true : false
                isCheck: (row != 0)? model.display : false
                implicitWidth: 50
                implicitHeight: 30

                background: Rectangle {

                    CustomBorder
                    {
                        commonBorder: true
                        commonBorderWidth: 1
                        borderColor: "#9c9c9c"
                    }
                }

            }
        }

        DelegateChoice {
            delegate: TextField {
                selectByMouse: true
                implicitWidth: 150
                implicitHeight: 30
                text: model.display
                onAccepted: model.display = text
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
                readOnly: (row != 0)? false : true;
                background: Rectangle {
                    CustomBorder
                    {
                        commonBorder: true
                        commonBorderWidth: 1
                        borderColor: "#9c9c9c"
                    }


                }

            }
        }

    }
    ScrollBar.vertical: ScrollBar { }

}
