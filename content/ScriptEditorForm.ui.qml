

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
    width: 1512
    height: 982
    color: "#ffffff"

    property alias addButton: addButton
    property alias saveButton: saveButton
    property alias backButton: backButton
    property alias flowRect: flowRect
    property alias deviceRepeater: deviceRepeater
    property alias flowRepeater: flowRepeater
    property alias propLoader: propLoader

    RowLayout {
        id: rowLayout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: barRect.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        uniformCellSizes: false
        spacing: 0

        Rectangle {
            id: toolboxRect
            width: 400
            height: 600
            color: "#f4f4f4"
            border.color: "#ababab"
            border.width: 3
            Layout.preferredWidth: -1
            Layout.fillHeight: true
            Layout.fillWidth: false

            Rectangle {
                id: rectangle3
                height: 100
                color: "#e0e0e0"
                border.color: "#ababab"
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text1
                    width: 144
                    height: 47
                    color: "#000000"
                    text: qsTr("Tool Box")
                    font.pixelSize: 36
                    anchors.centerIn: parent
                    font.styleName: "Semibold"
                    font.bold: false
                }
            }

            Column {
                id: column
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: addButton.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 25
                anchors.rightMargin: 25
                anchors.topMargin: 15
                anchors.bottomMargin: 15
                spacing: 5

                Repeater {
                    id: deviceRepeater
                }
            }

            ButtonA {
                id: addButton
                x: 305
                width: 80
                height: 53
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 15
                anchors.topMargin: 106
                buttonText.text: qsTr("Add")
                anchors.verticalCenterOffset: -317
            }
        }

        Rectangle {
            id: flowRect
            width: 400
            height: 600
            color: toolboxRect.color
            border.color: toolboxRect.border.color
            border.width: 3
            Layout.preferredWidth: -1
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id: rectangle4
                x: -400
                y: 0
                height: 100
                color: rectangle3.color
                border.color: "#a6a89d"
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                Text {
                    id: text2
                    width: 77
                    height: 47
                    text: qsTr("Flow")
                    font.pixelSize: 36
                    font.styleName: "Semibold"
                    font.bold: false
                    anchors.centerIn: parent
                }
            }

            Column {
                id: column1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle4.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.topMargin: 74
                anchors.bottomMargin: 15
                spacing: 4

                Repeater {
                    id: flowRepeater

                }
            }
        }

        Rectangle {
            id: propRect
            width: 400
            height: 600
            color: toolboxRect.color
            border.color: toolboxRect.border.color
            border.width: 3
            Layout.preferredWidth: -1
            Layout.fillWidth: false
            Layout.fillHeight: true

            Rectangle {
                id: rectangle5
                x: -400
                y: 0
                height: 100
                color: rectangle3.color
                border.color: rectangle3.border.color
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                Text {
                    id: text3
                    width: 169
                    height: 47
                    text: qsTr("Properties")
                    font.pixelSize: 36
                    font.styleName: "Semibold"
                    font.bold: false
                    anchors.centerIn: parent
                }
            }

            Loader {
                id: propLoader
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.topMargin: 15
                anchors.bottomMargin: 15
            }
        }
    }

    Rectangle {
        id: barRect
        x: 0
        y: 0
        width: 1512
        height: 83
        color: "#ffffff"
        border.color: "#225ca9"
        border.width: 0

        Image {
            id: image
            width: 75
            height: 66
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 19
            source: "../resources/control.png"
            anchors.verticalCenterOffset: 0
            fillMode: Image.PreserveAspectFit
        }

        ButtonA {
            id: backButton
            x: 1360
            width: 127
            height: 59
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.verticalCenterOffset: 4
            buttonText.text: "Back"
        }

        ButtonA {
            id: saveButton
            x: 1360
            width: 127
            height: 59
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: backButton.left
            anchors.rightMargin: 25
            anchors.verticalCenterOffset: 4
            buttonText.text: "Save"
        }
    }
}
