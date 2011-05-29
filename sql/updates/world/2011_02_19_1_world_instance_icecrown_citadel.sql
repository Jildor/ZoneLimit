-- creature template updates (Edit by Gildor)
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`unit_class`=1,`faction_A`=1665,`faction_H`=1665,`unit_flags`=0x20000000,`baseattacktime`=2000,`scale`=1,`RegenHealth`=0 WHERE `entry` IN (36789,38174); -- Valithria Dreamwalker
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_class`=1,`faction_A`=14,`faction_H`=14,`unit_flags`=0x2000000,`baseattacktime`=2000,`scale`=1 WHERE `entry`=38752; -- Green Dragon Combat Trigger
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`unit_class`=2,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x0040,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1,`speed_run`=2.285714,`speed_walk`=1.6,`InhabitType`=7 WHERE `entry` IN (37126,38258); -- Sister Svalna
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=8,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x8040,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1 WHERE `entry` IN (37127,38126); -- Ymirjar Frostbinder
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=1,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x8040,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1,`speed_walk`=1.2 WHERE `entry` IN (37132,38132); -- Ymirjar Battle-Maiden
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=1,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x8040,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1,`speed_run`=1.428571 WHERE `entry` IN (37133,38133); -- Ymirjar Warlord
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=2,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x8040,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1,`speed_run`=1.285714 WHERE `entry` IN (37134,38131); -- Ymirjar Huntress
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=2,`faction_A`=2209,`faction_H`=2209,`unit_flags`=0x8000,`dynamicflags`=8,`baseattacktime`=2000,`scale`=1 WHERE `entry` IN (38125,38130); -- Ymirjar Deathbringer
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_class`=1,`faction_A`=2209,`faction_H`=2209,`baseattacktime`=2000,`scale`=1 WHERE `entry`=38154; -- Warhawk

-- model updates (edit by Gildor)
UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=2.25,`gender`=0 WHERE `modelid`=7919; -- Risen Archmage
UPDATE `creature_model_info` SET `bounding_radius`=0.93,`combat_reach`=12,`gender`=1 WHERE `modelid`=30521; -- Sister Svalna
UPDATE `creature_model_info` SET `bounding_radius`=0.403,`combat_reach`=1.3,`gender`=1 WHERE `modelid`=27548; -- Ymirjar Frostbinder

-- Mode specific objects (instance portal) reused deleted guids
-- Guids edit by Gildor
DELETE FROM `gameobject` WHERE `id` IN (202315,202316,202317,202318);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(42608,202318,631,5,1,82.1685,2211.82,33.0959,3.14159,0,0,1,0,6000,100,1),
(42643,202316,631,10,1,82.1685,2211.82,33.0959,3.14159,0,0,1,0,6000,100,1),
(42667,202317,631,5,1,82.1685,2211.82,33.0959,3.14159,0,0,1,0,6000,100,1),
(42651,202315,631,10,1,82.1685,2211.82,33.0959,3.14159,0,0,1,0,6000,100,1);

UPDATE `gameobject_template` SET `faction`=114,`flags`=0x00000020 WHERE entry IN (202181,202182,202183,201919,201920);
UPDATE `gameobject` SET `state`=0,animprogress=255 WHERE `id` IN (202181,202182,202183,201919,201920);

-- Dejo los spawns como en TDB cogiendo Guids de YTDB
DELETE FROM `creature` WHERE `guid` IN (47618,47622);
DELETE FROM `creature` WHERE `id` = 36789 && `guid` IN (83235,47622);
DELETE FROM `creature` WHERE `id` = 37868 && `guid` IN (62056,77143,75886,61780);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
-- Caminasueños
('83235','36789','631','5','1','0','0','4203.65','2483.89','364.961','5.51524','604800','0','0','6000003','0','0','0','0','0','0'),
('47622','36789','631','10','5','0','0','4203.65','2483.89','364.961','5.51524','604800','0','0','17999997','0','0','0','0','0','0'),
-- Archimago resucitado
('62056','37868','631','15','1','0','0','4222.86','2504.57','364.96','3.90954','7200','0','0','104264','81620','0','2','0','0','0'),
('77143','37868','631','15','1','0','0','4223.4','2465.11','364.952','2.3911','7200','0','0','104264','81620','0','2','0','0','0'),
('75886','37868','631','15','1','0','0','4230.54','2490.22','364.957','3.36848','7200','0','0','104264','81620','0','2','0','0','0'),
('61780','37868','631','15','1','0','0','4230.44','2478.56','364.953','2.93215','7200','0','0','104264','81620','0','2','0','0','0'),
-- Señor de la guerra Ymirjar
('47618','37133','631','15','1','0','0','4366.83','2510.3','358.518','1.62316','7200','0','0','0','0','0','0','0','0','0');
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (38752,37126) && `guid` IN (10718,77655);


-- creature addon
-- Les quito de template, que ya no valen
DELETE FROM `creature_template_addon` WHERE `entry` IN (37132,37133,37134,38229);
-- Guids de YTDB
DELETE FROM `creature_addon` WHERE `guid` IN (77655,47618,78004,78111,92818);
INSERT INTO `creature_addon` (`guid`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(77655,0x3000000,0x0000001,0, '70203 0'), -- Sister Svalna
(47618,0x0000000,0x0000001,0, '71244 0'), -- Ymirjar Warlord
(78004,0x0000000,0x0000001,0, '71244 0'), -- Ymirjar Warlord
(78111,0x0000000,0x0000001,0, '71244 0'), -- Ymirjar Warlord
(92818,0x0000000,0x0000001,0, '71244 0'); -- Ymirjar Warlord