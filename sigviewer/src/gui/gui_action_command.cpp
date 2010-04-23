#include "gui_action_command.h"
#include "gui_action_factory.h"
#include "../application_context.h"

#include <cassert>

namespace BioSig_
{

//-----------------------------------------------------------------------------
GuiActionCommand::GuiActionCommand (QStringList const& action_ids)
{
    for (QStringList::const_iterator iter = action_ids.begin();
         iter != action_ids.end();
         ++iter)
    {
        action_map_[*iter] = new QAction (*iter, this);
        connectors_.push_back (new ActionConnector (this, *iter));
        assert (connectors_.last ()->connect (action_map_[*iter], SIGNAL(triggered()), SLOT(trigger())));
        assert (connect (connectors_.last (), SIGNAL(triggered(QString const&)), SLOT(trigger(QString const&))));
        assert (action_map_[*iter]->connect (this, SIGNAL(qActionEnabledChanged(bool)), SLOT(setEnabled (bool))));
        assert (connect (ApplicationContext::getInstance().data(), SIGNAL(stateChanged(ApplicationState)),
                          SLOT(applicationStateChanged(ApplicationState))));
        assert (connect (ApplicationContext::getInstance().data(), SIGNAL(currentTabSelectionStateChanged(TabSelectionState)),
                          SLOT(tabSelectionStateChanged (TabSelectionState))));
    }
}

//-----------------------------------------------------------------------------
QList<QAction*> GuiActionCommand::getQActions ()
{
    return action_map_.values ();
}

//-----------------------------------------------------------------------------
QList<QString> GuiActionCommand::getActionIDs () const
{
    return action_map_.keys ();
}


//-----------------------------------------------------------------------------
QAction* GuiActionCommand::getQAction (QString const& id)
{
    if (action_map_.contains (id))
        return action_map_[id];
    else
        return 0;
}



}
