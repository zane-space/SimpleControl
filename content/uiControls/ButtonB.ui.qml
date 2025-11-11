import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle
    property bool selected: false

    width: 236
    height: 82
    color: rectangle.selected ? "#d2d2d2"
          : rectangle.hovered ? "#d4e5ff"
          : "#ecf7ff"
    radius: 10
    border.color: "#75b0ff"
    border.width: 3
    property alias buttonText: buttonText
    signal clicked

    Text {
        id: buttonText
        color: "#153392"
        text: qsTr("Text")
        anchors.fill: parent
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.styleName: "Semibold"
    }

    MouseArea {
        id: mouseArea
        x: 245
        y: -154
        anchors.fill: parent

        Connections {
            target: mouseArea
            function onClicked() {
                rectangle.clicked()
            }
        }
    }
}
