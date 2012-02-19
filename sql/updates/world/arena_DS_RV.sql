-- Gobs Dalaran Sewers
UPDATE `gameobject_template` SET `flags` = '36' WHERE `entry` IN (192642,192643);
-- DS and RV players min and max players
UPDATE `battleground_template` SET `MinPlayersPerTeam` = '0', `MaxPlayersPerTeam` = '2' WHERE `id` IN (10,11);
-- Scripts circulo demoniaco en las dos BGs
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_warl_demonic_circle_summon';
INSERT INTO `spell_script_names` VALUES (48018, 'spell_warl_demonic_circle_summon');
-- Disables de las dos BGs
DELETE FROM `disables` WHERE `sourceType`=3 AND `entry` IN (10,11);
