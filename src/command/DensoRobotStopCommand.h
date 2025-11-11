#ifndef DENSOROBOTSTOPCOMMAND_H
#define DENSOROBOTSTOPCOMMAND_H

#include <QDebug>
#include "CommandBase.h"
#include "DensoRobot.h"

class DensoRobotStopCommand final : public CommandBase {
    Q_OBJECT

public:
    explicit DensoRobotStopCommand(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : CommandBase(device, parent) {
            setMethod("stop");
        }

    // Method
    Q_INVOKABLE bool execute() override {
        auto* robot = qobject_cast<DensoRobot*>(device());
        if (!robot) {
            qWarning() << "DensoRobotStopCommand: device null or wrong type";
            return false;
        }

        robot->stop();
        return true;
    }

protected:
    void updatePropertyFromUi(const QString &key, const QVariant &value) override {

    }
};

#endif // DENSOROBOTSTOPCOMMAND_H
