-- Editado por Gildor
-- Quito el type 18
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7231 AND `type` IN (12,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7231,12,1,0,'');
