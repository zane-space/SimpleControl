#ifndef DEVICELISTMODEL_H
#define DEVICELISTMODEL_H

#include <QAbstractListModel>
#include "ScriptManager.h"
#include "DeviceBase.h"

class DeviceListModel : public QAbstractListModel {
    Q_OBJECT

public:
    explicit DeviceListModel(ScriptManager* manager, QObject* parent = nullptr) {
        m_manager = manager;

        // Signal Connection
        connect(m_manager, &ScriptManager::deviceAdded,
                this, &DeviceListModel::onDeviceAdded);
    }

    enum Roles {
        DeviceNameRole = Qt::UserRole + 1,
        DeviceTypeRole
    };
    Q_ENUM(Roles)

    // QAbstractListModel overrides
    int rowCount(const QModelIndex& parent = QModelIndex()) const override {
        return m_manager->devices().size();
    }

    QVariant data(const QModelIndex& index, int role) const override {
        DeviceBase* device = m_manager->devices().at(index.row());

        switch (role) {
            case DeviceNameRole:
                return device->name();

            case DeviceTypeRole:
                return QVariant::fromValue(device->type());

            default:
                return {};
        }
    };

    QHash<int, QByteArray> roleNames() const override {
        return {
            { DeviceNameRole, "deviceName" },
            { DeviceTypeRole, "deviceType" },
        };
    };

private slots:
    void onDeviceAdded(DeviceBase* device) {
        const int pos = m_manager->devices().size() - 1;
        beginInsertRows(QModelIndex(), pos, pos);
        endInsertRows();
    }

    // void DeviceListModel::onDeviceRemoved(DeviceBase* /*dev*/, int index) {
    //     if (index < 0 || index >= devices().size()) return;
    //     beginRemoveRows(QModelIndex(), index, index);
    //     endRemoveRows();
    // }

private:
    ScriptManager* m_manager = nullptr;
};

#endif // DEVICELISTMODEL_H
