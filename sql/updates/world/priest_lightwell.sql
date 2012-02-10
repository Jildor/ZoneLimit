UPDATE `creature_template` SET `unit_flags`=0, `AIName` = '', `ScriptName`='npc_lightwell' WHERE `entry` IN (31883,31893,31894,31895,31896,31897);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (31883,31893,31894,31895,31896,31897);
