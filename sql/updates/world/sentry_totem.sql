DELETE FROM `spell_dbc` WHERE `id` IN (6494,6496);
UPDATE `creature_template` SET `spell1` = 0 WHERE `entry` = 3968;
DELETE FROM `conditions` WHERE `SourceEntry` = 6196;
