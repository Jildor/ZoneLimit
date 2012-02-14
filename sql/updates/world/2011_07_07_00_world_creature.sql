-- Editado por Gildor
-- Los pongo como en TDB
UPDATE `creature_template` SET `unit_flags`=537133824,`dynamicflags`=32 WHERE `entry` IN (27457,27481,26513,26516); -- Skirmisher Corpse, Westfall Infantry Corpse, Drakkari Shaman Corpse, Drakkari Warrior Corpse
UPDATE `creature_template` SET `faction_A`=37,`faction_H`=37 WHERE `entry` IN (26513,26516); -- Drakkari Shaman Corpse, Drakkari Warrior Corpse
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=27481; -- Westfall Infantry Corpse

DELETE FROM `creature_template_addon` WHERE `entry` IN (27457,27481);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27457,0,0,1,0, '29266'), -- Skirmisher Corpse (Permanent Feign Death)
(27481,0,0,1,0, '29266'); -- Westfall Infantry Corpse (Permanent Feign Death)

UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry` IN (26513,26516); -- Drakkari Shaman Corpse (Permanent Feign Death)

UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id` IN (27457,27481,26513,26516);
/* No es necesario (habría que cambiar las guids)
DELETE FROM `creature_addon` WHERE `guid` IN (102034,102035,102036,102037,102038,102041,102042,102043,102044,102045,102046,102047,103956,103957,103958,103959,103960,103972,103973,103974,103975,103976,103977,103978,103984,103985,103986,103987);
*/

-- Le quito EventAI de creature_template ya que borran el EventAI
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=27570;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=27570;
