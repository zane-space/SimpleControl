#include "PausedState.h"
#include "RunningState.h"
#include "ReadyState.h"
#include "ScriptManager.h"

void PausedState::start() {
    m_manager->changeState(new RunningState());
    m_manager->runCommand();
}

void PausedState::pause() {
    return;
}

void PausedState::stop() {
    m_manager->changeState(new ReadyState());
}
