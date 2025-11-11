

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

    property alias backButton: backButton
    property alias startButton: startButton
    property alias stopButton: stopButton
    property alias pauseButton: pauseButton
    property alias resetButton: resetButton
    property alias monitorRect: monitorRect
    property alias logArea: logArea

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
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenterOffset: 0
        }

        ButtonA {
            id: backButton
            x: 1360
            width: 127
            height: 59
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 25
            buttonText.text: "Back"
            anchors.verticalCenterOffset: 4
        }
    }

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
        spacing: 0

        Rectangle {
            id: rectangle
            width: 1000
            height: 200
            color: "#f4f4f4"
            border.color: "#ababab"
            border.width: 3
            Layout.fillWidth: false
            Layout.fillHeight: true

            Rectangle {
                id: rectangle3
                x: 0
                y: 0
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
                    text: qsTr("Monitor")
                    font.pixelSize: 36
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Semibold"
                    font.bold: false
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: monitorRect
                color: "#00ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle3.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 50
                anchors.rightMargin: 50
                anchors.topMargin: 50
                anchors.bottomMargin: 50

                ScrollView {
                    anchors.fill: parent
                    TextArea {
                        id: logArea
                        readOnly: true
                        wrapMode: Text.WrapAnywhere
                        textFormat: Text.PlainText
                        padding: 8
                        background: null
                        font.pointSize: 20
                    }
                }
            }
        }

        Rectangle {
            id: rectangle1
            width: 400
            height: 200
            color: "#f4f4f4"
            border.color: "#ababab"
            border.width: 3
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: rectangle4
                x: -1000
                y: 0
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
                    id: text2
                    width: 321
                    height: 47
                    color: "#000000"
                    text: qsTr("Control Panel")
                    font.pixelSize: 36
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Semibold"
                    font.bold: false
                    anchors.centerIn: parent
                }
            }

            ButtonC {
                id: startButton
                x: 49
                y: 294
                image.source: "qrc:/qt/qml/SimpleControl/resources/start.png"
            }

            ButtonC {
                id: pauseButton
                x: 196
                y: 294
                image.source: "qrc:/qt/qml/SimpleControl/resources/pause.png"
            }

            ButtonC {
                id: stopButton
                x: 343
                y: 294
                image.source: "qrc:/qt/qml/SimpleControl/resources/stop.png"
            }

            ButtonA {
                id: resetButton
                x: 49
                y: 150
                width: 414
                height: 120
                buttonText.text: qsTr("Reset")
            }
        }
    }
}
