#ifndef SIMENSPLCSETDOONCOMMAND_H
#define SIMENSPLCSETDOONCOMMAND_H

#include <QDebug>
#include "CommandBase.h"
#include "SimensPlc.h"

class SimensPlcSetDoOnCommand final : public CommandBase {
    Q_OBJECT

public:
    explicit SimensPlcSetDoOnCommand(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : CommandBase(device, parent) {
            setMethod("setDoOn");
        }

    // Setter
    Q_INVOKABLE void setId(int id) { m_id = id; }

    // Method
    Q_INVOKABLE bool execute() override {
        auto* plc = qobject_cast<SimensPlc*>(device());
        if (!plc) {
            qWarning() << "SimensPlcSetDoOnCommand: device null or wrong type";
            return false;
        }

        plc->setDoOn(m_id);
        return true;
    }

protected:
    void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "id") {
            m_id = value.toInt();
        }
    }

private:
    int m_id;
};

#endif // SIMENSPLCSETDOONCOMMAND_H
