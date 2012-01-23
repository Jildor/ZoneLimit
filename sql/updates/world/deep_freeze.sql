DELETE FROM `playercreateinfo_spell` WHERE `Spell`=71761;
DELETE FROM `spell_bonus_data` WHERE `entry`=71757;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(71757,2.143,0,0,0,'Mage - Deep Freeze');
DELETE FROM `spell_proc_event` WHERE `entry`=71761;
