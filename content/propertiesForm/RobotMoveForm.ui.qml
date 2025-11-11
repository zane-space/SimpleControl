

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 400
    height: 600

    property alias xField: xField
    property alias yField: yField
    property alias zField: zField
    property alias rxField: rxField
    property alias ryField: ryField
    property alias rzField: rzField

    Column {
        id: column
        anchors.fill: parent

        PropertyItem {
            id: xField
            width: 400
            propName: "X (mm)"
            propDefault: "0.0"
        }

        PropertyItem {
            id: yField
            width: 400
            propName: "Y (mm)"
            propDefault: "0.0"
        }

        PropertyItem {
            id: zField
            width: 400
            propName: "Z (mm)"
            propDefault: "0.0"
        }

        PropertyItem {
            id: rxField
            width: 400
            propName: "RX (degree)"
            propDefault: "0.0"
        }

        PropertyItem {
            id: ryField
            propName: "RY (degree)"
            width: 400
            propDefault: "0.0"
        }

        PropertyItem {
            id: rzField
            width: 400
            propName: "RZ (degree)"
            propDefault: "0.0"
        }
    }
}
