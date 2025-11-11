import QtQuick
import Types 1.0

RobotMoveForm {
    id: root
    property int row: -1
    property var command: null

    // Read from backend
    Component.onCompleted: {
        command = scriptManager.getCommand(row)
        if (!command) {
            console.warn("RobotMove: command is null for row", row)
            return
        }

        xField.propValue = command.uiProperty("x") ? command.uiProperty("x") : ""
        yField.propValue = command.uiProperty("y") ? command.uiProperty("y") : ""
        zField.propValue = command.uiProperty("z") ? command.uiProperty("z") : ""
        rxField.propValue = command.uiProperty("rx") ? command.uiProperty("rx") : ""
        ryField.propValue = command.uiProperty("ry") ? command.uiProperty("ry") : ""
        rzField.propValue = command.uiProperty("rz") ? command.uiProperty("rz") : ""
    }

    // Write by user
    xField.onPropValueChanged: command.setUiProperty("x", xField.propValue)
    yField.onPropValueChanged: command.setUiProperty("y", yField.propValue)
    zField.onPropValueChanged: command.setUiProperty("z", zField.propValue)
    rxField.onPropValueChanged: command.setUiProperty("rx", rxField.propValue)
    ryField.onPropValueChanged: command.setUiProperty("ry", ryField.propValue)
    rzField.onPropValueChanged: command.setUiProperty("rz", rzField.propValue)
}
