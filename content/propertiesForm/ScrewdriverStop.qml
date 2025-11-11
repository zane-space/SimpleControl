import QtQuick
import Types 1.0

ScrewdriverStopForm {
    id: root
    property int row: -1
    property var command: null

    // Read from backend
    Component.onCompleted: {
        command = scriptManager.getCommand(row)
        if (!command) {
            console.warn("ScrewdriverStop: command is null for row", row)
            return
        }

        idField.propValue = command.uiProperty("id") ? command.uiProperty("id") : ""
    }

    // Write by user
    idField.onPropValueChanged: command.setUiProperty("id", idField.propValue)
}
