#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ScriptManager.h"
#include "DeviceListModel.h"
#include "CommandListModel.h"
#include "TypeHelper.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableType<TypeHelper>(
        "Types", 1, 0, "Type",
        "Enum container only");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("SimpleControl", "App");

    ScriptManager scriptManager;
    engine.rootContext()->setContextProperty("scriptManager", &scriptManager);

    auto deviceListModel = new DeviceListModel(&scriptManager);
    engine.rootContext()->setContextProperty("deviceListModel", deviceListModel);

    auto commandListModel = new CommandListModel(&scriptManager);
    engine.rootContext()->setContextProperty("commandListModel", commandListModel);

    qmlRegisterUncreatableType<DeviceBase>("Types", 1, 0, "DeviceInterface", "Abstract base");


    return app.exec();
}
