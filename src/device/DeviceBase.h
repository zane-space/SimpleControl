#ifndef DEVICEBASE_H
#define DEVICEBASE_H

#include <QObject>
#include <QString>
#include "TypeHelper.h"

class DeviceBase : public QObject {
    Q_OBJECT
    Q_PROPERTY(TypeHelper::DeviceType type READ type CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)

public:
    explicit DeviceBase(const QString& name, TypeHelper::DeviceType type, QObject* parent = nullptr)
        : QObject(parent) {
            m_name = name;
            m_type = type;
        }

    // Getter
    Q_INVOKABLE QString name() { return m_name; }
    Q_INVOKABLE TypeHelper::DeviceType type() { return m_type; }
    Q_INVOKABLE bool initialized() { return m_initialized; }
    Q_INVOKABLE QVariant uiProperty(const QString &key) const {
        return m_uiProperties.value(key);
    }

    // Setter
    Q_INVOKABLE void setName(const QString& name) { m_name = name; }
    Q_INVOKABLE void setUiProperty(const QString &key, const QVariant &value) {
        m_uiProperties[key] = value;
        updatePropertyFromUi(key, value);
        emit uiPropertyChanged();
    }

    // Methods
    virtual bool initialize() = 0;
    virtual void shutdown() = 0;

signals:
    void uiPropertyChanged();

protected:
    Q_INVOKABLE void setDeviceType(TypeHelper::DeviceType type) { m_type = type; }
    Q_INVOKABLE void setInitialized(bool initialized) { m_initialized = initialized; }
    virtual void updatePropertyFromUi(const QString &key, const QVariant &value) = 0;

private:
    QString m_name = "";
    TypeHelper::DeviceType m_type = TypeHelper::DeviceType::Undefined;
    bool m_initialized = false;
    QVariantMap m_uiProperties;
};

#endif // DEVICEBASE_H
