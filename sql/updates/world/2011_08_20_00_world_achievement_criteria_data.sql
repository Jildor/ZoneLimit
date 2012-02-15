-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `AIName`='', `mechanic_immune_mask`=8388625, `flags_extra`=0, `ScriptName`='npc_kelthuzad_abomination' WHERE `entry` IN (16428,30048);

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=16428;

-- Borro los type 18
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7614, 7615) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7614,11,0,0,'achievement_just_cant_get_enough'),
(7615,11,0,0,'achievement_just_cant_get_enough');

DELETE FROM `disables` WHERE `entry` IN (7614, 7615);
