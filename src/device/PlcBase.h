#ifndef PLCBASE_H
#define PLCBASE_H

#include "DeviceBase.h"
#include "TypeHelper.h"

class PlcBase : public DeviceBase {
public:
    explicit PlcBase(const QString& name, QObject* parent = nullptr)
        : DeviceBase(name, TypeHelper::DeviceType::Plc, parent) {}

    // Getter
    Q_INVOKABLE QString ip() { return m_ip; }

    // Setter
    Q_INVOKABLE void setIP(const QString& ip) { m_ip = ip; }

    // Methods
    virtual void setDoOn(int id) = 0;
    virtual void setDoOff(int id) = 0;

private:
    QString m_ip = "";
};

#endif // PLCBASE_H
