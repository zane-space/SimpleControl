#ifndef DELTASCREWDRIVER_H
#define DELTASCREWDRIVER_H

#include <QString>
#include <QObject>
#include "ScrewdriverBase.h"

class DeltaScrewdriver : public ScrewdriverBase {
    Q_OBJECT

public:
    explicit DeltaScrewdriver(const QString& name, QObject* parent = nullptr)
        : ScrewdriverBase(name, parent) {}

    // DeviceBase Methods
    bool initialize() override {
        qInfo() << "DeltaScrewdriver" << name() << "initialized.";
        setInitialized(true);
        return true;
    };

    void shutdown() override {
        if (!initialize())
            return;

        qInfo() << "DeltaScrewdriver" << name() << "shut down.";
        setInitialized(false);
        return;
    }

    // Methods
    Q_INVOKABLE void start(int scriptId) override {
        qInfo() << "Delta screw driver (" << name() << ") :"
                << "Start script" << scriptId << ".";
    };

    Q_INVOKABLE void stop(int scriptId) override {
        qInfo() << "Delta screw driver (" << name() << ") :"
                << "Stop script" << scriptId << ".";
    };

protected:
    virtual void updatePropertyFromUi(const QString &key, const QVariant &value) override {
        if (key == "name")
            setName(value.toString());
        else if (key == "ip")
            setIP(value.toString());
    }
};


#endif // DELTASCREWDRIVER_H
