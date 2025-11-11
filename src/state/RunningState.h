#ifndef RUNNINGSTATE_H
#define RUNNINGSTATE_H

#include "StateBase.h"

class RunningState : public StateBase {

public:
    void start() override;
    void pause() override;
    void stop() override;
};

#endif // RUNNINGSTATE_H
