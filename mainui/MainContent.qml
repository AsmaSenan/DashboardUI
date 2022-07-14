import QtQuick 2.11
import QtQuick.Controls 2.4
import myControls

import utils 1.0
import "../pages/dashboard" as Dashboard

Item {
    id: root
    state: "Dashboard"

    Rectangle {
        anchors.fill: parent
        color: Style.bgColor
    }

    Dashboard.Main {
        state: root.state
    }
}
