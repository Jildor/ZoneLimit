-- Create temporary table that holds the entry conversion data. (See corresponding world db update)
CREATE TABLE `game_event_temp` (
  `entryOld` TINYINT(3) UNSIGNED NOT NULL,
  `entryNew` TINYINT(3) UNSIGNED NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- Renumbered entry data
-- Editado para CTDB
INSERT INTO `game_event_temp` (`entryOld`,`entryNew`) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),
(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),
(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),
(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),
(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),
(71,71),(72,72),(124,73),(125,74),(126,75),(127,76),(128,77),(129,78),(130,79),(131,88);

-- Update game_event_save
UPDATE `game_event_save`, `game_event_temp` SET `game_event_save`.`event_id` = `game_event_temp`.`entryNew` WHERE `game_event_save`.`event_id` = `game_event_temp`.`entryOld`;
ALTER TABLE `game_event_save` CHANGE `event_id` `eventEntry` TINYINT(3) UNSIGNED NOT NULL;

-- Update game_event_condition_save
UPDATE `game_event_condition_save`, `game_event_temp` SET `game_event_condition_save`.`event_id` = `game_event_temp`.`entryNew` WHERE `game_event_condition_save`.`event_id` = `game_event_temp`.`entryOld`;
ALTER TABLE `game_event_condition_save` CHANGE `event_id` `eventEntry` TINYINT(3) UNSIGNED NOT NULL;