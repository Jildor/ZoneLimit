DELETE FROM `spell_group` WHERE `id` IN (2005,2006);
INSERT INTO `spell_group` VALUES
(2005,5677),(2006,-1005),(2006,-2005);

DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2006;
INSERT INTO `spell_group_stack_rules` VALUES (2006,1);
