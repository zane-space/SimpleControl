#ifndef DENSOROBOTMOVECOMMAND_H
#define DENSOROBOTMOVECOMMAND_H

#include <QDebug>
#include "CommandBase.h"
#include "DensoRobot.h"

class DensoRobotMoveCommand final : public CommandBase {
    Q_OBJECT

public:
    explicit DensoRobotMoveCommand(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : CommandBase(device, parent) {
            setMethod("move");
        }

    // Getter
    TypeHelper::Pose pose() { return m_pose; }

    // Setter
    Q_INVOKABLE void setPose(TypeHelper::Pose pose) { m_pose = pose; }

    // Method
    Q_INVOKABLE bool execute() override {
        auto* robot = qobject_cast<DensoRobot*>(device());
        if (!robot) {
            qWarning() << "DensoRobotMoveCommand: device null or wrong type";
            return false;
        }

        robot->move(m_pose);
        return true;
    }

protected:
    void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "x") {
            m_pose.x = value.toDouble();
        } else if (key == "y") {
            m_pose.y = value.toDouble();
        } else if (key == "z") {
            m_pose.z = value.toDouble();
        } else if (key == "rx") {
            m_pose.rx = value.toDouble();
        } else if (key == "ry") {
            m_pose.ry = value.toDouble();
        } else if (key == "rz") {
            m_pose.rz = value.toDouble();
        }
    }

private:
    TypeHelper::Pose m_pose {0,0,0,0,0,0};
};

#endif // DENSOROBOTMOVECOMMAND_H
