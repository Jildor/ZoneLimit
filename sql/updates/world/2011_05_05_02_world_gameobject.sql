-- Editado por Gildor
-- Gobs de YTDB
DELETE FROM `gameobject_template` WHERE `entry` IN (193603,191349);
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`faction`,`flags`,`size`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`data0`,`data1`,`data2`,`data3`,`data4`,`data5`,`data6`,`data7`,`data8`,`data9`,`data10`,`data11`,`data12`,`data13`,`data14`,`data15`,`data16`,`data17`,`data18`,`data19`,`data20`,`data21`,`data22`,`data23`,`AIName`,`ScriptName`,`WDBVerified`) VALUES
(191349,3,51,'Cache of Eregos','','','',0,6553600,1,0,0,0,0,0,0,57,191349,0,1,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,'','',12340),
(193603,3,51,'Cache of Eregos','','','',0,0,1,43668,0,0,0,0,0,57,193603,0,1,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,'','',12340);
-- Loot de YTDB
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (193603,191349);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(191349,33422,10,1,0,-33422,1),
(191349,35963,0.16,1,0,-35963,1),
(191349,35971,0.12,1,0,-35971,1),
(191349,36961,0,1,2,1,1),
(191349,36962,0,1,2,1,1),
(191349,36969,0,1,2,1,1),
(191349,36971,0,1,1,1,1),
(191349,36972,0,1,2,1,1),
(191349,36973,0,1,1,1,1),
(191349,36974,0,1,1,1,1),
(191349,36975,0,1,1,1,1),
(191349,41798,15,1,0,1,1),
(191349,43228,100,1,0,1,1),
(191349,47241,100,1,0,1,1),
(193603,37291,0,1,1,1,1),
(193603,37292,0,1,1,1,1),
(193603,37293,0,1,1,1,1),
(193603,37294,0,1,1,1,1),
(193603,37360,0,1,2,1,1),
(193603,37361,0,1,2,1,1),
(193603,37362,0,1,2,1,1),
(193603,37363,0,1,2,1,1),
(193603,41798,5,1,0,1,1),
(193603,43102,100,1,0,1,1),
(193603,43228,100,1,0,3,4),
(193603,43668,-100,1,0,1,1),
(193603,47241,100,1,0,1,1),
(193603,52676,2,1,0,1,1);
-- Spawns de TDB (Guid YTDB)
DELETE FROM `gameobject` WHERE `id` IN (193603,191349);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(38556,193603,578,2,1,1015.06,1051.09,605.619,0.017452,0,0,0,1,-608400,0,1),
(49697,191349,578,1,1,1015.06,1051.09,605.619,0.017452,0,0,0,1,-608400,0,1);
