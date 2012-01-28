-- Editado por Gildor
-- Los pongo como en TDB
UPDATE `creature_template` SET `faction_A`=1885,`faction_H`=1885,`minlevel`=82, `maxlevel`=82, `flags_extra`=0 WHERE `entry`=31674; -- Ingvar the Plunderer (1)
UPDATE `creature_template` SET `faction_A`=1885,`faction_H`=1885 WHERE `entry`=23980; -- Ingvar the Plunderer
UPDATE `creature_template` SET `unit_flags`=64,`AIName`='' WHERE `entry` IN (23954,31673); -- Ingvar the Plunderer
-- Borro EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=23954; -- Ingvar the Plunderer
-- Pongo spawntimesecs como en TDB
UPDATE `creature` SET `spawntimesecs`=86400 WHERE `id`=23954; -- Ingvar the Plunderer
