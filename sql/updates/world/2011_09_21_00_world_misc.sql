-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `unit_flags`=33554688,`flags_extra`=0,`scriptname`='mob_bullet_controller' WHERE `entry` = 34743;
-- Borro su spawn, en TDB no esta
DELETE FROM `creature` WHERE `id` = 34743;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 18 AND `SourceEntry` IN (66152,66153);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 66152, 0, 18, 1, 34720, 1, 0, '', 'Light Bullets Stalker - Light Orb Spawn'),
(13, 0, 66153, 0, 18, 1, 34704, 1, 0, '', 'Dark Bullets Stalker - Dark Orb Spawn');
