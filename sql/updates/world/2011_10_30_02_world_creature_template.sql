-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `maxlevel`=49,`faction_A`=45,`faction_H`=45,`AIName`='',`spell1`=11901 WHERE `entry`=8179; -- Greater Healing Ward
UPDATE `creature_template` SET `AIName`='',`spell1`=6276 WHERE `entry`=3844; -- Healing Ward IV
UPDATE `creature_template` SET `minlevel`=28,`AIName`='',`spell1`=4972  WHERE `entry`=2992; -- Healing Ward V
UPDATE `creature_template` SET `minlevel`=64,`maxlevel`=64,`spell1`=31986 WHERE `entry`=18177; -- Tainted Stoneskin Totem
UPDATE `creature_template` SET `minlevel`=64,`maxlevel`=64,`AIName`='',`spell1`=34978 WHERE `entry`=20208; -- Mennu's Healing Ward
UPDATE `creature_template` SET `AIName`='',`spell1`=52894 WHERE `entry`=29225; -- Anti-Magic Zone
UPDATE `creature_template` SET `AIName`='',`spell1`=56762 WHERE `entry`=30444; -- The Chieftain's Totem
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`spell1`=46373 WHERE `entry`=25987; -- Windsoul Totem
UPDATE `creature_template` SET `minlevel`=51,`speed_walk`=0.01,`AIName`='',`spell1`=12507 WHERE `entry`=8510; -- Atal'ai Totem
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`minlevel`=1,`maxlevel`=1,`baseattacktime`=2000,`unit_class`=1,`speed_walk`=1,`speed_run`=1,`flags_extra`=2 WHERE `entry`=3968; -- Sentry Totem
UPDATE `creature_template` SET `minlevel`=1,`maxlevel`=1,`faction_A`=35,`faction_H`=35,`unit_class`=1,`speed_walk`=1,`speed_run`=1 WHERE `entry`=7484; -- Windfury Totem III
UPDATE `creature_template` SET `minlevel`=1,`maxlevel`=1,`speed_walk`=1 WHERE `entry`=15483; -- Fire Nova Totem VII
UPDATE `creature_template` SET `faction_A`=1759,`faction_H`=1759,`unit_flags`=768 WHERE `entry`=19222; -- Magma Flow Totem
UPDATE `creature_template` SET `minlevel`=64,`faction_A`=74,`faction_H`=74,`speed_walk`=1,`speed_run`=1,`spell1`=33134 WHERE `entry`=18179; -- Corrupted Nova Totem
UPDATE `creature_template` SET `minlevel`=64,`maxlevel`=64,`faction_A`=74,`faction_H`=74,`baseattacktime`=2000,`speed_walk`=1,`speed_run`=1,`spell1`=31982 WHERE `entry`=18176; -- Tainted Earthgrab Totem
UPDATE `creature_template` SET `minlevel`=1,`maxlevel`=1,`unit_flags`=`unit_flags`|512,`speed_run`=0.99206 WHERE `entry`=20455; -- Terror Totem

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8179; -- Greater Healing Ward
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=3844; -- Healing Ward IV
-- Lo pongo como en TDB
DELETE FROM `creature_ai_scripts` WHERE `id`=18177; -- Tainted Stoneskin Totem
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(1817701,18177,1,0,100,6,0,0,0,0,20,0,0,0,21,0,0,0,0,0,0,0,'Mennu Stoneskin Totem - Prevent Combat Movement and Prevent Melee on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=20208; -- Mennu's Healing Ward
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8510; -- Atal'ai Totem

DELETE FROM `creature_template_addon` WHERE `entry` IN (3968,7484,15483,19222,24046,24045,18179,18176);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(3968,0,0,1,0, NULL), -- Sentry Totem
(7484,0,0,1,0, NULL), -- Windfury Totem III
(15483,0,0,1,0, NULL), -- Fire Nova Totem VII
(19222,0,0,1,0, NULL), -- Magma Flow Totem
(24046,0,0,257,0, NULL), -- Fire Spirit Totem
(24045,0,0,257,0, NULL), -- Water Spirit Totem
(18179,0,0,1,0, NULL), -- Corrupted Nova Totem
(18176,0,0,1,0, NULL); -- Tainted Earthgrab Totem
