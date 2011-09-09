-- Editado por Gildor
-- Le pongo entry para ZLDB
DELETE FROM `creature_equip_template` WHERE `entry`=4228;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`)
VALUES
(4228,45315,0,0);
UPDATE `creature_template` SET `equipment_id`=4228 WHERE `entry`=33515; -- Freya