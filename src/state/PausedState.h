#ifndef PAUSEDSTATE_H
#define PAUSEDSTATE_H

#include "StateBase.h"

class PausedState : public StateBase {

public:
    void start() override;
    void pause() override;
    void stop() override;
};


#endif // PAUSEDSTATE_H
