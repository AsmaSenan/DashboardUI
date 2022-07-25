
import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels 1.0

import "../../../imports/globalComponents"

import utils 1.0
import myControls as My


TableView {

    property alias tableContent :  tableUnits.model
    property bool visibleEdit
    property int editBtn
    property int delBtn
    property int checkBtn

    function insertNewUnit(newRow){

        unitData.insertRow(1, newRow)

    }

    id: tableUnits

    columnSpacing: 1
    rowSpacing: 1
    boundsBehavior: Flickable.StopAtBounds
    implicitWidth: contentItem.childrenRect.width + 20
    implicitHeight: contentItem.childrenRect.height + 20

    model: tableContent

    delegate: DelegateChooser {

        DelegateChoice {
            column: delBtn
            delegate: Button {
                implicitWidth: 80
                implicitHeight: 40

                onClicked: (row !== 0)? tableContent.removeRow(row) : "" ;
                hoverEnabled: (row !== 0)? true : false;
                background: Rectangle {
                    //                    color: "#000"
                    Image{
                        height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        source: Style.image("icons/delete")
                        visible: (row !== 0)? true : false;
                    }
                    CustomBorder{
                        commonBorder: true
                        commonBorderWidth: 1
                        borderColor: "#9c9c9c"
                    }
                }
                contentItem: Item{
                    anchors.fill: parent
                    Label {
                        anchors.centerIn: parent
                        color: "#000"
                        text: (row !== 0)? "" : "Delete";
                    }
                }
            }
        }
        DelegateChoice {
            column: 4
            delegate:RadioBtn  {
                txt: (row !== 0)? "" : "Default";
                visibleRadio: (row !== 0)? true : false
                isCheck: (row !== 0)? model.display : false
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
            delegate: CellTextField {
                text: model.display
            }
        }

    }
}
