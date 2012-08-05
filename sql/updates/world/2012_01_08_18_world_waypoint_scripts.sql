-- Editado por Gildor
-- Cast self Charge Up to get Temporary Electrical Charge
DELETE FROM `waypoint_scripts` WHERE `id`=11521901;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(11521901, 0, 14, 52092, 1, 0, 0, 0, 0, 0, 5028),
(11521901, 2, 15, 52098, 1, 0, 0, 0, 0, 0, 5029);

-- Remove aura Temporary Electrical Charge
DELETE FROM `waypoint_scripts` WHERE `id`=11521902;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(11521902, 0, 14, 52092, 1, 0, 0, 0, 0, 0, 5030);
