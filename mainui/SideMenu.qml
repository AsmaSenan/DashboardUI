import QtQuick 2.11

import utils 1.0


Item {
    id: root

    property string currentItemName: mainMenuList.currentItemName

    signal menuItemClicked(var name)

    Rectangle {
        id: mainMenuColorFill
        width: parent.width
        height: parent.height
        color: Style.mainColor
        SideMenuList {
            id: mainMenuList
            anchors.centerIn: parent
            onMenuItemClicked: {
                root.menuItemClicked(name);
            }
        }
    }
}
