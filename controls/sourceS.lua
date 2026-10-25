-- =====================================================================
--  Developer : Sc00By
--  Platform  : Multi Theft Auto: San Andreas (MTA:SA)
--  File      : Sc00by/controls/sourceS.lua
-- =====================================================================

function toggleControl(playerElement, control, enabled)
	if isElement(playerElement) then
		triggerClientEvent(playerElement, "toggleControl", playerElement, control, enabled, getResourceName(sourceResource))
	end
end