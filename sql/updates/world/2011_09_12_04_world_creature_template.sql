-- Editado por Gildor
-- Template updates
-- Los pongo como en TDB
UPDATE `creature_template` SET `unit_flags`=570703872,`dynamicflags`=`dynamicflags`&~8 WHERE `entry`=33059; -- Wrecked Demolisher
UPDATE `creature_template` SET `exp`=0,`npcflag`=6273 WHERE `entry`=33666; -- Demolisher Engineer Blastwrench
UPDATE `creature_template` SET `unit_flags`=570703872,`dynamicflags`=`dynamicflags`&~8 WHERE `entry`=33063; -- Wrecked Siege Engine
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`RegenHealth`=1,`mechanic_immune_mask`=344276858 WHERE `entry`=33067; -- Salvaged Siege Turret
UPDATE `creature_template` SET `VehicleId`=387,`mingold`=0,`maxgold`=0,`AIName`='',`mechanic_immune_mask`=12584976 WHERE `entry` IN (33113,34003); -- Flame Leviathan
UPDATE `creature_template` SET `exp`=0,`flags_extra`=0 WHERE `entry`=33143; -- Overload Control Device
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|16777216,`speed_walk`=1.2,`unit_flags`=33571584 WHERE `entry` IN (33139,34111); -- Flame Leviathan Turret
UPDATE `creature_template` SET `unit_flags`=33554432,`dynamicflags`=`dynamicflags`|12 WHERE `entry`=33216; -- Mechagnome Pilot
UPDATE `creature_template` SET `faction_A`=1965,`faction_H`=1965,`dynamicflags`=`dynamicflags`|12 WHERE `entry` IN (33572,34247); -- Steelforged Defender
UPDATE `creature_template` SET `speed_walk`=1.6,`unit_flags`=`unit_flags`|33280,`mingold`=0,`maxgold`=0,`mechanic_immune_mask`=617299803 WHERE `entry` IN (33186,33724); -- Razorscale
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2.14286,`RegenHealth`=1 WHERE `entry`=34120; -- Brann's Flying Machine
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`speed_walk`=1.6,`speed_run`=1.42857,`unit_flags`=0,`mingold`=0,`maxgold`=0,`AIName`='',`flags_extra`=1 WHERE `entry` IN (33118,33190); -- Ignis the Furnace Master
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`speed_walk`=1,`unit_flags`=33554688,`flags_extra`=2 WHERE `entry` IN (33121,33191); -- Iron Construct
UPDATE `creature_template` SET `RegenHealth`=1,`flags_extra`=0 WHERE `entry`=33114; -- Flame Leviathan Seat
UPDATE `creature_template` SET `unit_flags`=33554432,`AIName`='' WHERE `entry`=33142; -- Leviathan Defense Turret
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=33189; -- Liquid Pyrite
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80 WHERE `entry`=33090; -- Pool of Tar
UPDATE `creature_template` SET `faction_A`=2105,`faction_H`=2105,`unit_flags`=33280,`flags_extra`=0 WHERE `entry` IN (33816,34255); -- Expedition Defender
UPDATE `creature_template` SET `faction_A`=2105,`faction_H`=2105 WHERE `entry` IN (33287,34256); -- Expedition Engineer
UPDATE `creature_template` SET `faction_A`=2105,`faction_H`=2105,`unit_flags`=33280 WHERE `entry` IN (33259,34257); -- Expedition Trapper
UPDATE `creature_template` SET `unit_flags`=33555200,`AIName`='SmartAI',`InhabitType`=7,`flags_extra`=130 WHERE `entry`=23033; -- Invisible Stalker (Floating)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (34086,34201); -- Magma Rager
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (34085,34186); -- Forge Construct

-- EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33113; -- Flame Leviathan
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33118; -- Ignis the Furnace Master
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33142; -- Leviathan Defense Turret

-- Spawns
-- Pongo el spawn del Leviathan como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33113;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(94374,33113,603,3,1,0,0,420.728,-15.3721,409.804,3.05873,604800,0,0,23009250,0,0,0,0,0);
-- Pongo el spawn de Ignis como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33118;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(94372,33118,603,3,1,29185,0,586.542,378.798,360.923,4.7822,604800,0,0,5578000,0,0,0,0,0);
-- Pongo el spawn de Expedition Commander como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33210;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129948,33210,603,3,1,29030,0,585.667,-104.448,391.6,1.51844,604800,0,0,390990,0,0,0,0,0);
-- Pongo el spawn de Expedition Engineer como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33287;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129784,33287,603,3,1,29035,0,592.503,-98.552,391.6,5.74213,604800,0,0,315000,119820,0,0,0,0),
(129783,33287,603,3,1,29034,0,589.533,-95.3228,391.6,5.51524,604800,0,0,315000,119820,0,0,0,0),
(129949,33287,603,3,1,29035,0,594.302,-94.3818,391.6,4.81711,604800,0,0,315000,119820,0,0,0,0);
-- Pongo el spawn de Expedition Trapper como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33259;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129947,33259,603,3,1,29037,0,578.177,-107.629,391.6,4.85202,604800,0,0,315000,0,0,0,0,0),
(129946,33259,603,3,1,29036,0,588.254,-108.715,391.6,4.99164,604800,0,0,315000,0,0,0,0,0),
(129945,33259,603,3,1,29037,0,583.61,-110.936,391.6,4.93928,604800,0,0,315000,0,0,0,0,0);
-- Pongo el spawn de Forge Construct como en TDB (guid de ZLDB)
DELETE FROM `creature` WHERE `id`=34085;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129346,34085,603,3,1,0,0,612.706,296.304,360.802,1.57116,604800,5,0,606645,0,2,0,0,0),
(129347,34085,603,3,1,0,0,617.707,295.979,360.802,1.57116,604800,5,0,606645,0,2,0,0,0),
(129348,34085,603,3,1,0,0,562.553,338.36,360.805,4.71955,604800,5,0,606645,0,2,0,0,0),
(129349,34085,603,3,1,0,0,557.545,339.339,360.804,4.71955,604800,5,0,606645,0,2,0,0,0);
-- Pongo el spawn de Magma Rager como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=34086;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129440,34086,603,3,1,0,0,548.726,269.269,360.555,1.64273,604800,5,0,471835,41690,2,0,0,0),
(129441,34086,603,3,1,0,0,558.719,212.238,361.823,1.79573,604800,5,0,471835,41690,2,0,0,0),
(129442,34086,603,3,1,0,0,623.573,237.733,361.802,1.08605,604800,5,0,471835,41690,2,0,0,0),
(129443,34086,603,3,1,0,0,631.92,235.205,361.802,1.90892,604800,5,0,471835,41690,2,0,0,0);
-- Pongo el spawn de Expedition Defender como en TDB (guid de YTDB y ZLDB)
DELETE FROM `creature` WHERE `id`=33816;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129944,33816,603,3,1,29031,0,570.411,-108.794,391.6,4.13643,604800,0,0,315000,0,0,0,0,0),
(129943,33816,603,3,1,29033,0,588.761,-114.866,391.6,4.85202,604800,0,0,315000,0,0,0,0,0),
(129942,33816,603,3,1,29032,0,566.474,-103.634,391.6,4.36332,604800,0,0,315000,0,0,0,0,0),
(129941,33816,603,3,1,29031,0,596.38,-110.264,391.6,4.85202,604800,0,0,315000,0,0,0,0,0),
(129940,33816,603,3,1,29033,0,576.579,-113.111,391.6,4.29351,604800,0,0,315000,0,0,0,0,0),
(129933,33816,603,3,1,29032,0,600.748,-104.848,391.608,4.85202,604800,0,0,315000,0,0,0,0,0);
-- Pongo el spawn de Iron Construct como en TDB (guid de YTDB)
DELETE FROM `creature` WHERE `id`=33121;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(129377,33121,603,3,1,26154,0,543.22,313.451,360.886,0.10472,604800,0,0,3780000,0,0,0,0,0),
(129378,33121,603,3,1,26154,0,630.366,216.772,360.891,3.00197,604800,0,0,3780000,0,0,0,0,0),
(129379,33121,603,3,1,26154,0,630.594,231.846,360.891,3.12414,604800,0,0,3780000,0,0,0,0,0),
(129380,33121,603,3,1,26154,0,543.356,329.408,360.886,6.24828,604800,0,0,3780000,0,0,0,0,0),
(129381,33121,603,3,1,26154,0,630.435,337.246,360.886,3.21141,604800,0,0,3780000,0,0,0,0,0),
(129382,33121,603,3,1,26154,0,543.076,247.458,360.888,6.21337,604800,0,0,3780000,0,0,0,0,0),
(129383,33121,603,3,1,26154,0,630.493,313.349,360.886,3.05433,604800,0,0,3780000,0,0,0,0,0),
(129384,33121,603,3,1,26154,0,630.444,321.406,360.886,3.12414,604800,0,0,3780000,0,0,0,0,0),
(129385,33121,603,3,1,26154,0,543.117,232.082,360.891,0.069813,604800,0,0,3780000,0,0,0,0,0),
(129386,33121,603,3,1,26154,0,543.161,305.956,360.886,0.15708,604800,0,0,3780000,0,0,0,0,0),
(129387,33121,603,3,1,26154,0,543.277,321.482,360.886,0.05236,604800,0,0,3780000,0,0,0,0,0),
(129388,33121,603,3,1,26154,0,543.316,337.468,360.886,6.19592,604800,0,0,3780000,0,0,0,0,0),
(129389,33121,603,3,1,26154,0,630.366,247.307,360.888,3.21141,604800,0,0,3780000,0,0,0,0,0),
(129390,33121,603,3,1,26154,0,630.698,305.311,360.886,3.00197,604800,0,0,3780000,0,0,0,0,0),
(129700,33121,603,3,1,26154,0,630.5,224.559,360.891,3.05433,604800,0,0,3780000,0,0,0,0,0),
(129701,33121,603,3,1,26154,0,630.668,239.84,360.89,3.15905,604800,0,0,3780000,0,0,0,0,0),
(129702,33121,603,3,1,26154,0,543.28,239.674,360.89,6.26573,604800,0,0,3780000,0,0,0,0,0),
(129703,33121,603,3,1,26154,0,630.384,329.585,360.886,3.15905,604800,0,0,3780000,0,0,0,0,0),
(129704,33121,603,3,1,26154,0,543.265,217.147,360.891,0.174533,604800,0,0,3780000,0,0,0,0,0),
(129705,33121,603,3,1,26154,0,543.256,224.831,360.891,0.122173,604800,0,0,3780000,0,0,0,0,0);

-- Waypoints
-- Pongo waypoints Magma Rager de TDB (Guids ZLDB)
DELETE FROM `creature_addon` WHERE `guid` IN (129440,129441,129442,129443);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(129440,1294400,0,33554432,1,0,NULL),
(129441,1294410,0,33554432,1,0,NULL),
(129442,1294420,0,33554432,1,0,NULL),
(129443,1294430,0,33554432,1,0,NULL);
DELETE FROM `waypoint_data` WHERE `id` IN (1294400,1294410,1294420,1294430);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(1294400,1,548.726,269.269,360.555,0,0,0,100,0),
(1294400,2,550.913,194.13,360.822,0,0,0,100,0),
(1294410,1,558.047,269.941,360.802,0,0,0,100,0),
(1294410,2,559.746,193.785,360.826,0,0,0,100,0),
(1294420,1,620.037,184.087,360.802,0,0,0,100,0),
(1294420,2,622.226,265.287,360.801,0,0,0,100,0),
(1294430,1,630.567,183.767,360.783,0,0,0,100,0),
(1294430,2,628.666,265.356,360.213,0,0,0,100,0);
-- Pongo waypoints Forge Construct de TDB (Guids ZLDB)
DELETE FROM `creature_addon` WHERE `guid` IN (129346,129347,129348,129349);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(129346,1293460,0,0,1,0,NULL),
(129347,1293470,0,0,1,0,NULL),
(129348,1293480,0,0,1,0,NULL),
(129349,1293490,0,0,1,0,NULL);
DELETE FROM `waypoint_data` WHERE `id` IN (1293460,1293470,1293480,1293490);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(1293460,1,610.829,342.605,360.802,0,0,0,100,0),
(1293460,2,611.942,272.636,360.802,0,0,0,100,0),
(1293470,1,614.9,342.16,360.802,0,0,0,100,0),
(1293470,2,616.596,272.531,360.802,0,0,0,100,0),
(1293480,1,563.666,274.287,360.802,0,0,0,100,0),
(1293480,2,562.532,345.703,360.795,0,0,0,100,0),
(1293490,1,555.526,274.789,360.802,0,0,0,100,0),
(1293490,2,556.726,346.031,360.795,0,0,0,100,0);

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=5,`combat_reach`=1,`gender`=2 WHERE `modelid`=25870; -- Salvaged Chopper
UPDATE `creature_model_info` SET `bounding_radius`=0.6,`combat_reach`=1,`gender`=1 WHERE `modelid`=28787; -- Razorscale
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=1,`gender`=0 WHERE `modelid`=29185; -- Ignis the Furnace Master

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (33114,33142,33143,33139,33189,33216,33572,33090,33186,33287,33259,34120,
23033,34086,33118,33210,33121,34085,33816,33724,33190);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33114,0,0,257,0, NULL), -- Flame Leviathan Seat
(33142,0,0,1,0, NULL), -- Leviathan Defense Turret
(33143,0,0,1,0, NULL), -- Overload Control Device
(33139,0,0,1,0, NULL), -- Flame Leviathan Turret
(33189,0,0,1,0, NULL), -- Liquid Pyrite
(33216,0,0,1,0, NULL), -- Mechagnome Pilot
(33572,0,0,1,0, NULL), -- Steelforged Defender
(33090,0,0,1,0, NULL),-- Pool of Tar
(33186,0,50331648,1,0, NULL), -- Razorscale
(33816,0,0,1,375, NULL), -- Expedition Defender
(33287,0,0,1,0, NULL), -- Expedition Engineer
(33259,0,0,1,375, NULL), -- Expedition Trapper
(34120,0,50331648,1,0, NULL), -- Brann's Flying Machine
(23033,0,0,1,0, NULL), -- Invisible Stalker (Floating)
(34086,0,33554432,1,0, NULL), -- Magma Rager
(33118,0,0,1,0, NULL), -- Ignis the Furnace Master
(33210,0,0,1,0, NULL), -- Expedition Commander
(33121,0,0,1,0, NULL), -- Iron Construct
(34085,0,0,1,0, NULL); -- Forge Construct
