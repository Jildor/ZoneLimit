-- Editado por Gildor
-- Adds missing spirit healer in Desolace
-- Guid de ZLDB
SET @GUID := 11560;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID, 6491, 1, 1, 1, 0, 0, -452.182, 2513.69, 92.8852, 6.1809, 300, 0, 0, 4120, 0, 0, 0, 0, 0);
