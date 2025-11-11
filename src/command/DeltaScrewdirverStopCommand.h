#ifndef DELTASCREWDRIVERSTOPCOMMAND_H
#define DELTASCREWDRIVERSTOPCOMMAND_H

#include <QDebug>
#include "CommandBase.h"
#include "DeltaScrewdriver.h"

class DeltaScrewdriverStopCommand final : public CommandBase {
    Q_OBJECT

public:
    explicit DeltaScrewdriverStopCommand(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : CommandBase(device, parent) {
        setMethod("stop");
    }

    // Setter
    Q_INVOKABLE void setId(int id) { m_id = id; }

    // Method
    Q_INVOKABLE bool execute() override {
        auto* screwDriver = qobject_cast<DeltaScrewdriver*>(device());
        if (!screwDriver) {
            qWarning() << "DeltaScrewdriverStopCommand: device null or wrong type";
            return false;
        }

        screwDriver->stop(m_id);
        return true;
    }

protected:
    void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "scriptId") {
            m_id = value.toInt();
        }
    }

private:
    int m_id;
};

#endif // DELTASCREWDRIVERSTOPCOMMAND_H
