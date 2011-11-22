-- Achievement: The Turkinator
SET @ENTRY := 32820;
SET @SPELL := 62014;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName='', ScriptName='npc_wild_turkey' WHERE entry=@ENTRY;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_turkey_tracker';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@SPELL, 'spell_gen_turkey_tracker');