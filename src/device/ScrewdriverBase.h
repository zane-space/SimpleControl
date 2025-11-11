#ifndef SCREWDRIVERBASE_H
#define SCREWDRIVERBASE_H

#include "DeviceBase.h"
#include "TypeHelper.h"

class ScrewdriverBase : public DeviceBase {


public:
    explicit ScrewdriverBase(const QString& name, QObject* parent = nullptr)
        : DeviceBase(name, TypeHelper::DeviceType::Screwdriver, parent) {}

    // Getter
    Q_INVOKABLE QString ip() { return m_ip; }

    // Setter
    Q_INVOKABLE void setIP(const QString& ip) { m_ip = ip; }

    // Methods
    virtual void start(int scriptId) = 0;
    virtual void stop(int scriptId) = 0;

private:
    QString m_ip = "";
};

#endif // SCREWDRIVERBASE_H
