-- Editado por Gildor
-- removing some garbage
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 31583 AND `spell_id`=46598;

-- fix DB errors recently inroduced
UPDATE `creature_template` set `VehicleId` = 201 WHERE `entry` = 30935;
UPDATE `creature_template` set `VehicleId` = 397 WHERE `entry` = 34162;
UPDATE `creature_template` set `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN (30935,34162);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (30935,34162);
INSERT INTO `npc_spellclick_spells` VALUES
(30935,46598,0,0,0,1,0,0,0),
(34162,46598,0,0,0,1,0,0,0);

-- Guids cambiadas para ZLDB
DELETE FROM `linked_respawn` WHERE `guid` IN (85584,85585,85586);
