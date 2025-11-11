import QtQuick
import QtQuick.Controls

Item {
    id: item1
    width: 274
    height: 42
    property alias propName: name.text
    property alias propDefault: value.placeholderText
    property alias propValue: value.text

    Text {
        id: name
        height: 41
        text: "Text"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: value.left
        anchors.leftMargin: 0
        anchors.rightMargin: 10
        font.pixelSize: 24
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    TextField {
        id: value
        x: 90
        width: 174
        height: 41
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        horizontalAlignment: Text.AlignLeft
        hoverEnabled: false
        font.pointSize: 24
        placeholderText: qsTr("Text Field")
    }
}
