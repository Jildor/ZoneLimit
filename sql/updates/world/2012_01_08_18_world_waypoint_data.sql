-- Editado por Gildor
-- Set 10 sec delay on platforms where boss gets Temporary Electrical Charge
UPDATE `waypoint_data` SET `delay`=10000 WHERE `id`=115219 AND `point` IN (2, 5, 11, 14);

-- Cast self Charge Up to get Temporary Electrical Charge

UPDATE `waypoint_data` SET `action`=11521901 WHERE `id`=115219 AND `point` IN (5, 14);

-- Remove aura Temporary Electrical Charge
UPDATE `waypoint_data` SET `action`=11521902 WHERE `id`=115219 AND `point` IN (2, 3, 4, 11, 12, 13);
