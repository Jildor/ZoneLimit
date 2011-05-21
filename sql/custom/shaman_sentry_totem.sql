DELETE FROM `spell_dbc` WHERE `id` IN (6494,6496);
INSERT INTO `spell_dbc` (`Id`,`CastingTimeIndex`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectBasePoints1`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`EffectApplyAuraName1`,`SpellFamilyName`,`Comment`) VALUES
(6494,1,5,1,6,1,1,27,4,11,'Sentry Totem Helper 1 (SERVERSIDE)'),
(6496,1,5,1,6,1,25,0,1,11,'Sentry Totem Helper 2 (SERVERSIDE)');

UPDATE `creature_template` SET `spell1` = 6494 WHERE `entry` = 3968;
