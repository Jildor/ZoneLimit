DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN (71412,71415);

/* Deleted Data
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 0, 71412, 0, 0, 18, 0, 1, 37824, 0, 0, 0, '', 'Putricide - Unstable Experiment'),
(13, 0, 71415, 0, 0, 18, 0, 1, 37824, 0, 0, 0, '', 'Putricide - Unstable Experiment');
*/
