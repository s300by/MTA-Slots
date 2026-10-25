-- =====================================================================
--  Developer : Sc00By
--  Platform  : Multi Theft Auto: San Andreas (MTA:SA)
--  File      : Sc00by/gamemachines/sourceG.lua
-- =====================================================================

gameTypes = {
	GOLD_RUSH = 1,
	GTA = 2,
	WESTERN = 3,
	STAR_WARS = 4
}

for k,v in pairs(gameTypes) do
	gameTypes[v] = k
end

machineModels = {
	GOLD_RUSH = 1515,
	GTA = 1515,
	WESTERN = 2640,
	STAR_WARS = 2640
}

gameResourceNames = {
	GOLD_RUSH = "goldrush",
	GTA = "gtaslot",
	WESTERN = "westernslot",
	STAR_WARS = "swslot"
}

function rotateAround(angle, offsetX, offsetY, originX, originY)
	angle = math.rad(angle)

	local cosAngle = math.cos(angle)
	local sinAngle = math.sin(angle)

	local rotatedX = offsetX * cosAngle - offsetY * sinAngle
	local rotatedY = offsetX * sinAngle + offsetY * cosAngle

	originX = originX or 0
	originY = originY or 0

	return originX + rotatedX, originY + rotatedY
end