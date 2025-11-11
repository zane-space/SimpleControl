import QtQuick
import QtQuick.Controls
import Types 1.0

OperationsForm {
    id: root
    backButton.onClicked: stackView.pop(null, StackView.Immediate)
    startButton.onClicked: scriptManager.startScript();
    pauseButton.onClicked: scriptManager.pauseScript();
    stopButton.onClicked: scriptManager.stopScript();
    resetButton.onClicked: {
        logArea.text = ``;
        scriptManager.stopScript();
    }

    function printToMonitor(msg) {
        const now = Qt.formatTime(new Date(), "hh:mm:ss");
        logArea.text += `[${now}] ${msg}\n`;
        // Qt.callLater(() => logArea.moveCursorSelectionEnd());
    }

    Connections {
        target: scriptManager
        function onCommandStarted(device, method) {
            root.printToMonitor(`Command Started: ${device.name} | ${method}`)
        }
    }

    Connections {
        target: scriptManager
        function onCommandFinished(device, ok, method) {
            root.printToMonitor(`Command finished: ${device.name} | ${method} | ${ok ? "Successed" : "Failed"}`)
        }
    }

    Connections {
        target: scriptManager
        function onCommandInterrupted() {
            root.printToMonitor(`Command has been interrupted.`)
        }
    }
}
