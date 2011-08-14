UPDATE `gameobject_template` SET `flags` = '36' WHERE `entry` IN (192642,192643);
UPDATE `battleground_template` SET `MinPlayersPerTeam` = '0', `MaxPlayersPerTeam` = '2' WHERE `id` = 10;
DELETE FROM `disables` WHERE `entry` = 10;