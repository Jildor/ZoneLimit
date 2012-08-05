--- Editado por Gildor
-- Le quito los AIScripts
UPDATE `creature_template` SET `AIName` = '' WHERE entry = 28586;
DELETE FROM creature_ai_scripts WHERE creature_id = 28586;

-- HoL General Bjarngrim event Temporary Electrical Charge
-- Clear wrong aura
UPDATE `creature_addon` SET `auras`='' WHERE `guid` = 115219;
