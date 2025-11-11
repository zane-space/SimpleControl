import QtQuick
import QtQuick.Controls

HomeForm {
    scriptEditorButton.onClicked: stackView.push("ScriptEditor.qml")
    operationsButton.onClicked: stackView.push("Operations.qml")
}
