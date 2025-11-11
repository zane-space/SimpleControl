

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 350
    height: 100
    color: "#71e8fc"
    radius: 20
    border.color: "#264d72"
    border.width: 3

    property alias name: nameText.text
    property var methods: []
    property alias methodComboBox: methodComboBox

    Text {
        id: nameText
        width: 73
        height: 40
        text: qsTr("Name")
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        font.family: "Tahoma"
        font.bold: true
    }

    ComboBox {
        id: methodComboBox
        width: 183
        height: 36
        z: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: nameText.right
        anchors.leftMargin: 30
        font.family: "Arial"
        font.pointSize: 24
        // model: root.methods
    }
}
