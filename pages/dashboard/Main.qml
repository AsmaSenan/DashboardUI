import QtQuick 2.11
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.3
import utils 1.0
import myControls

import "../products" as Products

Item {
    id: root
    anchors.fill: parent
//    anchors.margins: 20

    objectName: "Dashboard"

    //TODO implement all apps in full size and tile mode
    //TODO implememt re-order items and persist positions



    GridLayout{
        columns: 3
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
//        columnSpacing: 30
        anchors.margins: 20


        Button{
            text: "Save"
        }
        RadioButton{
            text: "Agree"
        }
        CheckBox{
            text: "Send me a message"
        }
        Label{
            text: "It is label"
        }
        BusyIndicator{

        }
        Slider{

        }
        Switch{

        }
        ToolButton{
            text: "ToolBar"
        }
    }







    Products.Main {
        opacity: (root.state === "Products") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: opacity > 0.0
        fullSize: (root.state === "Products")
    }

//    Calendar.Main {
//        opacity: (root.state === "Calendar") ? 1.0 : 0.0
//        Behavior on opacity { NumberAnimation { duration: 250 } }
//        visible: (opacity > 0.0)
//        fullSize: (root.state === "Calendar")
//    }
//    Courses.Main {
//        opacity: (root.state === "Courses") ? 1.0 : 0.0
//        Behavior on opacity { NumberAnimation { duration: 250 } }
//        visible: (opacity > 0.0)
//        fullSize: (root.state === "Courses")
//    }
//    LatestNews.Main {
//        opacity: (root.state === "Latest News") ? 1.0 : 0.0
//        Behavior on opacity { NumberAnimation { duration: 250 } }
//        visible: (opacity > 0.0)
//        fullSize: (root.state === "Latest News")
//    }
//    WebRadio.Main {
//        opacity: (root.state === "Web Radio") ? 1.0 : 0.0
//        Behavior on opacity { NumberAnimation { duration: 250 } }
//        visible: (opacity > 0.0)
//        fullSize: (root.state === "Web Radio")
//    }
}
