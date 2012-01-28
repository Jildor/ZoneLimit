-- Editado por Gildor
-- Fix quest 11162 Challenge to the Black Flight
-- Lo pongo como en TDB
UPDATE `creature_template` SET `faction_A`=103,`faction_H`=103,`unit_flags`=`unit_flags`&~768 WHERE `entry`=23789; -- Smolderwing
