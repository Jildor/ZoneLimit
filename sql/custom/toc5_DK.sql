UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216 WHERE `entry` IN (35491);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 35491;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(35491,47020,0,0,0,1,0,0,0);