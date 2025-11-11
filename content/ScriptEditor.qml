import QtQuick
import QtQuick.Controls
import Types 1.0

ScriptEditorForm {
    id: root
    backButton.onClicked: stackView.pop(null, StackView.Immediate)
    addButton.onClicked: popup.open()

    Popup {
        id: popup
        DeviceSelecting {
            id: deviceSelecting
        }
    }

    deviceRepeater.model: deviceListModel
    deviceRepeater.delegate: DeviceBlock {
        property var device: scriptManager.getDevice(index)
        name: deviceName
        anchors.horizontalCenter: parent.horizontalCenter
        imageSource: {
            deviceType === Type.Robot       ? "qrc:/qt/qml/SimpleControl/resources/robot.png" :
            deviceType === Type.Plc         ? "qrc:/qt/qml/SimpleControl/resources/conveyor.png" :
            deviceType === Type.Screwdriver ? "qrc:/qt/qml/SimpleControl/resources/screwdriver.png" :
                                              "qrc:/qt/qml/SimpleControl/resources/default.png"
        }

        Connections {
            target: device
            onUiPropertyChanged: {
                name = device.uiProperty("name")
            }
        }

        Drag.active: deviceBlockMouseArea.drag.active
        Drag.dragType: Drag.Automatic
        Drag.supportedActions: Qt.CopyAction
        Drag.mimeData: {
            "name": name,
        }
        Drag.hotSpot.x: width / 2
        Drag.hotSpot.y: height / 2

        MouseArea {
            id: deviceBlockMouseArea
            anchors.fill: parent

            onPressed: {
                if (deviceType === Type.Robot) {
                    propLoader.setSource(
                        "qrc:/qt/qml/SimpleControl/content/propertiesForm/Robot.qml", {
                            "row": index,
                        }
                    )
                }
                else if (deviceType === Type.Plc) {
                    propLoader.setSource(
                        "qrc:/qt/qml/SimpleControl/content/propertiesForm/Plc.qml", {
                            "row": index,
                        }
                    )
                }
                else if (deviceType === Type.Screwdriver) {
                    propLoader.setSource(
                        "qrc:/qt/qml/SimpleControl/content/propertiesForm/Screwdriver.qml", {
                            "row": index,
                        }
                    )
                }
                parent.Drag.active = true
            }
            onReleased: parent.Drag.active = false
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }

    DropArea {
        id: flowDropArea
        x: flowRect.x
        y: flowRect.y
        width: flowRect.width
        height: flowRect.height

        onDropped: (drop) => {
            scriptManager.addCommand(scriptManager.getDevice(drop.getDataAsString("name")))
       }
    }    

    flowRepeater.model: commandListModel
    flowRepeater.delegate: CommandBlock { 
        name: deviceName
        anchors.horizontalCenter: parent.horizontalCenter
        methodComboBox.model: candidateMethods
        methodComboBox.currentIndex: candidateMethods.indexOf(selectedMethod)
        methodComboBox.onActivated: (i) => {
            scriptManager.updateCommandMethod(index, scriptManager.getDevice(deviceName), methodComboBox.currentText)
        }

        MouseArea {
            id: commandBlockMouseArea
            anchors.fill: parent
            z: 0

            onClicked: {
                if (scriptManager.getDevice(name).type === Type.Robot) {
                    if (methodComboBox.currentText === "move") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/RobotMove.qml", {
                                "row": index,
                            }
                        )
                    } else if (methodComboBox.currentText === "stop") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/RobotStop.qml", {
                                "row": index,
                            }
                        )
                    }
                }
                else if (scriptManager.getDevice(name).type === Type.Plc) {
                    if (methodComboBox.currentText === "setDoOn") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/PlcSetDoOn.qml", {
                                "row": index,
                            }
                        )
                    } else if (methodComboBox.currentText === "setDoOff") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/PlcSetDoOff.qml", {
                                "row": index,
                            }
                        )
                    }
                }
                else if (scriptManager.getDevice(name).type === Type.Screwdriver) {
                    if (methodComboBox.currentText === "start") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/ScrewdriverStart.qml", {
                                "row": index,
                            }
                        )
                    } else if (methodComboBox.currentText === "stop") {
                        propLoader.setSource(
                            "qrc:/qt/qml/SimpleControl/content/propertiesForm/ScrewdriverStop.qml", {
                                "row": index,
                            }
                        )
                    }
                }
            }
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
