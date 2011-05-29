-- Editado por Gildor
SET @Zul = 23863; -- Zul'jin (ZA)
DELETE FROM `creature_template_addon` WHERE `entry`=@Zul;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Zul,0,0,1,0, NULL);