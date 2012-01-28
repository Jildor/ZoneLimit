-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `creature_template` SET `unit_flags`=33554688,`MovementType`=0,`flags_extra`=`flags_extra`|128|2 WHERE `entry` IN (19871); -- World Trigger (World Trigger (Not Immune NPC))

/* Y esto no sirve
DELETE FROM `game_event_creature` WHERE `guid` IN (62848,62849) AND `eventEntry`=11;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(11, 62848),
(11, 62849);
*/
