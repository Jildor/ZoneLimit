-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `ScriptName`='npc_frost_tomb' WHERE `entry`=23965;
UPDATE `creature_template` SET `AIName`='',`flags_extra`=64,`ScriptName`='npc_vrykul_skeleton' WHERE `entry`=23970;
-- Le quito EAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=23970;
