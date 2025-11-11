import QtQuick
import Types 1.0

PlcForm {
    id: root
    property int row: -1
    property var device: null

    // Read from backend
    Component.onCompleted: {
        device = scriptManager.getDevice(row)
        if (!device) {
            console.warn("Device is null for row", row)
            return
        }

        nameField.propValue = device.uiProperty("name") ? device.uiProperty("name") : ""
        ipField.propValue = device.uiProperty("ip") ? device.uiProperty("ip") : ""
    }

    // Write by user
    nameField.onPropValueChanged: device.setUiProperty("name", nameField.propValue)
    ipField.onPropValueChanged: device.setUiProperty("ip", ipField.propValue)
}
