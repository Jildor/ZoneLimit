-- TDB
DELETE FROM `creature_template_addon` WHERE `entry` IN (32823,34645,34783,34682,35337,35338,35340,34711,34676,34708,34644,34744,34710,34675);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(32823,0,0,1,0, NULL), -- Bountiful Table
(34645,0,0,1,0, NULL), -- Elizabeth Barker Winslow
(34783,0,0,1,0, NULL), -- Ranisa Whitebough
(34682,0,0,1,0, NULL), -- Wilmina Holbeck
(35337,0,0,1,0, NULL), -- Bountiful Barrel
(35338,0,0,1,0, NULL), -- Bountiful Barrel
(35340,0,0,1,0, NULL), -- Bountiful Barrel
(34711,0,0,2,0, NULL), -- Mary Allerton
(34676,0,0,2,0, NULL), -- Isaac Allerton
(34708,0,0,2,0, NULL), -- Caitrin Ironkettle
(34644,0,0,2,0, NULL), -- Edward Winslow
(34744,0,0,1,0, NULL), -- Jasper Moore
(34710,0,0,1,0, NULL), -- Ellen Moore
(34675,0,0,2,0, NULL); -- Gregory Tabor

UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`unit_flags`=33536 WHERE `entry`=34783; -- Ranisa Whitebough
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`unit_flags`=33536 WHERE `entry`=34645; -- Elizabeth Barker Winslow
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`unit_flags`=33536 WHERE `entry`=34681; -- Ikaneba Summerset
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`unit_flags`=33536 WHERE `entry`=34682; -- Wilmina Holbeck
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`speed_run`=1 WHERE `entry`=35337; -- Bountiful Barrel
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`speed_run`=1 WHERE `entry`=35338; -- Bountiful Barrel
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=640,`speed_run`=1 WHERE `entry`=35340; -- Bountiful Barrel
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=83,`unit_flags`=33536 WHERE `entry`=34711; -- Mary Allerton
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`unit_flags`=33536 WHERE `entry`=34676; -- Isaac Allerton
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=83,`unit_flags`=33536 WHERE `entry`=34708; -- Caitrin Ironkettle
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`unit_flags`=33536 WHERE `entry`=34644; -- Edward Winslow
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=3,`unit_flags`=33536 WHERE `entry`=34744; -- Jasper Moore
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`npcflag`=83,`unit_flags`=33536 WHERE `entry`=34710; -- Ellen Moore
UPDATE `creature_template` SET `faction_A`=534,`faction_H`=534,`baseattacktime`=2000,`unit_flags`=33536 WHERE `entry`=34675; -- Gregory Tabor

UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29394; -- Elizabeth Barker Winslow
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29430; -- Ranisa Whitebough
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29393; -- Ikaneba Summerset
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29329; -- Wilmina Holbeck
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29388; -- Mary Allerton
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=29391; -- Isaac Allerton
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29324; -- Caitrin Ironkettle
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=29392; -- Edward Winslow
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=29444; -- Jasper Moore
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29400; -- Ellen Moore
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=29337; -- Gregory Tabor

UPDATE `item_template` SET `BuyCount`=5 WHERE `entry` IN (44854,46784,44855);

UPDATE `creature_template` SET `unit_flags`=33555200,`VehicleId`=323 WHERE `entry`=32830; -- Food Holder
UPDATE `creature_template` SET `unit_flags`=33555200,`VehicleId`=325 WHERE `entry`=32840; -- Plate Holder
UPDATE `creature_template` SET `unit_flags`=33554432,`speed_run`=1,`VehicleId`=320 WHERE `entry`=32823; -- Bountiful Table
UPDATE `creature_template` SET `unit_flags`=33554432,`speed_run`=1 WHERE `entry`=32839; -- Sturdy Plate
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=32824; -- [PH] Pilgrim's Bounty Table - Turkey
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=32827; -- [PH] Pilgrim's Bounty Table - Cranberry Sauce
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=32831; -- [PH] Pilgrim's Bounty Table - Stuffing
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=32825; -- [PH] Pilgrim's Bounty Table - Yams
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=32829; -- [PH] Pilgrim's Bounty Table - Pie

UPDATE `creature_model_info` SET `bounding_radius`=1.8,`combat_reach`=0,`gender`=2 WHERE `modelid`=28293; -- Bountiful Table
UPDATE `creature_model_info` SET `bounding_radius`=1.75,`combat_reach`=0,`gender`=2 WHERE `modelid`=28310; -- Sturdy Plate
UPDATE `creature_model_info` SET `bounding_radius`=0.125,`combat_reach`=0.25,`gender`=2 WHERE `modelid`=17188; -- [PH] Pilgrim's Bounty Table - X

DELETE FROM `creature_template_addon` WHERE `entry` IN (32830,32840,32839,32824,32827,32831,32829,32825);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(32830,0,0,1,0, NULL), -- Food Holder
(32840,0,0,1,0, NULL), -- Plate Holder
(32839,0,0,1,0, NULL), -- Sturdy Plate
(32824,0,0,1,0, NULL), -- [PH] Pilgrim's Bounty Table - Turkey
(32827,0,0,1,0, NULL), -- [PH] Pilgrim's Bounty Table - Cranberry Sauce
(32831,0,0,1,0, NULL), -- [PH] Pilgrim's Bounty Table - Stuffing
(32825,0,0,1,0, NULL), -- [PH] Pilgrim's Bounty Table - Yams
(32829,0,0,1,0, NULL); -- [PH] Pilgrim's Bounty Table - Pie

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (32823,32830,32840);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(32823, 46598, 0, 0, 0, 1, 0, 0, 0), -- Bountiful Table (Ride Vehicle Hardcoded)
(32830, 46598, 0, 0, 0, 1, 0, 0, 0), -- Food Holder (Ride Vehicle Hardcoded)
(32840, 46598, 0, 0, 0, 1, 0, 0, 0); -- Plate Holder (Ride Vehicle Hardcoded)

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (32823,32830,32840);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(32823, 34812, 0, 1, 'Bountiful Table - The Turkey Chair', 8, 0),
(32823, 34823, 1, 1, 'Bountiful Table - The Cranberry Chair', 8, 0),
(32823, 34819, 2, 1, 'Bountiful Table - The Stuffing Chair', 8, 0),
(32823, 34824, 3, 1, 'Bountiful Table - The Sweet Potato Chair', 8, 0),
(32823, 34822, 4, 1, 'Bountiful Table - The Pie Chair', 8, 0),
(32823, 32830, 5, 1, 'Bountiful Table - Food Holder', 8, 0),
(32823, 32840, 6, 1, 'Bountiful Table - Plate Holder', 8, 0),
--
(32830, 32824, 0, 1, 'Food Holder - [PH] Pilgrim''s Bounty Table - Turkey', 8, 0),
(32830, 32827, 1, 1, 'Food Holder - [PH] Pilgrim''s Bounty Table - Cranberry Sauce', 8, 0),
(32830, 32831, 2, 1, 'Food Holder - [PH] Pilgrim''s Bounty Table - Stuffing', 8, 0),
(32830, 32825, 3, 1, 'Food Holder - [PH] Pilgrim''s Bounty Table - Yams', 8, 0),
(32830, 32829, 4, 1, 'Food Holder - [PH] Pilgrim''s Bounty Table - Pie', 8, 0),
--
(32840, 32839, 0, 1, 'Plate Holder - Sturdy Plate', 8, 0),
(32840, 32839, 1, 1, 'Plate Holder - Sturdy Plate', 8, 0),
(32840, 32839, 2, 1, 'Plate Holder - Sturdy Plate', 8, 0),
(32840, 32839, 3, 1, 'Plate Holder - Sturdy Plate', 8, 0),
(32840, 32839, 4, 1, 'Plate Holder - Sturdy Plate', 8, 0);

-- Lonely Turkey
DELETE FROM `creature_template` WHERE `entry` = 32956;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('32956','0','0','0','0','0','21774','0','0','0','Lonely Turkey','','','0','1','1','0','189','189','0','1','1.14286','1','0','2','2','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','32956','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.05','1','1','0','0','0','0','0','0','0','121','1','0','0','0','','12340');
-- --

-- HyD & Vincent Michael
-- ----------------------
-- -- Event Misc Fixes --
-- ----------------------
-- Set Bountiful Table untargetable flag.
UPDATE `creature_template` SET
`unit_flags`=`unit_flags`
|33554432
WHERE `entry`=32823;

-- -----------------------------
-- -- Event Achievement Fixes --
-- -----------------------------
-- Add missing criteria data
DELETE FROM `achievement_criteria_data` WHERE
 `criteria_id` BETWEEN 11118 AND 11127 OR -- Now We're Cookin'
 `criteria_id` BETWEEN 11198 AND 11207 OR -- Pilgrim's Progress
 `criteria_id` BETWEEN 11134 AND 11141 OR -- Pilgrim's Peril
 `criteria_id` BETWEEN 11078 AND 11085;   -- Pilgrim's Paunch
INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(11078,14,469,0,''),
(11079,14,469,0,''),
(11080,14,469,0,''),
(11081,14,469,0,''),
(11082,14,67,0,''),
(11083,14,67,0,''),
(11084,14,67,0,''),
(11085,14,67,0,''),
(11118,14,469,0,''),
(11119,14,469,0,''),
(11120,14,469,0,''),
(11121,14,469,0,''),
(11122,14,469,0,''),
(11123,14,67,0,''),
(11124,14,67,0,''),
(11126,14,67,0,''),
(11127,14,67,0,''),
(11134,14,469,0,''),
(11135,14,469,0,''),
(11136,14,469,0,''),
(11137,14,469,0,''),
(11138,14,67,0,''),
(11139,14,67,0,''),
(11140,14,67,0,''),
(11141,14,67,0,''),
(11198,14,469,0,''),
(11199,14,469,0,''),
(11200,14,469,0,''),
(11201,14,469,0,''),
(11202,14,469,0,''),
(11203,14,67,0,''),
(11204,14,67,0,''),
(11205,14,67,0,''),
(11206,14,67,0,''),
(11207,14,67,0,'');

-- Achievement: Turkey Lurkey
DELETE FROM `achievement_criteria_data` WHERE `type`= 2 AND `criteria_id` IN (11163,11164,11165,11158,11159,11160,11161,11162);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
('11163', '2', '4', '10', ''), -- Blood Elf Rogue
('11164', '2', '4', '3', ''),  -- Dwarf Rogue
('11165', '2', '4', '7', ''),  -- Gnome Rogue
('11158', '2', '4', '1', ''),  -- Human Rogue
('11159', '2', '4', '4', ''),  -- Night Elf Rogue
('11160', '2', '4', '2', ''),  -- Orc Rogue
('11161', '2', '4', '8', ''),  -- Troll Rogue
('11162', '2', '4', '5', '');  -- Undead Rogue

-- Temp vehicle fix
UPDATE `creature_template` SET `VehicleId` = '321' WHERE `entry` IN (34823,34812,34824,34822,34819); -- Temp Fix (not blizz)

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34823,34812,34824,34822,34819);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
('34823', '65403', '0', '0', '0', '1', '0', '0', '0'), -- The Cranberry Chair
('34812', '65403', '0', '0', '0', '1', '0', '0', '0'), -- The Turkey Chair
('34824', '65403', '0', '0', '0', '1', '0', '0', '0'), -- The Sweet Potato Chair
('34822', '65403', '0', '0', '0', '1', '0', '0', '0'), -- The Pie Chair
('34819', '65403', '0', '0', '0', '1', '0', '0', '0'), -- The Stuffing Chair
('34823', '65403', '0', '0', '0', '3', '0', '0', '0'), -- The Cranberry Chair
('34812', '65403', '0', '0', '0', '3', '0', '0', '0'), -- The Turkey Chair
('34824', '65403', '0', '0', '0', '3', '0', '0', '0'), -- The Sweet Potato Chair
('34822', '65403', '0', '0', '0', '3', '0', '0', '0'), -- The Pie Chair
('34819', '65403', '0', '0', '0', '3', '0', '0', '0'); -- The Stuffing Chair
-- Fix a few buycounts
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=44853; -- Honey
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=44835; -- Autumnal Herbs
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=44854; -- Tangy Wetland Cranberries
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=44855; -- Teldrassil Sweet Potato
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=46797; -- Mulgore Sweet Potato
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=46793; -- Tangy Southfury Cranberries
UPDATE `item_template` SET `BuyCount`=5 WHERE `entry`=46796; -- Ripe Trisfal Pumpkin

-- Auras for chairs
DELETE FROM `creature_template_addon` WHERE `entry` IN (34823,34812,34824,34822,34819);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('34823', '0', '0', '0', '1', '0', '61793 61798'), -- The Cranberry Chair / (Cranberry Server | Can Eat - Cranberries)
('34812', '0', '0', '0', '1', '0', '61796 61801'), -- The Turkey Chair / (Turkey Server | Can Eat - Turkey)
('34824', '0', '0', '0', '1', '0', '61797 61802'), -- The Sweet Potato Chair / (Sweet Potatoes Server | Can Eat - Sweet Potatoes)
('34822', '0', '0', '0', '1', '0', '61794 61799'), -- The Pie Chair / (Pie Server | Can Eat - Pie)
('34819', '0', '0', '0', '1', '0', '61795 61800'); -- The Stuffing Chair / (Stuffing Server | Can Eat - Stuffing)

-- Pilgrims Bount: Chair
UPDATE creature_template SET spell1=66261, spell2=61784, spell3=61785, spell4=61788, spell5=61786, spell6=61787 WHERE entry=34823; -- The Cranberry Chair
UPDATE creature_template SET spell1=66250, spell2=61784, spell3=61785, spell4=61788, spell5=61786, spell6=61787 WHERE entry=34812; -- The Turkey Chair
UPDATE creature_template SET spell1=66259, spell2=61784, spell3=61785, spell4=61788, spell5=61786, spell6=61787 WHERE entry=34819; -- The Stuffing Chair
UPDATE creature_template SET spell1=66260, spell2=61784, spell3=61785, spell4=61788, spell5=61786, spell6=61787 WHERE entry=34822; -- The Pie Chair
UPDATE creature_template SET spell1=66262, spell2=61784, spell3=61785, spell4=61788, spell5=61786, spell6=61787 WHERE entry=34824; -- The Sweet Potato Chair

-- Achievement: The Turkinator (wild turkey)
UPDATE creature_template SET AIName='', ScriptName='npc_wild_turkey' WHERE entry=32820;
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_turkey_tracker';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62014, 'spell_gen_turkey_tracker');

-- Item: Turkey Caller
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `ScriptName` = 'npc_lonely_turkey' WHERE `entry` =32956;

-- Feast On Spells
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_feast_on';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(61784, 'spell_gen_feast_on'), -- Feast On Turkey
(61785, 'spell_gen_feast_on'), -- Feast On Cranberries
(61786, 'spell_gen_feast_on'), -- Feast On Sweet Potatoes
(61787, 'spell_gen_feast_on'), -- Feast On Pie
(61788, 'spell_gen_feast_on'); -- Feast On Stuffing

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_well_fed_pilgrims_bount_ap',
'spell_gen_well_fed_pilgrims_bount_zm',
'spell_gen_well_fed_pilgrims_bount_hit',
'spell_gen_well_fed_pilgrims_bount_haste',
'spell_gen_well_fed_pilgrims_bount_spirit'
);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(61807, 'spell_gen_well_fed_pilgrims_bount_ap'),     -- A Serving of Turkey
(61804, 'spell_gen_well_fed_pilgrims_bount_zm'),     -- A Serving of Cranberries
(61806, 'spell_gen_well_fed_pilgrims_bount_hit'),    -- A Serving of Stuffing
(61808, 'spell_gen_well_fed_pilgrims_bount_haste'),  -- A Serving of Sweet Potatoes
(61805, 'spell_gen_well_fed_pilgrims_bount_spirit'); -- A Serving of Pie

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_on_plate_pilgrims_bount_turkey',
'spell_gen_on_plate_pilgrims_bount_cranberries',
'spell_gen_on_plate_pilgrims_bount_stuffing',
'spell_gen_on_plate_pilgrims_bount_sweet_potatoes',
'spell_gen_on_plate_pilgrims_bount_pie'
);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(66250, 'spell_gen_on_plate_pilgrims_bount_turkey'),            -- Pass The Turkey
(66261, 'spell_gen_on_plate_pilgrims_bount_cranberries'),       -- Pass The Cranberries
(66259, 'spell_gen_on_plate_pilgrims_bount_stuffing'),          -- Pass The Stuffing
(66262, 'spell_gen_on_plate_pilgrims_bount_sweet_potatoes'),    -- Pass The Sweet Potatoes
(66260, 'spell_gen_on_plate_pilgrims_bount_pie');               -- Pass The Pie

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_bountiful_feast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(66477, 'spell_gen_bountiful_feast'); -- Bountiful Feast

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_slow_roasted_turkey',
'spell_gen_cranberry_chutney',
'spell_gen_spice_bread_stuffing',
'spell_gen_pumpkin_pie',
'spell_gen_candied_sweet_potato'
);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(65422, 'spell_gen_slow_roasted_turkey'),   -- Slow-Roasted Turkey
(65420, 'spell_gen_cranberry_chutney'),     -- Cranberry Chutney
(65419, 'spell_gen_spice_bread_stuffing'),  -- Spice Bread Stuffing
(65421, 'spell_gen_pumpkin_pie'),           -- Pumpkin Pie
(65418, 'spell_gen_candied_sweet_potato');  -- Candied Sweet Potato

-- Achievement: Pilgrim's Peril
DELETE FROM `achievement_criteria_data` WHERE `type`= 16 AND `criteria_id` IN (11134,11135,11136,11137,11138,11139,11140,11141);
DELETE FROM `achievement_criteria_data` WHERE `type`= 6 AND `criteria_id` IN (11134,11135,11136,11137,11138,11139,11140,11141);
DELETE FROM `achievement_criteria_data` WHERE `type`= 5 AND `criteria_id` IN (11134,11135,11136,11137,11138,11139,11140,11141);
DELETE FROM `achievement_criteria_data` WHERE `type`= 14 AND `criteria_id` IN (11134,11135,11136,11137,11138,11139,11140,11141);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES
-- Alliance
('11134', '16', '404', '0'), -- Orgrimmar
('11134', '6', '14', '0'), -- Orgrimmar
('11134', '5', '66303', '0'), -- Orgrimmar
('11135', '16', '404', '0'), -- Silvermoon City
('11135', '6', '3470', '0'), -- Silvermoon City
('11135', '5', '66303', '0'), -- Silvermoon City
('11136', '16', '404', '0'), -- Thunder Bluff
('11136', '6', '1638', '0'), -- Thunder Bluff
('11136', '5', '66303', '0'), -- Thunder Bluff
('11137', '16', '404', '0'), -- Undercity
('11137', '6', '1497', '0'), -- Undercity
('11137', '5', '66303', '0'), -- Undercity
-- Horde
('11138', '16', '404', '0'), -- Exodar
('11138', '6', '3557', '0'), -- Exodar
('11138', '5', '66303', '0'), -- Exodar
('11139', '16', '404', '0'), -- Darnassus
('11139', '6', '1657', '0'), -- Darnassus
('11139', '5', '66303', '0'), -- Darnassus
('11140', '16', '404', '0'), -- Ironforge
('11140', '6', '809', '0'), -- Ironforge
('11140', '5', '66303', '0'), -- Ironforge
('11141', '16', '404', '0'), -- Stormwind
('11141', '6', '12', '0'), -- Stormwind
('11141', '5', '66303', '0'); -- Stormwind

-- Achievement: Now We're Cookin'
DELETE FROM `achievement_criteria_data` WHERE `type`= 14 AND `criteria_id` IN (11118, 11119, 11120, 11121, 11122, 11123, 11124, 11125, 11126, 11127);
DELETE FROM `achievement_criteria_data` WHERE `type`= 16 AND `criteria_id` IN (11118, 11119, 11120, 11121, 11122, 11123, 11124, 11125, 11126, 11127);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES
-- Alliance
('11118','16','404','0'), -- Now We're Cookin' / Cranberry Chutney
('11119','16','404','0'), -- Now We're Cookin' / Candied Sweet Potato
('11120','16','404','0'), -- Now We're Cookin' / Pumpkin Pie
('11121','16','404','0'), -- Now We're Cookin' / Slow-Roasted Turkey
('11122','16','404','0'), -- Now We're Cookin' / Spice Bread Stuffing
-- Horde
('11123','16','404','0'), -- Now We're Cookin' / Candied Sweet Potato
('11124','16','404','0'), -- Now We're Cookin' / Cranberry Chutney
('11125','16','404','0'), -- Now We're Cookin' / Pumpkin Pie
('11126','16','404','0'), -- Now We're Cookin' / Slow-Roasted Turkey
('11127','16','404','0'); -- Now We're Cookin' / Spice Bread Stuffing

-- Achievement: Terokkar Turkey Time
DELETE FROM `achievement_criteria_data` WHERE `type` = 5 AND `criteria_id` = 11142;
DELETE FROM `achievement_criteria_data` WHERE `type` = 16 AND `criteria_id` = 11142;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES
(11142, 5, 66303, 0), -- Pilgrim Costume
(11142, 16, 404, 0);

-- Achievement: Pilgrim's Paunch
DELETE FROM `achievement_criteria_data` WHERE `type` = 6 AND `criteria_id` IN (11078,11079,11080,11081,11082,11083,11084,11085);
DELETE FROM `achievement_criteria_data` WHERE `type` = 16 AND `criteria_id` IN (11078,11079,11080,11081,11082,11083,11084,11085);
DELETE FROM `achievement_criteria_data` WHERE `type` = 14 AND `criteria_id` IN (11078,11079,11080,11081,11082,11083,11084,11085);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES
-- Alliance
(11078, 6, 1657, 0),  -- Darnassus
(11078, 16, 404, 0),  -- Darnassus
(11079, 6, 809, 0),   -- Ironforge
(11079, 16, 404, 0),  -- Ironforge
(11080, 6, 3557, 0),  -- Exodar
(11080, 16, 404, 0),  -- Exodar
(11081, 6, 12, 0),    -- Stormwind
(11081, 16, 404, 0),  -- Stormwind
-- Horde
(11082, 6, 14, 0),    -- Orgrimmar
(11082, 16, 404, 0),  -- Orgrimmar
(11083, 6, 3470, 0),  -- Silvermoon City
(11083, 16, 404, 0),  -- Silvermoon City
(11084, 6, 1638, 0),  -- Thunder Bluff
(11084, 16, 404, 0),  -- Thunder Bluff
(11085, 6, 1497, 0),  -- Undercity
(11085, 16, 404, 0);  -- Undercity

-- Achievement: "FOOD FIGHT!"
DELETE FROM `achievement_criteria_data` WHERE `type` = 11 AND `criteria_id` IN (11168,11178,11179,11180,11181);
DELETE FROM `achievement_criteria_data` WHERE `type` = 16 AND `criteria_id` IN (11168,11178,11179,11180,11181);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(11168, 11, 0, 0, 'achievement_food_fight'),
(11168, 16, 404, 0, ''),
(11178, 11, 0, 0, 'achievement_food_fight'),
(11178, 16, 404, 0, ''),
(11179, 11, 0, 0, 'achievement_food_fight'),
(11179, 16, 404, 0, ''),
(11180, 11, 0, 0, 'achievement_food_fight'),
(11180, 16, 404, 0, ''),
(11181, 11, 0, 0, 'achievement_food_fight'),
(11181, 16, 404, 0, '');

-- Achievement: Sharing is Caring
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11086,11088,11089,11090,11167);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES
(11086, 16, 404, 0),
(11088, 16, 404, 0),
(11089, 16, 404, 0),
(11090, 16, 404, 0),
(11167, 16, 404, 0);

-- Temp Hack Fixes
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (32823,32830,32840);
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (32823,32830,32840);

UPDATE `creature_template` SET `modelid2` = '0' WHERE `entry` IN (34823,34812,34824,34822,34819);