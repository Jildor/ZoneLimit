DELETE FROM `spell_bonus_data` WHERE `entry` IN (7712,7714,10577,16614,18798,27655,28788,38395,55756,6297,13897,20004,28005,20006,44525,28715,38616,43731,43733);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
-- items
(7712,0,0,0,0,'Item - Blazefury Medallion & Fiery Retributor (Fire Strike)'),
(7714,0,0,0,0,'Item - Fiery Plate Gauntlets (Fire Strike)'),
(10577,0,0,0,0,'Item - Gauntlets of the Sea (Heal)'),
(16614,0,0,0,0,'Item - Storm Gauntlets (Lightning Strike)'),
(18798,0,0,0,0,'Item - Freezing Band (Freeze)'),
(27655,0,0,0,0,'Item - Heart of Wyrmthalak (Flame Lash)'),
(28788,0,0,0,0,'Item - Paladin T3 (8)'),
(38395,0,0,0,0,'Item - Warlock T5 (2)'),
(55756,0,0,0,0,'Item - Brunnhildar weapons (Chilling Blow)'),
-- enchants
(6297,0,0,0,0,'Enchant - Fiery Blaze'),
(13897,0,0,0,0,'Enchant - Fiery Weapon'),
(20004,0,0,0,0,'Enchant - Lifestealing'),
(28005,0,0,0,0,'Enchant - Battlemaster'),
(20006,0,0,0,0,'Enchant - Unholy Weapon'),
(44525,0,0,0,0,'Enchant - Icebreaker'),
-- Consumables
(28715,0,0,0,0,'Consumable - Flamecap (Flamecap Fire)'),
(38616,0,0,0,0,'Poison - Bloodboil Poison'),
(43731,0,0,0,0,'Consumable - Stormchops (Lightning Zap)'),
(43733,0,0,0,0,'Consumable - Stormchops (Lightning Zap)');

UPDATE `spell_bonus_data` SET `comments`='Enchant - Deathfrost' WHERE `entry`=46579;