#ifndef DENSOROBOT_H
#define DENSOROBOT_H

#include <QString>
#include <QObject>
#include "RobotBase.h"

class DensoRobot final: public RobotBase {
    Q_OBJECT

public:
    explicit DensoRobot(const QString& name, QObject* parent = nullptr)
        : RobotBase(name, TypeHelper::BrandType::Denso, parent) {
            initialize();
        }

    // DeviceBase Methods
    bool initialize() override {
        qInfo() << "DensoRobot" << name() << "initialized.";
        setInitialized(true);
        return true;
    };

    void shutdown() override {
        if (!initialize())
            return;

        qInfo() << "DensoRobot" << name() << "shut down.";
        setInitialized(false);
        return;
    }

    // RobotBase Methods
    Q_INVOKABLE void move(TypeHelper::Pose pose) override {
        qInfo() << "Denso Robot (" << name() << ") :"
                << "Move to pose ("
                << pose.x << ", " << pose.y << ", " << pose.z << ", "
                << pose.rx << ", " << pose.ry << ", " << pose.rz << ")";
    }

    Q_INVOKABLE void stop() override {
        qInfo() << "Denso Robot (" << name() << ") :"
                << "Stop.";
    };

protected:
    virtual void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "name")
            setName(value.toString());
        else if (key == "ip")
            setIP(value.toString());
        else if (key == "speed")
            setSpeed(value.toDouble());
    }

};

#endif // DENSOROBOT_H
