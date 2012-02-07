-- Editado por Gildor
-- Lo pongo como en TDB
UPDATE `spell_proc_event` SET `procFlags`=0x10,`CustomChance`=100 WHERE `entry` IN (20335,20336,20337);
UPDATE `spell_proc_event` SET `procFlags`=0x10,`CustomChance`=0 WHERE `entry` IN (53695,53696);
