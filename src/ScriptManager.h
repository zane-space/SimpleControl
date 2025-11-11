#ifndef SCRIPTMANAGER_H
#define SCRIPTMANAGER_H

#include <QString>
#include <QDebug>
#include <QtConcurrent>
#include <QThread>
#include "TypeHelper.h"
#include "DeviceBase.h"
#include "DensoRobot.h"
#include "KukaRobot.h"
#include "SimensPlc.h"
#include "DeltaScrewdriver.h"
#include "CommandBase.h"
#include "DensoRobotMoveCommand.h"
#include "DensoRobotStopCommand.h"
#include "KukaRobotMoveCommand.h"
#include "KukaRobotStopCommand.h"
#include "SimensPlcSetDoOnCommand.h"
#include "SimensPlcSetDoOffCommand.h"
#include "DeltaScrewdirverStartCommand.h"
#include "DeltaScrewdirverStopCommand.h"
#include "StateBase.h"
#include "ReadyState.h"
#include "RunningState.h"
#include "PausedState.h"


// Use to manage data
class ScriptManager : public QObject {
    Q_OBJECT
public:
    explicit ScriptManager(QObject* parent=nullptr) : QObject(parent) {
        changeState(new ReadyState());
    }

    Q_INVOKABLE const QVector<DeviceBase*>& devices() const { return m_devices; }
    Q_INVOKABLE const QVector<CommandBase*>& commands() const { return m_commands; }    

    Q_INVOKABLE void addDevice(const QString& brandType){
        QString name = QString("Device%1").arg(++m_deviceCount);
        DeviceBase* device = createDevice(brandType, name);
        const int pos = m_devices.size();
        m_devices.append(device);
        emit deviceAdded(device);
        Q_UNUSED(pos);
    }

    Q_INVOKABLE void removeDevice(int index) {
        if (index<0 || index>=m_devices.size()) return;
        auto* device = m_devices.at(index);
        m_devices.removeAt(index);
        emit deviceRemoved(device, index);
        device->deleteLater();
    }

    Q_INVOKABLE DeviceBase* getDevice(const QString& name)
    {
        for (auto* dev : m_devices) {
            if (dev && dev->name() == name)
                return dev;
        }
        return nullptr;
    }

    Q_INVOKABLE QObject* getDevice(int index) {
        if (index < 0 || index >= m_devices.size())
            return nullptr;

        return m_devices.at(index);
    }

    Q_INVOKABLE void addCommand(DeviceBase* device){
        CommandBase* command = createCommand(device, "");
        m_commands.append(command);
        emit commandAdded(command);
    }

    Q_INVOKABLE QObject* getCommand(int index) {
        if (index < 0 || index >= m_commands.size())
            return nullptr;

        return m_commands.at(index);
    }

    Q_INVOKABLE void updateCommandMethod(int row, DeviceBase* device, const QString& method){
        m_commands[row] = createCommand(device, method);
    }

    // Script control
    Q_INVOKABLE void startScript(){
        m_state->start();
    }

    Q_INVOKABLE void pauseScript(){
        m_state->pause();
    }

    Q_INVOKABLE void stopScript(){
        m_state->stop();
    }

    Q_INVOKABLE void runCommand() {
        if (m_commands.isEmpty())
            return;

        if (m_currentCommandIndex >= m_commands.size()) {
            m_currentCommandIndex = 0;
        }

        auto command = m_commands[m_currentCommandIndex];
        emit commandStarted(command->device(), command->method());

        QEventLoop loop;
        QTimer::singleShot(2000, &loop, &QEventLoop::quit);
        loop.exec();

        bool ok = command->execute();
        emit commandFinished(command->device(), ok, command->method());

        if (!dynamic_cast<RunningState*>(m_state)) {
            emit commandInterrupted();
            return;
        }

        m_currentCommandIndex++;

        QTimer::singleShot(1000, this, &ScriptManager::runCommand);
    }

    void setCommandIndex(int index) {
        m_currentCommandIndex = index;
    }

    void changeState(StateBase* state) {
        m_state = state;
        m_state->setContext(this);
    }


signals:
    void deviceAdded(DeviceBase* device);
    void deviceRemoved(DeviceBase* device, int index);
    void commandAdded(CommandBase* command);
    void commandRemoved(CommandBase* command, int index);
    void commandStarted(DeviceBase* device, const QString& method);
    void commandFinished(DeviceBase* device, bool ok, const QString& method);
    void commandInterrupted();

private:
    QVector<DeviceBase*> m_devices;
    QVector<CommandBase*> m_commands;
    int m_deviceCount = 0;
    StateBase* m_state;
    int m_currentCommandIndex = 0;

    DeviceBase* createDevice(const QString& brandType, const QString& name){
        DeviceBase* device = nullptr;

        if (brandType == "DensoRobot")
            device = new DensoRobot(name, this);
        else if (brandType == "KukaRobot")
            device = new KukaRobot(name, this);
        else if (brandType == "SimensPlc")
            device = new SimensPlc(name, this);
        else if (brandType == "DeltaScrewdriver")
            device = new DeltaScrewdriver(name, this);

        return device;
    }

    CommandBase* createCommand(DeviceBase* device, const QString& method){
        CommandBase* command = nullptr;

        if(device->type() == TypeHelper::DeviceType::Robot){
            auto robot = dynamic_cast<RobotBase*>(device);
            if(robot->brand() == TypeHelper::BrandType::Denso){
                if(method == "" || method == "move")
                    command = new DensoRobotMoveCommand(device);
                else if(method == "stop")
                    command = new DensoRobotStopCommand(device);
            }
            else if(robot->brand() == TypeHelper::BrandType::Kuka){
                if(method == "" || method == "move")
                    command = new KukaRobotMoveCommand(device);
                else if(method == "stop")
                    command = new KukaRobotStopCommand(device);
            }
        }

        if(device->type() == TypeHelper::DeviceType::Plc){
            if(method == "" || method == "setDoOn")
                command = new SimensPlcSetDoOnCommand(device);
            else if(method == "setDoOff")
                command = new SimensPlcSetDoOffCommand(device);
        }

        if(device->type() == TypeHelper::DeviceType::Screwdriver){
            if(method == "" || method == "start")
                command = new DeltaScrewdriverStartCommand(device);
            else if(method == "stop")
                command = new DeltaScrewdriverStopCommand(device);
        }

        return command;
    }
};

#endif // SCRIPTMANAGER_H

