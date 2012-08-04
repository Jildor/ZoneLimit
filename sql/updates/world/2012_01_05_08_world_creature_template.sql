-- Editado por Gildor
-- Fix Highlord Nemesis Trainer
-- Le quito EventAI
UPDATE `creature_template` SET `unit_flags`=131072,`AIName`='',`flags_extra`=262144,`ScriptName`= 'npc_training_dummy' WHERE `entry`=32547;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=32547;
