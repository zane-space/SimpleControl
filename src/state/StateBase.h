#ifndef STATEBASE_H
#define STATEBASE_H


class ScriptManager;

class StateBase {

public:
    StateBase() {}
    ~StateBase() {}

    void setContext(ScriptManager* manager) {
        m_manager = manager;
    }

    virtual void start() = 0;
    virtual void pause() = 0;
    virtual void stop() = 0;

protected:
    ScriptManager* m_manager;
};

#endif // STATEBASE_H
