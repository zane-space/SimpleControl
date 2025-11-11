import QtQuick
import QtQuick.Controls

DeviceSelectingForm {
    id: root

    property string selectedDevice: ""
    property ButtonB selectedButton: null

    cancelButton.onClicked: popup.close()
    robotButton.onClicked: robotRow.visible = !robotRow.visible
    plcButton.onClicked: plcRow.visible = !plcRow.visible
    screwdriverButton.onClicked: screwdriverRow.visible = !screwdriverRow.visible

    confirmButton.onClicked: {

        if (!selectedButton) {
            console.log("Device is not chosen.")
            return
        }

        scriptManager.addDevice(selectedDevice)
        console.log("Device appended.")

        popup.close()
    }

    function select(button, deviceName) {
        if (selectedButton && selectedButton !== button) {
            selectedButton.selected = false
        }

        selectedDevice = deviceName
        selectedButton = button
        selectedButton.selected = true
    }

    Component.onCompleted: {
        densoButton.onClicked.connect(() => select(densoButton, "DensoRobot"))
        kukaButton.onClicked.connect(() => select(kukaButton, "KukaRobot"))
        simensButton.onClicked.connect(() => select(simensButton, "SimensPlc"))
        deltaButton.onClicked.connect(() => select(deltaButton, "DeltaScrewdriver"))
    }
}
