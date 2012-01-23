-- Editado por Gildor
DELETE FROM `creature` WHERE `id`=25589;
-- Guid de YTDB
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(120019,25589,571,1,1,0,0,4464.63,5378.07,-15.2737,6.05299,600,0,0,1,0,0);
DELETE FROM `creature_template_addon` WHERE `entry`=25589;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(25589,0,1,1,0, ''); -- sitting
-- Lo pongo como en TDB
UPDATE `creature_template` SET `faction_A`=1973,`faction_H`=1973,`speed_walk`=1.8,`unit_flags`=33536 WHERE `entry`=25589;
