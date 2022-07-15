
import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels 1.0

import utils 1.0
import myControls as My
TableView {

    property alias tableContent :  tableView.model
//    property alias tableRow :  tableData.row
    property bool visibleEdit


    property int editBtn
    property int delBtn



    function insertNewRow(newRow, table){
        switch(table){
        case "entity":
            tableEntity.insertRow(1, newRow)
            break;
        case "unit":
            tableUnit.insertRow(1, newRow)
            break;

        }

    }

    id: tableView
    columnSpacing: 1
    rowSpacing: 1
    boundsBehavior: Flickable.StopAtBounds

    model: tableContent


    delegate: DelegateChooser {

        DelegateChoice {
            id: editId
            column: editBtn
            delegate: Button {
                implicitHeight: 30
                text: (row !== 0)? "" : "Edit";
                hoverEnabled: (row !== 0)? true : false;
                icon.name: "Edit"
                icon.source:(row !== 0)? Style.image("icons/edit"): "/";
                visible: visibleEdit

                onClicked: (row !== 0)? winld.active = true : "" ;
                Loader {
                    id: winld
                    active: false
                    sourceComponent: Window {
                        id: appWindow
                        title: "Basic layouts"
                        property int margin: 11
//                        flags: Qt.WindowStaysOnTopHint


                        Component.onCompleted: {
                            width = mainLayout.implicitWidth + 45 * margin
                            height = mainLayout.implicitHeight + 10 * margin
                        }


                        visible: visibleEdit
                        onClosing: winld.active = false

                        AddForm {
                            id: mainLayout
                            anchors.fill: parent
                            anchors.margins: appWindow.margin

                        }

                    }
                }


                background: Rectangle {
//                    color: "#000"
                    Image{
                        height: 28
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        source: Style.image("icons/edit")
                        visible: (row !== 0)? true : false;
                    }

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
            column: delBtn
            delegate: Button {
                implicitHeight: 30
                text: (row !== 0)? "" : "Delete";
                icon.name: "Delete"
                icon.source: (row !== 0)? Style.image("icons/delete") : "/";
                onClicked: (row !== 0)? tableContent.removeRow(row) : "" ;
                hoverEnabled: (row !== 0)? true : false;
                background: Rectangle {
                    color: "#000"

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
                text: model.display
                selectByMouse: true
                implicitWidth: 150
                implicitHeight: 40

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
}
