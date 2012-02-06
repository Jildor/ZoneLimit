-- Editado por Gildor
-- Guids de YTDB
DELETE FROM `linked_respawn` WHERE `linkedGuid`=115220 AND `guid` IN (115215,115217,115213,115209,115214);
INSERT INTO `linked_respawn` (`guid`, `linkedGuid`) VALUES
(115215, 115220),
(115217, 115220),
(115213, 115220),
(115209, 115220),
(115214, 115220);
