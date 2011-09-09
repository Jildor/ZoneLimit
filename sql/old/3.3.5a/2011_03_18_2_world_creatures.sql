-- Editado por Gildor
-- Cambio las Guids para CTDB
SET @GUID := 169801;
SET @GUID2 := 225151;
-- Le pongo las flags como en TDB
UPDATE `creature_template` SET `unit_flags` = 33555200, `flags_extra` = 2 WHERE `entry` = 16980 ;
DELETE FROM `creature` WHERE `guid` IN (@GUID,@GUID2+0,@GUID2+1,@GUID2+2,@GUID2+3) ;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,16980,631,15,1,0,0,4203.70,2484.83,364.956,3.14159,604800,0,0,0,0,0,0,0,0,0), -- The Lich King
(@GUID2+0,22515,631,15,1,0,0,4241.19,2557.49,364.952,4.72984,120,0,0,0,0,0,0,0,0,0), -- World Trigger
(@GUID2+1,22515,631,15,1,0,0,4241.34,2411.52,364.952,1.57080,120,0,0,0,0,0,0,0,0,0), -- World Trigger
(@GUID2+2,22515,631,10,1,0,0,4166.02,2557.49,364.952,4.72984,120,0,0,0,0,0,0,0,0,0), -- World Trigger
(@GUID2+3,22515,631,10,1,0,0,4241.34,2411.52,364.952,1.57080,120,0,0,0,0,0,0,0,0,0); -- World Trigger
