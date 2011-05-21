DELETE FROM `spell_bonus_data` WHERE `entry` = 20153;
INSERT INTO `spell_bonus_data` VALUES
(20153,1,-1,-1,-1,'Warlock - Immolation (Infernal)');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 89;
INSERT INTO `creature_ai_scripts` VALUES
(8900, 89, 7, 0, 100, 0, 0, 0, 0, 0, 11, 19483, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 'Inferno - Immolation');
