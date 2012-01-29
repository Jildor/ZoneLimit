-- Editado por Gildor
-- [Q] Scourgekabob
-- Despawn Mummy Bunny SAI
SET @ENTRY := 27931;
SET @SPELL_CREDIT := 50035;
-- Lo pongo como en TDB
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`AIName`='SmartAI',`flags_extra`=0 WHERE `entry`=@ENTRY;
-- Le quito EventAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts`  (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)  VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,11,@SPELL_CREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0,'Despawn Mummy Bunny - Just Summoned - Quest Credit');
-- Quito fix ZLDB
UPDATE `gameobject_template` SET `AIName`='' WHERE `entry` = 190225;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=190225;
