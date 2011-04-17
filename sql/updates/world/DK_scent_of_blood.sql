DELETE FROM `spell_proc_event` WHERE `entry` IN (49004,49508,49509);
INSERT INTO `spell_proc_event` (`entry`,`procEx`) VALUES
(49004,0x00000033),
(49508,0x00000033),
(49509,0x00000033);
