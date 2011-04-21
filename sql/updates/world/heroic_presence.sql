DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2007;
INSERT INTO `spell_group_stack_rules` VALUES (2007, 1);

DELETE FROM `spell_group` WHERE `id` = 2007;
INSERT INTO `spell_group` VALUES (2007, 6562),(2007, 28878);
