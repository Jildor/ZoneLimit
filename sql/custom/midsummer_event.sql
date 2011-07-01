SET @GOGUID := 43500;
DELETE FROM `gameobject` WHERE `id`=188067;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GOGUID, 188067, 547, 3, 1, -79.397, -219.702, -4.04289, -2.19912, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+1, 188067, 547, 3, 1, -115.599, -162.772, -1.92403, -0.558504, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+2, 188067, 547, 3, 1, -71.8962, -145.497, -1.55181, -1.95477, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+3, 188067, 547, 3, 1, -75.9514, -182.771, -4.88202, -1.15192, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+4, 188067, 547, 3, 1, -49.2725, -168.986, -1.89881, 2.00713, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+5, 188067, 547, 3, 1, -75.2318, -217.329, -3.0728, -0.488691, 0, 0, 0, 1, 180, 255, 1),
(@GOGUID+6, 188067, 547, 3, 1, -83.5253, -172.181, -3.81652, 0.017452, 0, 0, 0, 1, 180, 255, 1);

-- Snow Pile (enviromental)
DELETE FROM `gameobject` WHERE `id`=188187;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GOGUID+7, 188187, 547, 3, 1, -96.8723, -212.842, -1.14914, -2.1293, 0, 0, 0, 1, 180, 255, 1);

DELETE FROM game_event_gameobject WHERE guid between @GOGUID and @GOGUID+7;
INSERT INTO game_event_gameobject VALUES
(1,@GOGUID), (1,@GOGUID+1), (1,@GOGUID+2), (1,@GOGUID+3), (1,@GOGUID+4), (1,@GOGUID+5), (1,@GOGUID+6), (1,@GOGUID+7);
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- Serverside Spells
DELETE FROM `spell_dbc` WHERE `Id` IN (29710,58934);
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('29710','0','0','256','0','0','0','0','0','0','0','0','1','0','0','101','0','0','0','0','0','1','0','-1','0','0','140','0','0','0','0','0','0','0','0','0','0','0','0','0','0','25','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','29531','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','0','1','Ribbon Pole - Force Cast Ribbon Pole Channel'),
('58934','0','0','536870912','0','0','0','0','0','0','0','0','1','0','0','101','0','0','0','0','0','1','0','-1','0','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','28','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','Burning Hot Pole Dance credit marker');

-- Link Dancer Check Aura and Visual to Ribbon Pole Channel
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (29531,45390);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(29531,45390,0, 'Ribbon Pole - Dancer Check Aura'),
(45390,45406,2, 'Ribbon Pole - Periodic Visual');

-- Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id`=45390;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45390, 'spell_gen_ribbon_pole_dancer_check');
-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- torch toss target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (46054,45732);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,45732,18,1,25535),
(13,46054,18,1,25535);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=45723;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(45723,43313,2, 'Torch Tossing - Target Indicator Visual');

UPDATE `creature_template` SET `ScriptName`='npc_torch_tossing_bunny' WHERE `entry`=25535;

UPDATE `quest_template` SET `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry` IN (11731,11922);
UPDATE `quest_template` SET `PrevQuestId`=11731, `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11921;
UPDATE `quest_template` SET `PrevQuestId`=11922, `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11926;
UPDATE `quest_template` SET `StartScript`=11731 WHERE `entry` IN (11731,11922);
UPDATE `quest_template` SET `StartScript`=11921 WHERE `entry` IN (11921,11926);

-- add torch toss aura on quest accept
DELETE FROM `quest_start_scripts` WHERE `id` IN (11731,11921);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(11731,0,14,45724,0,0,0,0,0,0),
(11731,1,15,45716,0,0,0,0,0,0),
(11921,0,14,45724,0,0,0,0,0,0),
(11921,1,15,46630,0,0,0,0,0,0);

-- more objects
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID+8 AND @GO_GUID+14 && `id` IN (187708,300068);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID+8,'187708','0','1','1','-8822.4','846.766','99.0875','2.10363','0','0','0.868324','0.495997','300','0','1'),
(@GO_GUID+9,'187708','0','1','1','-8817.63','851.846','98.9217','2.93222','0','0','0.994525','0.104495','300','0','1'),
(@GO_GUID+10,'187708','0','1','1','-8816.68','854.946','98.9073','2.92043','0','0','0.993892','0.110354','300','0','1'),
(@GO_GUID+11,'187708','0','1','1','-8816.66','858.591','98.9913','3.1427','0','0','1','-0.000551387','300','0','1'),
(@GO_GUID+12,'300068','0','1','1','-8834.32','857.823','99.8395','6.0196','0','0','0.131411','-0.991328','300','0','1'),
(@GO_GUID+13,'187708','1','1','1','1913.57','-4315.85','23.1799','4.90635','0','0','0.635316','-0.772252','300','0','1'),
(@GO_GUID+14,'300068','1','1','1','1914.7','-4336.27','22.1744','1.01471','0','0','0.485865','0.874034','300','0','1');

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID+8 AND @GO_GUID+14;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID+8),
(1,@GO_GUID+9),
(1,@GO_GUID+10),
(1,@GO_GUID+11),
(1,@GO_GUID+12),
(1,@GO_GUID+13),
(1,@GO_GUID+14);

SET @CGUID := 1111119;
-- more bunnies
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+1 AND @CGUID+12;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+1,'25535','0','1','1','0','0','-8825.75','845.668','100.848','2.15624','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+2,'25535','0','1','1','0','0','-8822.48','846.841','100.883','2.2018','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+3,'25535','0','1','1','0','0','-8819.42','848.453','100.745','2.70837','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+4,'25535','0','1','1','0','0','-8817.56','851.801','100.717','2.7767','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+5,'25535','0','1','1','0','0','-8816.67','854.896','100.703','2.9275','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+6,'25535','0','1','1','0','0','-8816.57','858.57','100.787','3.28328','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+7,'25535','1','1','1','0','0','1925.17','-4321.24','23.4473','4.69918','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+8,'25535','1','1','1','0','0','1923.89','-4315.22','24.2852','4.59786','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+9,'25535','1','1','1','0','0','1920.46','-4319.27','23.6163','5.01334','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+10,'25535','1','1','1','0','0','1918.05','-4314.94','24.6482','5.04868','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+11,'25535','1','1','1','0','0','1913.58','-4315.8','24.9737','5.22382','30','0','0','4120','0','0','0','0','0','0'),
(@CGUID+12,'25535','1','1','1','0','0','1915.54','-4320.43','23.6154','5.09658','30','0','0','4120','0','0','0','0','0','0');

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID+1 AND @CGUID+12;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@CGUID+1),
(1,@CGUID+2),
(1,@CGUID+3),
(1,@CGUID+4),
(1,@CGUID+5),
(1,@CGUID+6),
(1,@CGUID+7),
(1,@CGUID+8),
(1,@CGUID+9),
(1,@CGUID+10),
(1,@CGUID+11),
(1,@CGUID+12);
-- -----------------------------------------------------------------------------------------------------------------------------
UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry`=188128;
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=188129;

-- correct some relations
DELETE FROM `creature_questrelation` WHERE `id`=16817 AND `quest`=11935;
DELETE FROM `creature_questrelation` WHERE `id`=16818 AND `quest`=11933;
UPDATE `creature_questrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_involvedrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_questrelation` SET `id`=16817 WHERE `quest`=9365;
UPDATE `creature_involvedrelation` SET `id`=16817 WHERE `quest`=9365;
-- ----------------------------------------------------------------------------------------------------------------------------
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN (25755,25756,25757,26342,26340,26341);
DELETE FROM smart_scripts WHERE entryorguid IN (25755,25756,25757,26342,26340,26341);
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance,
 event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2,
 action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y,
 target_z, target_o, comment) VALUES 
(25755,0,0,0,11,0,100,7,1000,1000,0,0,11,46542,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Hailstone - On spawn & Reset - Cast Chilling Aura on Self'),
(25755,0,1,0,0,0,100,6,3000,6000,19000,22000,11,2676,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Hailstone - In Combat - Cast Pulverize on Self'),
(25755,0,2,0,1,0,100,6,30000,30000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Hailstone - OOC - Despawn after 30s'),
(25756,0,0,0,0,0,100,6,2000,4000,8000,9000,11,46406,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ahunite Coldwave - In Combat - Cast Bitter Blast on Random Player'),
(25756,0,1,0,1,0,100,6,30000,30000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Coldwave - OOC - Despawn after 30s'),
(25757,0,0,0,11,0,100,7,1000,1000,0,0,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Frostwind - On spawn & Reset - Cast Lightning Shield on Self'),
(25757,0,1,0,0,0,100,6,2000,5000,11000,16000,11,46568,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ahunite Frostwind - In Combat - Cast Wind Buffet on Random Player'),
(25757,0,2,0,1,0,100,6,30000,30000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Frostwind - OOC - Despawn after 30s');
UPDATE creature_template SET faction_A=16, faction_H=16, minlevel=83, maxlevel=83, exp=0, mindmg=700, maxdmg=800, attackpower=750, dmg_multiplier=7.5, mechanic_immune_mask=617299803, health_mod=92.8444 WHERE entry=25740; -- Ahune (N)
UPDATE creature_template SET faction_A=16, faction_H=16, minlevel=83, maxlevel=83, exp=0, mindmg=700, maxdmg=800, attackpower=750, dmg_multiplier=13, mechanic_immune_mask=617299803, health_mod=92.8444 WHERE entry=26338; -- Ahune (H)
UPDATE creature_template SET faction_A=16, faction_H=16, minlevel=83, maxlevel=83, exp=0, health_mod=86.7769, mechanic_immune_mask=617299803, unit_flags=131076 WHERE entry IN (25865,26339); -- Frozen Core (N/H)
UPDATE creature_template SET faction_A=16, faction_H=16, minlevel=80, maxlevel=80, exp=0, health_mod=18.8693, mindmg=600, maxdmg=700, attackpower=650, dmg_multiplier=7.5 WHERE entry IN (25755,26342); -- Hailstone (N/H)
UPDATE creature_template SET faction_A=16, faction_H=16, minlevel=80, maxlevel=80, exp=0, health_mod=3.5380, mindmg=400, maxdmg=500, attackpower=450, dmg_multiplier=7.5 WHERE entry IN (25756,26340); -- Coldwave (N/H)
UPDATE creature_template SET faction_A=16, faction_H=16, mindmg=400, maxdmg=500, attackpower=450, dmg_multiplier=7.5 WHERE entry IN (25757,26341); -- Frostwind (N/H)
UPDATE creature_template SET AIName='', ScriptName='boss_ahune' WHERE entry=25740; -- Ahune Script
-- --------------------------------------------------------------------------------------------------------------------------------