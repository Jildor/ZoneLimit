-- Editado por Gildor
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=195139; -- Portal to Stormwind
UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry`=195140; -- Portal to Orgrimmar

-- Los pongo como en TDB
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2 WHERE `entry` IN (18967,18968,19230); -- Dark Assault - Alliance/Horde/Legion Portal - Invisible Stalker
UPDATE `creature_template` SET `gossip_menu_id`=0,`faction_A`=14,`faction_H`=14,`unit_flags`=33555200 WHERE `entry` IN (18967,18968); -- Dark Assault - Alliance/Horde
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=19230; -- Legion Portal - Invisible Stalker
-- Le quito los gossips a los Dark Assault - Alliance/Horde
DELETE FROM `gossip_menu` WHERE `entry` IN (50727,50726);
DELETE FROM `npc_text` WHERE `id` IN (50727,50726);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (50727,50726);
DELETE FROM `gossip_scripts` WHERE `id` IN (50598,50599);

-- Guids de YTDB
DELETE FROM `gameobject` WHERE `id` IN (195139, 195140);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(5899, 195140, 530, 1, 1, -161.3178, 965.4099, 54.29044, 0, 0, 0, 0, 0, 200, 0, 1), -- Portal to Orgrimmar
(5900, 195139, 530, 1, 1, -337.4917, 962.6188, 54.28853, 0, 0, 0, 0, 0, 200, 0, 1); -- Portal to Stormwind
