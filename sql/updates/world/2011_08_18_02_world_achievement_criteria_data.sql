-- Editado por Gildor
-- Borro el que tiene type 18
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12740,12741,12744,12993) AND `type` IN (12,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(12740,12,0,0,''),
(12741,12,0,0,''),
(12744,12,0,0,''),
(12993,12,1,0,'');
