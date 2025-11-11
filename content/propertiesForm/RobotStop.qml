import QtQuick
import Types 1.0

RobotStopForm {
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
    }
}
