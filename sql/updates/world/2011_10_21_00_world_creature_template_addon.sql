-- Editado por Gildor
-- Move Shadowfiend's Mana Leech Aura from spellscript to creature addon.
DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_pri_shadowfiend';
-- Lo pongo como en TDB
UPDATE `creature_template` SET `minlevel`=66,`faction_A`=1,`faction_H`=1,`MovementType`=1 WHERE `entry`=19668;
UPDATE `creature_template_addon` SET `auras`= '28305' WHERE `entry`=19668;
