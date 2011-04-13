DELETE FROM `spell_linked_spell` WHERE `spell_effect` = 54661 AND `spell_trigger` IN (32612,5215,1784);
INSERT INTO `spell_linked_spell` VALUES
(32612,54661,0,'Invisibility Sanctuary Effect'),
(5215,54661,0,'Prowl Sanctuary Effect'),
(1784,54661,0,'Stealth Sanctuary Effect');
