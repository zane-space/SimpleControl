#ifndef ROBOTBASE_H
#define ROBOTBASE_H

#include "DeviceBase.h"
#include "TypeHelper.h"

class RobotBase : public DeviceBase {
public:
    explicit RobotBase(const QString& name, TypeHelper::BrandType brand, QObject* parent = nullptr)
        : DeviceBase(name, TypeHelper::DeviceType::Robot, parent) {
            m_brand = brand;
        }

    // Getter
    TypeHelper::BrandType brand() { return m_brand; }
    Q_INVOKABLE QString ip() { return m_ip; }
    Q_INVOKABLE double speed() { return m_speed; }

    // Setter
    Q_INVOKABLE void setIP(const QString& ip) { m_ip = ip; }
    Q_INVOKABLE void setSpeed(double speed) { m_speed = speed; }

    // Methods
    virtual void move(TypeHelper::Pose pose) = 0;
    virtual void stop() = 0;

private:
    QString m_ip = "";
    double m_speed = 0.0;
    TypeHelper::BrandType m_brand;
};

#endif // ROBOTBASE_H
