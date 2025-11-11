#ifndef KUKAROBOTSTOPCOMMAND_H
#define KUKAROBOTSTOPCOMMAND_H

#include <QDebug>
#include "CommandBase.h"
#include "KukaRobot.h"

class KukaRobotStopCommand final : public CommandBase {
    Q_OBJECT

public:
    explicit KukaRobotStopCommand(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : CommandBase(device, parent) {
            setMethod("stop");
        }

    // Method
    Q_INVOKABLE bool execute() override {
        auto* robot = qobject_cast<KukaRobot*>(device());
        if (!robot) {
            qWarning() << "KukaRobotStopCommand: device null or wrong type";
            return false;
        }

        robot->stop();
        return true;
    }

protected:
    void updatePropertyFromUi(const QString &key, const QVariant &value) override {

    }
};

#endif // KUKAROBOTSTOPCOMMAND_H
