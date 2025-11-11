#ifndef COMMANDLISTMODEL_H
#define COMMANDLISTMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include "ScriptManager.h"

class CommandListModel : public QAbstractListModel {
    Q_OBJECT

public:
    explicit CommandListModel(ScriptManager* manager, QObject* parent = nullptr) {
        m_manager = manager;

        // Signal Connection
        connect(m_manager, &ScriptManager::commandAdded,
                this, &CommandListModel::onCommandAdded);
    }

    enum Roles {
        DeviceNameRole = Qt::UserRole + 1,
        SelectedMethodRole,
        CandidateMethodsRole
    };
    Q_ENUM(Roles)

    // QAbstractListModel overrides
    int rowCount(const QModelIndex& parent = QModelIndex()) const override {
        return m_manager->commands().size();
    }

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override {
        CommandBase* command = m_manager->commands().at(index.row());

        switch (role) {
            case DeviceNameRole:
                return command->device()->name();

            case SelectedMethodRole:
                return command->method();

            case CandidateMethodsRole:
                return TypeHelper::getMethods(command->device()->type());

            default:
                return {};
        }
    };

    QHash<int, QByteArray> roleNames() const override {

        return {
            { DeviceNameRole, "deviceName"},
            { SelectedMethodRole, "selectedMethod"},
            { CandidateMethodsRole, "candidateMethods"}
        };
    };

private slots:
    void onCommandAdded(CommandBase* command) {
        const int pos = m_manager->commands().size() - 1;
        beginInsertRows(QModelIndex(), pos, pos);
        endInsertRows();
    }

private:
    ScriptManager* m_manager = nullptr;
};

#endif // FLOW_H
