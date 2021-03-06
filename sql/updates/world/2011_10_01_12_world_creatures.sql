-- Editado por Gildor
-- Jormunger Control Orb
DELETE FROM `gameobject` WHERE `id`=192262;
-- Guid de YTDB
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(52558, 192262, 571, 1, 0x8, 8497.219, -90.90104, 789.2875, 0.1396245, 0, 0, 0.06975555, 0.9975641, 0, 0, 0);

DELETE FROM `creature` WHERE `id` IN (30301,30322,30300);
-- Guids de ZLDB
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(86776, 30301, 571, 1, 0x8, 0, 0, 8497.78, -99.0251, 786.528, 3.01942, 120, 0, 0, 1, 0, 0, 0, 0, 0), -- Tamed Jormungar
(88581, 30322, 571, 1, 0x8, 0, 0, 8505.47, -86.2532, 787.339, 3.28122, 120, 0, 0, 1, 0, 0, 0, 0, 0), -- Earthen Jormungar Handler
(88582, 30322, 571, 1, 0x8, 0, 0, 8502.62, -111.308, 790.176, 3.05433, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(88583, 30322, 571, 1, 0x8, 0, 0, 8498.78, -46.0375, 788.895, 2.53073, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(88395, 30300, 571, 1, 0x8, 0, 0, 8015.63, -126.515, 865.719, 3.39914, 120, 0, 0, 1, 0, 0, 0, 0, 0); -- Iron Colossus

-- Template updates
UPDATE `gameobject_template` SET `flags`=0x4 WHERE `entry`=192262; -- Jormungar Control Orb
UPDATE `creature_template` SET `faction_A`=1771,`faction_H`=1771,`unit_flags`=0x8040,`speed_walk`=2.8,`speed_run`=1.5873 WHERE `entry`=30300; -- Iron Colossus
UPDATE `creature_template` SET `faction_A`=1770,`faction_H`=1770,`npcflag`=0x1,`unit_flags`=0x300,`equipment_id`=2709,`speed_run`=0.99206 WHERE `entry`=30322; -- Earthen Jormungar Handler
UPDATE `creature_template` SET `faction_A`=113,`faction_H`=113,`unit_flags`=0x300,`speed_walk`=6,`speed_run`=2.14286,`VehicleId`=227,`RegenHealth`=1 WHERE `entry`=30301; -- Tamed Jormungar

-- Le pongo los EventAI como en TDB
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=30300;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(3030001,30300,0,0,100,1,9000,16000,20000,28000,11,61673,1,0,0,0,0,0,0,0,0,0,'Iron Colossus - Cast Ground Slam'); -- Iron Colossus

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=3.1,`combat_reach`=50,`gender`=0 WHERE `modelid`=27093; -- Iron Colossus
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=1,`gender`=0 WHERE `modelid`=26091; -- Earthen Jormungar Handler
UPDATE `creature_model_info` SET `bounding_radius`=1.55,`combat_reach`=5,`gender`=2 WHERE `modelid`=26935; -- Tamed Jormungar

-- Addon data for creature 30300 (Iron Colossus)
DELETE FROM `creature_template_addon` WHERE `entry` IN (30300,30322,30301);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30300,0,0,1,0, NULL), -- Iron Colossus
(30322,0,0,1,0, NULL), -- Earthen Jormungar Handler
(30301,0,0,1,0, NULL); -- Tamed Jormungar

DELETE FROM `spell_area` WHERE spell=56526;
INSERT INTO `spell_area`(`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES
(56526,4436,13007,1,13007,0,0,2,1), -- Snowdrift Plains
(56526,4435,13007,1,13007,0,0,2,1); -- Navirs Cradle
