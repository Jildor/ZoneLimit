DROP TABLE IF EXISTS `fake_items`;
CREATE TABLE `fake_items` (
  `guid` int(11) NOT NULL,
  `fakeEntry` int(11) NOT NULL,
  PRIMARY KEY (`guid`)
);

INSERT INTO `gossip_menu` VALUES (51000, 51000);
INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(51000, 'Put in the first slot of bag item, that you want to transmogrify. In the second slot, put item with perfect display.', 0);
