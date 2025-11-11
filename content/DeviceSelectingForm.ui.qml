

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    width: 450
    height: 600

    property alias robotRow: robotRow
    property alias plcRow: plcRow
    property alias screwdriverRow: screwdriverRow

    property alias cancelButton: cancelButton
    property alias confirmButton: confirmButton
    property alias robotButton: robotButton
    property alias densoButton: densoButton
    property alias kukaButton: kukaButton
    property alias plcButton: plcButton
    property alias simensButton: simensButton
    property alias screwdriverButton: screwdriverButton
    property alias deltaButton: deltaButton

    ButtonA {
        id: cancelButton
        x: 303
        y: 523
        width: 115
        height: 40
        buttonText.text: "Cancel"
    }

    ButtonA {
        id: confirmButton
        x: 175
        y: 523
        width: 116
        height: 40
        color: "#ffffff"
        buttonText.text: "Confirm"
    }

    Text {
        id: text1
        y: 30
        width: 112
        height: 48
        text: qsTr("Device")
        font.pixelSize: 36
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
    }

    Rectangle {
        id: menuRect
        width: 387
        height: 393
        color: "#efefef"
        anchors.centerIn: parent

        Column {
            id: column
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            spacing: 15

            ButtonA {
                id: robotButton
                height: 50
                width: parent.width
                color: "#8bceff"
                border.color: "#006dff"
                buttonText.color: "#00165d"
                buttonText.text: "       Robot"

                Image {
                    id: image
                    x: 97
                    y: 6
                    width: 36
                    height: 38
                    source: "qrc:/qt/qml/SimpleControl/resources/robot.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Row {
                id: robotRow
                height: 50
                spacing: 10
                visible: false

                ButtonB {
                    id: densoButton
                    width: 111
                    height: parent.height
                    buttonText.text: "Denso"
                }

                ButtonB {
                    id: kukaButton
                    width: 113
                    height: parent.height
                    buttonText.text: "Kuka"
                }
            }

            ButtonA {
                id: plcButton
                height: 50
                width: parent.width
                color: "#8bceff"
                border.color: "#006dff"
                Image {
                    id: image1
                    x: 97
                    y: 7
                    width: 36
                    height: 38
                    source: "qrc:/qt/qml/SimpleControl/resources/conveyor.png"
                    fillMode: Image.PreserveAspectFit
                }
                buttonText.text: "       PLC"
                buttonText.color: "#00165d"
            }

            Row {
                id: plcRow
                height: 50
                spacing: 10
                visible: false

                ButtonB {
                    id: simensButton
                    width: 150
                    height:  parent.height
                    buttonText.text: "Simens"
                }
            }

            ButtonA {
                id: screwdriverButton
                height: 50
                width: parent.width
                color: "#8bceff"
                border.color: "#006dff"
                Image {
                    id: image2
                    x: 69
                    y: 6
                    width: 36
                    height: 38
                    source: "qrc:/qt/qml/SimpleControl/resources/screwdriver.png"
                    fillMode: Image.PreserveAspectFit
                }
                buttonText.text: "          Screw Driver"
                buttonText.color: "#00165d"
            }

            Row {
                id: screwdriverRow
                height: 50
                spacing: 10
                visible: false

                ButtonB {
                    id: deltaButton
                    width: 111
                    height: parent.height
                    buttonText.text: "Delta"
                }
            }
        }
    }
}
