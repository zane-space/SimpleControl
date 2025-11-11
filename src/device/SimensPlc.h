#ifndef SIMENSPLC_H
#define SIMENSPLC_H

#include <QString>
#include <QObject>
#include "PlcBase.h"


class SimensPlc : public PlcBase {
    Q_OBJECT

public:
    explicit SimensPlc(const QString& name, QObject* parent = nullptr)
        : PlcBase(name, parent) {}

    // DeviceBase Methods
    bool initialize() override {
        qInfo() << "SimensPlc" << name() << "initialized.";
        setInitialized(true);
        return true;
    };

    void shutdown() override {
        if (!initialize())
            return;

        qInfo() << "SimensPlc" << name() << "shut down.";
        setInitialized(false);
        return;
    }

    // Methods
    Q_INVOKABLE void setDoOn(int id) override {
        qInfo() << "Simens PLC (" << name() << ") :"
                << "Set digital output" << id << "On.";
    };

    Q_INVOKABLE void setDoOff(int id) override {
        qInfo() << "Simens PLC (" << name() << ") :"
                << "Set digital output" << id << "Off.";
    }

protected:
    virtual void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "name")
            setName(value.toString());
        else if (key == "ip")
            setIP(value.toString());
    }
};

#endif // SIMENSPLC_H
