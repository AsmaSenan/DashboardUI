import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import controls 1.0
import utils 1.0

T.Popup {
    id: root
    implicitWidth: 378
    implicitHeight: 366
    opacity: visible ? 1.0 : 0.0
    Behavior on opacity { NumberAnimation { duration: 100 }}

    closePolicy: Popup.NoAutoClose
    background: BaseCard { }
}
