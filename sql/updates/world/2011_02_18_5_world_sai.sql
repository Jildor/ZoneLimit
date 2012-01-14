-- Editado por Gildor
-- Bonesunder SAI (Converted from EAI)
-- Le quito creature_template_addon
DELETE FROM `creature_template_addon` WHERE `entry` = 27006;
-- Le pongo la faction como en TDB
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `AIName`= 'SmartAI' WHERE `entry`=27006;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27006;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=27006;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27006,0,0,0,0,0,100,0,5000,11000,16000,25000,11,52080,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bonesunder - Cast Bonecrack');

-- Surge Needle Sorcerer SAI
-- Guid de ZLDB
SET @ELMGUID := 113858;
-- Spawn de TDB (Guids ZLDB)
DELETE FROM `creature` WHERE `id` = 26257;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(51242,26257,571,1,1,23721,0,3322.13,2609.24,37.5503,1.65806,300,0,0,7432,7332,0,0,0,0),
(57385,26257,571,1,1,23770,0,3324.68,2537.89,40.4411,5.20108,300,0,0,7432,7332,0,0,0,0),
(78146,26257,571,1,1,23722,0,3290.65,2518.34,59.5392,6.03884,300,0,0,7432,7332,0,0,0,0),
(78147,26257,571,1,1,23722,0,3295.46,2504.29,56.9822,6.24828,300,0,0,7432,7332,0,0,0,0),
(78148,26257,571,1,1,23721,0,3304.17,2543.02,41.3184,5.46288,300,0,0,7432,7332,0,0,0,0),
(78149,26257,571,1,1,23722,0,3261.88,2538.55,50.321,5.86431,300,0,0,7432,7332,0,0,0,0),
(78150,26257,571,1,1,23771,0,3285.09,2466.45,48.5058,0.471239,300,0,0,7432,7332,0,0,0,0),
(86615,26257,571,1,1,23722,0,3280.52,2548.3,52.1968,5.63741,300,0,0,7432,7332,0,0,0,0),
(93640,26257,571,1,1,23721,0,3341.94,2436.71,53.9141,1.43117,300,0,0,7432,7332,0,0,0,0),
(93641,26257,571,1,1,23721,0,3325.81,2435.94,40.7376,1.13446,300,0,0,7432,7332,0,0,0,0),
(93642,26257,571,1,1,23721,0,3318.34,2471.86,45.7918,0.802851,300,0,0,7432,7332,0,0,0,0),
(94942,26257,571,1,1,23771,0,3391.22,2497.86,60.9218,3.19395,300,0,0,7432,7332,0,0,0,0),
(94943,26257,571,1,1,23771,0,3354.67,2510.28,197.4,2.68781,300,0,0,7432,7332,0,0,0,0),
(94944,26257,571,1,1,23771,0,3327.48,2548.77,197.4,5.06145,300,0,0,7432,7332,0,0,0,0),
(94945,26257,571,1,1,23771,0,3349.14,2486.75,197.4,1.91986,300,0,0,7432,7332,0,0,0,0),
(94946,26257,571,1,1,23771,0,3330.53,2501.8,197.4,1.13446,300,0,0,7432,7332,0,0,0,0),
(94947,26257,571,1,1,23721,0,3322.05,2525.92,197.4,5.84685,300,0,0,7432,7332,0,0,0,0),
(97988,26257,571,1,1,23770,0,3376.93,2449.38,59.018,2.11185,300,0,0,7432,7332,0,0,0,0);
-- Borro waypoints
DELETE FROM `creature_addon` WHERE `guid` IN (51242,57385,78146,78147,78148,78149,78150,86615,97988,93640,93641,93642);
DELETE FROM `waypoint_data` WHERE `id` IN (51242,57385,78146,78147,78148,78149,78150,86615,97988,93640,93641,93642);
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=26257;
-- Borro EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26257;
-- Guids anteriores
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26257,-57385,-78146,-78147,-78148,-78149,-78150,-86615,-93640,-93641,-93642,-94942,-97988);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26257,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-57385,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-57385,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-57385,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-78146,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-78146,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-78146,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-78147,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-78147,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-78147,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-78148,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-78148,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-78148,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-78149,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-78149,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-78149,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-78150,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-78150,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-78150,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-86615,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-86615,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-86615,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-93640,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-93640,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-93640,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-93641,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-93641,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-93641,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-93642,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-93642,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-93642,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-94942,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-94942,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-94942,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim'),
(-97988,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(-97988,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(-97988,0,2,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast on victim');

-- Goramosh SAI
-- Guid de ZLDB
SET @ELMGUID := 113858;
-- Le pongo la faction como en TDB
UPDATE `creature_template` SET `faction_A` = 1985, `faction_H` = 1985, `AIName`= 'SmartAI' WHERE `entry`=26349;
-- Le quito creature_template_addon y EventAI
DELETE FROM `creature_template_addon` WHERE `entry` = 26349;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26349;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26349);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26349,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when spawned'),
(26349,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0,'Cast Surge Needle Beam when reach home'),
(26349,0,2,0,2,0,100,1,0,50,0,0,11,20828,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cone of Cold on victim at 50% health'),
(26349,0,3,0,0,0,100,0,3500,3500,3500,3500,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frost Bolt on victim');

-- Arcanimus SAI
-- Guid de ZLDB
SET @ELMGUID := 113858;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=26370;
-- Le quito EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26370;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26370);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26370,0,0,0,1,0,100,1,2000,2000,2000,2000,45,0,1,0,0,0,0,10,@ELMGUID,26298,0,0,0,0,0, 'Set data 0 = 1 on bunny 2 sec after reset'),
(26370,0,1,0,1,0,100,1,0,0,0,0,11,46934,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - Add Cosmetic - Arcane Force Shield (Blue x2) Aura on spawn & reset'),
(26370,0,2,3,4,0,100,0,0,0,0,0,28,46934,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - Remove Cosmetic - Arcane Force Shield (Blue x2) Aura on aggro'),
(26370,0,3,0,61,0,100,0,0,0,0,0,28,46906,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - Remove Cosmetic - Surge Needle Beam on aggro'),
(26370,0,4,0,2,0,100,1,71,80,0,0,11,51820,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - at 80% health cast Arcane Explosion on self'),
(26370,0,5,0,2,0,100,1,41,60,0,0,11,51820,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - at 60% health cast Arcane Explosion on self'),
(26370,0,6,0,2,0,100,1,21,40,0,0,11,51820,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - at 40% health cast Arcane Explosion on self'),
(26370,0,7,0,2,0,100,1,1,20,0,0,11,51820,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arcanimus - at 20% health cast Arcane Explosion on self');

-- ELM General Purpose Bunny (scale x0.01) Large SAI
-- Le pongo unit_flags como en TDB
UPDATE `creature_template` SET `unit_flags` = 33555200, `AIName`= 'SmartAI' WHERE `entry`=26298;
-- Guid de ZLDB
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-113858);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-113858,0,0,0,11,0,100,0,0,0,0,0,11,32566,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Purple Banish State aura on self when spawned'),
(-113858,0,1,2,38,0,100,0,0,1,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'reset data 0 = 0'),
(-113858,0,2,0,61,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,116668,26370,0,0,0,0,0, 'cast Surge Needle Beam on Arcanimus');
