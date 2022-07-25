pragma Singleton
import QtQuick 2.11

QtObject {
    id: root

    //TODO add support for a second theme
    //TODO add support for responsive UI

    property int screenWidth: 1920
    property int screenHeight: 1080

    property string bgColor: "#e6ecf0"
    property string mainColor: "#2196F3"
    property string inactiveColor: "#c5c9c9"

    property string imgPath: "../../assets/"

    function image(name) {
        return Qt.resolvedUrl(imgPath + name + ".png");
    }
    function resize(value) {
        return (value * root.scaleFactor);
    }

    property string fontContrastColor: "#FFFFFF"
    property string fontBlackColor: "#000000"
    property string fontPrimaryColor: "#1d234f"
    property string fontSecondaryColor: "#56aeac"

    property int fontSizeS: 14
    property int fontSizeM: 18
    property int fontSizeL: 24

    property string fontFamilyRegular: quicksandBook.name
    property string fontFamilyBold: quicksandBold.name

    property FontLoader quicksandBook: FontLoader {
        source: "../../assets/fonts/Quicksand_Book.otf"
    }

    property FontLoader quicksandBold: FontLoader {
        source: "../../assets/fonts/Quicksand_Bold.otf"
    }
}
