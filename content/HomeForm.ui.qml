

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle1
    width: 1512
    height: 982
    color: "#ffffff"
    radius: 10

    property alias operationsButton: operationsButton
    property alias scriptEditorButton: scriptEditorButton
    property alias aboutButton: aboutButton

    Text {
        text: qsTr("Simple Control")
        anchors.verticalCenterOffset: -256
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 48
        font.family: Constants.font.family
    }

    Image {
        id: image
        x: 509
        width: 62
        height: 68
        anchors.top: parent.top
        anchors.topMargin: 201
        source: "../resources/control.png"
        fillMode: Image.PreserveAspectFit
    }

    ButtonA {
        id: operationsButton
        x: 326
        y: 450
        buttonText.text: "Operations"
    }

    ButtonA {
        id: scriptEditorButton
        x: 628
        y: 450
        buttonText.text: "Script Editor"
    }

    ButtonA {
        id: aboutButton
        x: 934
        y: 450
        buttonText.text: "About"
    }
}
