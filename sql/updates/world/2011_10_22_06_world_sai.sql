-- Editado por Gildor
-- Snowblind Follower SAI
SET @ENTRY := 29618;
SET @SPELL_NET := 66474;
-- Lo pongo como en TDB y le quito EventAI
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_NET,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Follower - On Spellhit - Say Line 0 (random)"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,33,34899,0,0,0,0,0,7,0,0,0,0,0,0,0,"Snowblind Follower - On Spellhit (Link) - Quest Credit"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snowblind Follower - On Spellhit (Link) - Forced Despawn");

-- Texts
-- Le quito AITexts
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-20000,-20001,-20002,-20003,-20004,-20005);
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Grrrrr!",12,0,100,0,0,0,"Snowblind Follower"),
(@ENTRY,0,1,"Me not afraid!",12,0,100,0,0,0,"Snowblind Follower"),
(@ENTRY,0,2,"Net not stop me! No... net stop me.",12,0,100,0,0,0,"Snowblind Follower"),
(@ENTRY,0,3,"No kill me!",12,0,100,0,0,0,"Snowblind Follower"),
(@ENTRY,0,4,"No!",12,0,100,0,0,0,"Snowblind Follower"),
(@ENTRY,0,5,"You no take... me!",12,0,100,0,0,0,"Snowblind Follower");
