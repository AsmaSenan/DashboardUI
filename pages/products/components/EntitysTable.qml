
import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels 1.0

import "../../../imports/globalComponents"

import utils 1.0
import myControls as My
TableView {

    property alias tableContent :  tableView.model
    property bool visibleEdit

    property int editBtn
    property int delBtn



    function insertNewRow(newRow){
            tableEntity.insertRow(1, newRow)
    }

    id: tableView


    columnSpacing: 1
    rowSpacing: 1
    boundsBehavior: Flickable.StopAtBounds
    implicitWidth: contentItem.childrenRect.width + 20

    model: tableContent


    delegate: DelegateChooser {

        DelegateChoice {
            id: editId
            column: editBtn
            delegate: My.Button {
                implicitWidth: 80
                implicitHeight: 40

                hoverEnabled: (row !== 0)? true : false;
                visible: visibleEdit

                onClicked:(row !== 0)? winld.active = true : "" ;


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
                            rowTable: row

                        }

                    }
                }


                background: Rectangle {
                    //                    color: "#000"
                    Image{
                        height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        source: Style.image("icons/edit")
                        visible: (row !== 0)? true : false;
                    }
                    CustomBorder {
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
                        text: (row !== 0)? "" : "Edit";
                    }
                }
            }
        }

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
            delegate: CellTextField {
                text: model.display
            }
        }
    }

}
