#include "ReadyState.h"
#include "RunningState.h"
#include "ScriptManager.h"

void ReadyState::start() {
    m_manager->setCommandIndex(0);
    m_manager->changeState(new RunningState());

    // TODO: Do reset
    m_manager->runCommand();
}

void ReadyState::pause() {
    return;
}

void ReadyState::stop() {
    return;
}
