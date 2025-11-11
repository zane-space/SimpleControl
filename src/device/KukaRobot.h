#ifndef KUKAROBOT_H
#define KUKAROBOT_H

#include <QString>
#include <QObject>
#include "RobotBase.h"

class KukaRobot final: public RobotBase {
    Q_OBJECT

public:
    explicit KukaRobot(const QString& name, QObject* parent = nullptr)
        : RobotBase(name, TypeHelper::BrandType::Kuka, parent) {
        initialize();
    }

    // DeviceBase Methods
    bool initialize() override {
        qInfo() << "KukaRobot" << name() << "initialized.";
        setInitialized(true);
        return true;
    };

    void shutdown() override {
        if (!initialize())
            return;

        qInfo() << "KukaRobot" << name() << "shut down.";
        setInitialized(false);
        return;
    }

    // RobotBase Methods
    Q_INVOKABLE void move(TypeHelper::Pose pose) override {
        qInfo() << "Kuka (" << name() << ") :"
                << "Move to pose ("
                << pose.x << ", " << pose.y << ", " << pose.z << ", "
                << pose.rx << ", " << pose.ry << ", " << pose.rz << ")";
    }

    Q_INVOKABLE void stop() override {
        qInfo() << "Kuka Robot (" << name() << ") :"
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

#endif // KUKAROBOT_H
