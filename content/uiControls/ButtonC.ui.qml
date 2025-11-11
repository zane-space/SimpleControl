import QtQuick

Rectangle {
    id: rectangle
    width: 120
    height: 120
    color: "#ecf7ff"
    radius: 10
    border.color: "#75b0ff"
    border.width: 3
    property alias image: image
    signal clicked

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

    Image {
        id: image
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
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
