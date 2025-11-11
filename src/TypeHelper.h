#ifndef TYPEHELPER_H
#define TYPEHELPER_H

#include <QObject>
#include <QString>
#include <QJsonArray>
#include <QStringList>

class DeviceBase;

class TypeHelper : public QObject {
    Q_OBJECT

public:
    enum class DeviceType {
        Robot,
        Plc,
        Screwdriver,
        Undefined
    };
    Q_ENUM(DeviceType)

    enum class BrandType {
        Denso,
        Kuka,
        Simens,
        Delta,
        Undefined
    };
    Q_ENUM(BrandType)

    struct Pose {
        double x{}, y{}, z{}, rx{}, ry{}, rz{};
    };

    static QStringList getMethods(DeviceType deviceType) {
        static const std::unordered_map<DeviceType, QStringList> methodsMap {
            {DeviceType::Robot, {"move", "stop"}},
            {DeviceType::Plc, {"setDoOn", "setDoOff"}},
            {DeviceType::Screwdriver, {"start", "stop"}}
        };
        return methodsMap.at(deviceType);
    }
};

Q_DECLARE_METATYPE(TypeHelper::DeviceType)
Q_DECLARE_METATYPE(TypeHelper::BrandType)
Q_DECLARE_METATYPE(TypeHelper::Pose)

#endif
