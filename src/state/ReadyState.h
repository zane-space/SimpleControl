#ifndef READYSTATE_H
#define READYSTATE_H

#include "StateBase.h"

class ReadyState : public StateBase {

public:
    void start() override;
    void pause() override;
    void stop() override;
};


#endif // READYSTATE_H
