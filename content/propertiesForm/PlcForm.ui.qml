

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
    width: 400
    height: 600
    color: "#00ffffff"

    property alias nameField: nameField
    property alias ipField: ipField

    Column {
        id: column
        anchors.fill: parent

        PropertyItem {
            id: nameField
            width: 400
            propName: "Name"
            propDefault: "My Device"
        }

        PropertyItem {
            id: ipField
            width: 400
            propName: "IP"
            propDefault: "128.0.0.1"
        }
    }
}
