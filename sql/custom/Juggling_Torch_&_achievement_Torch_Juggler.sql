-- Fix for achievement Torch Juggler
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=45819;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(45819,45280,0,'Midsummer Fire Festival - Juggling Torch');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6937;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(6937,16,341,0,''),
(6937,11,0,0,'achievement_torch_juggler');