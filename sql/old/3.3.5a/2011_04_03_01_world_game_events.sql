-- Editado por Gildor
SET @Event = 62;
-- Guid editada por la de CTDB
SET @GUID = 123736;
-- Pongo los datos igual que en TDB
UPDATE `game_event` SET `start_time`='2011-01-04 14:00:00',`end_time` = '2020-12-31 06:00:00'  WHERE `eventEntry`=15; -- Fishing Extravaganza
UPDATE `game_event` SET `start_time`='2011-01-03 14:00:00',`end_time` = '2020-12-31 06:00:00',`length`=60*(24+3) WHERE `eventEntry`=14; -- Fishing Extravaganza Announce
DELETE FROM `game_event` WHERE `eventEntry`=@Event;
INSERT INTO `game_event` (`eventEntry`,`start_time`,`end_time`,`occurence`,`length`,`holiday`,`description`,`world_event`) VALUES
(@Event, '2011-01-04 14:00:00', '2020-12-31 05:00:00',10080,3*60,0, 'Fishing Extravaganza Turn-ins',0);
-- Guids editadas por las de CTDB
UPDATE `game_event_creature` SET `eventEntry`=@Event WHERE `guid` IN (52968,52967,81456);
DELETE FROM `game_event_creature` WHERE `guid`=@GUID;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(14,@GUID);

DELETE FROM `creature` WHERE `id`=15119;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID,15119,0,1,1,0,0,-4964.69,-936.287,501.743,5.44543,300,0,0,1,0,0,0,0,0,0);
