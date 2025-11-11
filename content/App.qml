import QtQuick
import QtQuick.Controls

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "SmartControl"

    Home {
        id: mainScreen
    }

    StackView {
        id: stackView
        initialItem: mainScreen
    }

}

