-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=0,`speed_walk`=2.2,`speed_run`=0.78571,`flags_extra`=0 WHERE `entry`=28239; -- Arcane Beam
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`speed_walk`=2.2,`speed_run`=0.78571,`flags_extra`=0 WHERE `entry`=31628; -- Arcane Beam (1)
DELETE FROM `creature_template_addon` WHERE `entry`=28239;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28239,0,0,1,0, '51019'); -- Arcane Beam
