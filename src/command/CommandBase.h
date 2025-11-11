#ifndef COMMANDBASE_H
#define COMMANDBASE_H

#include <QObject>
#include <QString>
#include <QVariantList>
#include <QVariantMap>
#include "DeviceBase.h"

class CommandBase : public QObject{
    Q_OBJECT

public:
    explicit CommandBase(DeviceBase* device = nullptr, QObject* parent = nullptr)
        : QObject(parent) {
            m_device = device;
        }

    // Getter
    DeviceBase* device() const { return m_device; }
    QString method() const { return m_method; }
    Q_INVOKABLE QVariant uiProperty(const QString &key) const {
        return m_uiProperties.value(key);
    }

    // Setter
    Q_INVOKABLE void setMethod(const QString& method) { m_method = method; }
    Q_INVOKABLE void setUiProperty(const QString &key, const QVariant &value) {
        if (m_uiProperties.value(key) == value)
            return;

        m_uiProperties[key] = value;
        updatePropertyFromUi(key, value);
        emit uiPropertyChanged();
    }

    // Method
    virtual Q_INVOKABLE bool execute() = 0;

signals:
    void uiPropertyChanged();

protected:
    virtual void updatePropertyFromUi(const QString &key, const QVariant &value) = 0;

private:
    DeviceBase* m_device;
    QString m_method;
    QVariantMap m_uiProperties;
};


#endif // COMMANDBASE_H
