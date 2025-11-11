#include "ReadyState.h"
#include "PausedState.h"
#include "RunningState.h"
#include "ScriptManager.h"

void RunningState::start() {
    return;
}

void RunningState::pause() {
    m_manager->changeState(new PausedState());
}

void RunningState::stop() {
    m_manager->changeState(new ReadyState());
}

