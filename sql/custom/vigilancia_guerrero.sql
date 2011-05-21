DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (59665,-50720);
INSERT INTO `spell_linked_spell` VALUES
(59665,68066,0,'Vigilance - apply damage reduction'),
(-50720,-68066,0,'Vigilance - remove damage reduction');
