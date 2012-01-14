-- Editado por Gildor
-- Cult Plaguebringer <Cult of the Damned> SAI (tested)
-- Le pongo la faccion como en TDB
UPDATE `creature_template` SET `AIName`= 'SmartAI', `faction_A` = 21, `faction_H` = 21 WHERE `entry`=24957;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=24957;
DELETE FROM `smart_scripts` WHERE `entryorguid`=24957;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24957,0,0,0,1,0,100,0,1000,900000,500000,700000,11,45850,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ghoul Summons OOC'),
(24957,0,2,0,0,0,30,0,1100,6300,8800,13800,11,50356,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Inject Plague on victim');

-- Cultist Necrolyte SAI (tested) 
-- Le pongo la faccion como en TDB y le borro EventAI
UPDATE `creature_template` SET `AIName`= 'SmartAI', `faction_A` = 1975, `faction_H` = 1975 WHERE `entry`=25651;
-- Le quito creature_template_addon
DELETE FROM `creature_template_addon` WHERE `entry` = 25651;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25651;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25651);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25651,0,0,0,11,0,100,0,0,0,0,0,11,45104,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Channelling on self when spawned'),
(25651,0,1,0,21,0,100,0,0,0,0,0,11,45104,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Channelling on self when reach home home'),
(25651,0,2,0,0,0,30,0,1000,2000,6000,8000,11,18266,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Agony on victim'),
(25651,0,3,0,0,0,70,0,3000,4000,3000,4000,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt on victim');

-- Azure Front Channel Stalker SAI (tested working)
-- Le pongo las flags, InhabitType igual que en TDB
UPDATE `creature_template` SET `AIName`= 'SmartAI', `unit_flags` = 33555200, InhabitType = 4, `flags_extra` = 0 WHERE `entry`=31400;
-- Le quito creature_template_addon
DELETE FROM `creature_template_addon` WHERE `entry` = 31400;
-- Pongo los spawns como en TDB con Guids de ZLDB
DELETE FROM `creature` WHERE `id` = 31400;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(112482,31400,571,1,1,0,0,5314.68,749.915,222.2,0.191986,120,0,0,1,0,0,0,0,0),
(113967,31400,571,1,1,17612,0,5339.22,567.641,235.586,1.51844,300,0,0,42,0,0,0,0,0),
(112479,31400,571,1,1,17612,0,5322.5,726.12,292.577,4.2237,300,0,0,42,0,0,0,0,0),
(112480,31400,571,1,1,17612,0,5413.37,632.472,263.969,5.60251,300,0,0,42,0,0,0,0,0),
(112478,31400,571,1,1,0,0,5450.95,814.425,261.762,2.35619,120,0,0,1,0,0,0,0,0);
-- Le pongo creature_addon como en TDB, Guids de ZLDB
DELETE FROM `creature_addon` WHERE `guid` IN (112478,112479,112480,112482,113967);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(113967,0,0,0,1,0,59055),
(112479,0,0,0,1,0,59055),
(112480,0,0,0,1,0,59055),
(112478,0,0,0,1,0,59055),
(112482,0,0,0,1,0,59055);
-- Guids de ZLDB
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-112478,-112480,-113967,-112479);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-112478,0,0,0,1,0,100,1,1000,1000,1000,1000,11,59044,2,0,0,0,0,10,112480,31400,0,0,0,0,0,'Cast Cosmetic - Crystalsong Tree Beam when spawned'),
(-112480,0,0,0,1,0,100,1,1000,1000,1000,1000,11,59044,2,0,0,0,0,10,113967,31400,0,0,0,0,0,'Cast Cosmetic - Crystalsong Tree Beam when spawned'),
(-113967,0,0,0,1,0,100,1,1000,1000,1000,1000,11,59044,2,0,0,0,0,10,112479,31400,0,0,0,0,0,'Cast Cosmetic - Crystalsong Tree Beam when spawned'),
(-112479,0,0,0,1,0,100,1,1000,1000,1000,1000,11,59044,2,0,0,0,0,10,112482,31400,0,0,0,0,0,'Cast Cosmetic - Crystalsong Tree Beam when spawned');

-- Wildhammer Scout SAI (tested)
-- Removes waypoint script error spamming at Wildhammer Stronghold
-- Le cambio faccion y flags como en TDB
UPDATE `creature_template` SET `AIName`= 'SmartAI', `faction_A` = 1732, `faction_H` = 1732, `unit_flags` = 32768, `flags_extra` = 2 WHERE `entry`=19384;
-- Le borro EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=19384;
-- Le pongo los SAI con en YTDB (mismas Guids)
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-74091,-74066,-74065,-74063,-74059,-74057,-74055,-74038,-74037,-74031,-74030);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-74091,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74066,0,0,0,1,0,100,0,3000,5000,3000,5000,11,33805,2,0,0,0,0,9,19387,0,25,0,0,0,0,'Cast Throw Hammer every 3-5 sec'),
(-74065,0,0,0,1,0,100,0,3000,5000,3000,5000,11,33806,2,0,0,0,0,9,19388,0,25,0,0,0,0,'Cast Throw Hammer every 3-5 sec'),
(-74063,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74059,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74057,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74055,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74038,0,0,0,1,0,100,0,3000,5000,3000,5000,11,33806,2,0,0,0,0,9,19388,0,25,0,0,0,0,'Cast Throw Hammer every 3-5 sec'),
(-74037,0,0,0,1,0,100,0,3000,5000,3000,5000,11,33805,2,0,0,0,0,9,19388,0,25,0,0,0,0,'Cast Throw Hammer every 3-5 sec'),
(-74031,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec'),
(-74030,0,0,0,1,0,100,0,1000,2000,3000,6000,11,33808,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shoot Gun every 3-6 sec');
-- Wildhammer Stronghold Target Dummy Left & Wildhammer Stronghold Target Dummy Right are Triggers
-- Le pongo las flags igual que en TDB
UPDATE `creature_template` SET `InhabitType`=7, `unit_flags` = 33554688, `flags_extra` = 130 WHERE `entry` IN (19387,19388);

-- Speech by Marrod Silvertongue, Fort Wildervar (Tested working)
SET @ENTRY := 24534;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
-- Le borro EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,30000,50000,360000,360000,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Load script every 6 min ooc'),
(@ENTRY*100,9,0,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 0'),
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,0,0,5,21,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,2,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 1'),
(@ENTRY*100,9,3,0,0,0,100,0,2000,2000,0,0,5,21,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,4,0,0,0,100,0,8000,8000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 2'),
(@ENTRY*100,9,5,0,0,0,100,0,2000,2000,0,0,5,21,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,6,0,0,0,100,0,8000,8000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 3'),
(@ENTRY*100,9,7,0,0,0,100,0,2000,2000,0,0,5,21,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,8,0,0,0,100,0,8000,8000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 4'),
(@ENTRY*100,9,9,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,10,0,0,0,100,0,8000,8000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 5'),
(@ENTRY*100,9,11,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,12,0,0,0,100,0,8000,8000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marrod Silvertongue Say text 6'),
(@ENTRY*100,9,13,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote'),
(@ENTRY*100,9,14,0,0,0,100,0,3000,3000,0,0,5,4,0,0,0,0,0,9,24535,0,20,0,0,0,0,'Northrend Homesteader emote');
-- NPC talk text insert from sniff
-- Le borro EventAI texts
DELETE FROM  creature_ai_texts WHERE `entry`=-160053;
DELETE FROM `creature_text` WHERE `entry` IN (24534);
-- Los actualizo (type)
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(24534,0,0, 'Welcome to Fort Wildervar, brave homesteaders! There''s a whole continent out there just waiting to be claimed!',12,7,100,1,0,0, 'Marrod Silvertongue'),
(24534,1,0, 'True, Northrend is a hard land, but our people are strong, hardy, and equal to the task!',12,7,100,0,0,0, 'Marrod Silvertongue'),
(24534,2,0, 'We will win this land with the sword, and break it with the plow! You are the men and women who will be remembered for taming the wild continent!',12,7,100,1,0,0, 'Marrod Silvertongue'),
(24534,3,0, 'But, you will not be alone out there. My men and I have prepared pack mules carrying the supplies you''ll need most.',12,7,100,1,0,0, 'Marrod Silvertongue'),
(24534,4,0, 'Axes, picks, seed, nails, food, blankets, water... it''s all there, waiting for you. I think you''ll find my prices quite reasonable, too.',12,7,100,25,0,0, 'Marrod Silvertongue'),
(24534,5,0, 'There are more than enough to go around. Should you need other goods, don''t hesitate to ask!',12,7,100,1,0,0, 'Marrod Silvertongue'),
(24534,6,0, 'Now, my loyal custo... err, friends, go forth and conquer this land for our people!',12,7,100,274,0,0, 'Marrod Silvertongue');
