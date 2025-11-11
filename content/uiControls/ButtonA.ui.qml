import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle
    width: 236
    height: 82
    color: "#ecf7ff"
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
    states: [
        State {
            name: "Pressed"
            when: mouseArea.pressed

            PropertyChanges {
                target: rectangle
                color: "#bdd6ff"
                border.color: "#75b0ff"
            }
        },
        State {
            name: "Hover"
            when: mouseArea.containsMouse

            PropertyChanges {
                target: rectangle
                color: "#d4e5ff"
            }

            PropertyChanges {
                target: mouseArea
                hoverEnabled: true
            }
        }
    ]
}
