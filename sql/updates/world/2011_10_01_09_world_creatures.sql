-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=0x8040,`speed_walk`=1,`speed_run`=2.85714,`InhabitType`=`InhabitType`|4 WHERE `entry`=32358; -- Fumblub Gearwind
UPDATE `creature_template` SET `faction_A`=1885,`faction_H`=1885,`unit_flags`=0x8040,`speed_run`=1.28571 WHERE `entry`=32438; -- Syreian the Bonecarver

-- Le cambio EventAI como en TDB
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=32438;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(3243801,32438,1,0,100,0,0,0,0,0,21,0,0,0,20,0,0,0,0,0,0,0,'Syreian the Bonecarver - Prevent Combat Movement and Prevent Melee on Spawn');
(3243802,32438,4,0,100,0,0,0,0,0,11,38952,1,0,23,1,0,0,0,0,0,0,'Syreian the Bonecarver - Cast Frost Arrow and Set Phase 1 on Aggro');
(3243803,32438,9,5,100,1,5,30,2300,3900,11,50092,1,0,40,2,0,0,0,0,0,0,'Syreian the Bonecarver - Cast Shoot and Set Ranged Weapon Model (Phase 1)');
(3243804,32438,0,5,100,1,12000,15000,11000,14000,11,38952,1,1,40,2,0,0,0,0,0,0,'Syreian the Bonecarver - Cast Frost Arrow and Set Ranged Weapon Model (Phase 1)');
(3243805,32438,9,5,100,1,25,80,0,0,21,1,1,0,20,1,0,0,0,0,0,0,'Syreian the Bonecarver - Start Combat Movement and Start Melee at 25 Yards (Phase 1)');
(3243806,32438,9,5,100,1,0,5,0,0,21,1,0,0,40,1,0,0,20,1,0,0,'Syreian the Bonecarver - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 5 Yards (Phase 1)');
(3243807,32438,9,5,100,1,5,15,0,0,21,0,1,0,20,0,0,0,0,0,0,0,'Syreian the Bonecarver - Prevent Combat Movement and Prevent Melee at 15 Yards (Phase 1)');
(3243808,32438,9,0,100,1,0,5,12000,16000,11,47168,1,1,0,0,0,0,0,0,0,0,'Syreian the Bonecarver - Cast Improved Wing Clip');
(3243809,32438,2,0,100,0,15,0,0,0,23,1,0,0,0,0,0,0,0,0,0,0,'Syreian the Bonecarver - Set Phase 2 at 15% HP');
(3243810,32438,2,3,100,0,15,0,0,0,21,1,0,0,25,0,0,0,1,-47,0,0,'Syreian the Bonecarver - Start Combat Movement and Flee at 15% HP (Phase 2)');
(3243811,32438,7,0,100,0,0,0,0,0,22,0,0,0,40,1,0,0,0,0,0,0,'Syreian the Bonecarver - Set Phase to 0 and Set Melee Weapon Model on Evade');

UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=3.919432,`gender`=1 WHERE `modelid`=27970; -- Syreian the Bonecarver

-- Le pongo spawntimesecs como en TDB
UPDATE `creature` SET `spawntimesecs`=28800 WHERE `id`=32438; -- Syreian the Bonecarver
-- Spawn de TDB (Guid YTDB)
DELETE FROM `creature` WHERE `id`=32358;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(63245,32358,571,1,1,0,781,4107.78,4981.3,4.60112,0.814532,28800,0,0,13936,0,2,0,0,0); -- Fumblub Gearwind
-- Waypoints de TDB (Id YTDB)
DELETE FROM `waypoint_data` WHERE `id`=632450;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(632450,1,3996.67,5027.57,4.60112,0,0,0,100,0),
(632450,2,3908.4,5132.65,18.6567,0,0,0,100,0),
(632450,3,3762.46,5061.48,18.6567,0,0,0,100,0),
(632450,4,3706.78,4998.38,18.6567,0,0,0,100,0),
(632450,5,3626.85,4981.31,18.6567,0,0,0,100,0),
(632450,6,3553.99,4971.02,18.6567,0,0,0,100,0),
(632450,7,3562.81,4855.88,18.6567,0,0,0,100,0),
(632450,8,3482.35,4704.92,8.01779,0,0,0,100,0),
(632450,9,3476.72,4495.35,7.07335,0,0,0,100,0),
(632450,10,3651.38,4535.77,7.07335,0,0,0,100,0),
(632450,11,3797.04,4659.16,4.21224,0,0,0,100,0),
(632450,12,3959.97,4664.09,5.49002,0,0,0,100,0),
(632450,13,4051,4706.12,13.5178,0,0,0,100,0),
(632450,14,4141.19,4783.23,13.99,0,0,0,100,0),
(632450,15,4250.02,4783.8,13.8789,0,0,0,100,0),
(632450,16,4252.55,4879.61,7.90668,0,0,0,100,0),
(632450,17,4107.78,4981.3,4.60112,0,0,0,100,0);
-- creature_addon de TDB (Guid YTDB)
DELETE FROM `creature_addon` WHERE `guid`=63245;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(63245,632450,25587,50331648,1,0,NULL); -- Fumblub Gearwind

DELETE FROM `creature_template_addon` WHERE `entry` IN (32358,32438);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(32358,25587,0x3000000,1,0, NULL), -- Fumblub Gearwind
(32438,0,0,2,0, NULL); -- Syreian the Bonecarver
