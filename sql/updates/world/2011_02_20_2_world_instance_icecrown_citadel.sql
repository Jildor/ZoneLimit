-- Editado por Gildor
-- Spawn de TDB (Guids YTDB y ZLDB)
DELETE FROM `creature` WHERE `id` IN (
16980, -- The Lich King
36789, -- Valithria Dreamwalker (boss)
38589, -- Valithria Dreamwalker (humanoide)
38752, -- Green Dragon Combat Trigger
37126, -- Sister Svalna
37127, -- Ymirjar Frostbinder
37132, -- Ymirjar Battle-Maiden
37133, -- Ymirjar Warlord
37134, -- Ymirjar Huntress
37868, -- Risen Archmage
38125, -- Ymirjar Deathbringer
38154, -- Warhawk
37122, -- Captain Arnath
37123, -- Captain Brandon
37124, -- Captain Grondel
37125, -- Captain Rupert
37129  -- Crok Scourgebane
);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(169801,16980,631,15,17,0,0,4203.7,2484.83,364.956,3.14159,604800,0,0,0,0,0,0,0,0), -- The Lich King
(47622,36789,631,10,5,0,0,4203.65,2483.89,364.961,5.51524,604800,0,0,17999997,0,0,0,0,0), -- Valithria Dreamwalker (boss)
(83235,36789,631,5,5,0,0,4203.65,2483.89,364.961,5.51524,604800,0,0,6000003,0,0,0,0,0), -- Valithria Dreamwalker (boss)
(77648,37122,631,15,1,0,0,4365.98,2672.63,349.271,4.67748,604800,0,0,130330,4081,0,0,0,0), -- Captain Arnath
(77646,37123,631,15,1,0,0,4361.32,2675.74,349.389,4.64258,604800,0,0,130330,61215,0,0,0,0), -- Captain Brandon
(77645,37124,631,15,1,0,0,4349.95,2677.52,349.306,4.83962,604800,0,0,130330,0,0,0,0,0), -- Captain Grondel
(77644,37125,631,15,1,0,0,4347.03,2673.68,349.37,4.85202,604800,0,0,130330,0,0,0,0,0), -- Captain Rupert
(77655,37126,631,15,1,0,0,4356.71,2484.33,371.531,1.5708,604800,0,0,0,0,0,0,0,0), -- Sister Svalna
(77656,37127,631,15,1,0,0,4371.41,2570.52,351.101,0.0808906,7200,0,0,0,0,0,0,0,0), -- Ymirjar Frostbinder
(78002,37127,631,15,1,0,0,4346.72,2607.9,351.101,3.23426,7200,0,0,0,0,0,0,0,0), -- Ymirjar Frostbinder
(77647,37129,631,15,1,0,0,4356.9,2673.27,349.47,4.76475,604800,0,0,278900,0,0,0,0,0), -- Crok Scourgebane
(77653,37132,631,15,1,0,0,4343.78,2525.43,358.433,1.26291,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(77654,37132,631,15,1,0,0,4369.26,2525.06,358.433,1.78913,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(77659,37132,631,15,1,0,0,4368.03,2578.97,351.101,1.69096,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(77660,37132,631,15,1,0,0,4345.88,2577.64,351.101,1.52995,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(96964,37132,631,15,1,0,0,4365.26,2624.06,351.101,1.60232,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(96963,37132,631,15,1,0,0,4349.24,2624.6,351.101,1.55924,7200,0,0,0,0,0,0,0,0), -- Ymirjar Battle-Maiden
(78004,37133,631,15,1,0,0,4356.77,2524.27,358.433,1.50246,7200,0,0,0,0,0,0,0,0), -- Ymirjar Warlord
(78111,37133,631,15,1,0,0,4346.98,2512.75,358.441,1.35716,7200,0,0,0,0,0,0,0,0), -- Ymirjar Warlord
(92818,37133,631,15,1,0,0,4356.85,2636.39,351.101,1.56922,7200,0,0,0,0,0,0,0,0), -- Ymirjar Warlord
(47618,37133,631,15,1,0,0,4366.83,2510.3,358.518,1.62316,7200,0,0,0,0,0,0,0,0), -- Ymirjar Warlord
(77649,37134,631,15,1,0,0,4362.76,2527.67,358.433,1.48282,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(77650,37134,631,15,1,0,0,4350.65,2528.31,358.433,1.52995,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(77657,37134,631,15,1,0,0,4349.36,2584.54,351.101,1.60849,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(77658,37134,631,15,1,0,0,4363.48,2585.09,351.101,1.58493,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(96969,37134,631,15,1,0,0,4362.18,2642.97,351.1,1.5331,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(96970,37134,631,15,1,0,0,4351.66,2642.95,351.1,1.40351,7200,0,0,0,0,0,0,0,0), -- Ymirjar Huntress
(61780,37868,631,15,1,0,0,4230.53,2490.22,364.957,3.36849,604800,0,0,0,0,0,0,0,0), -- Risen Archmage
(62056,37868,631,15,1,0,0,4230.44,2478.56,364.953,2.93215,604800,0,0,0,0,0,0,0,0), -- Risen Archmage
(77143,37868,631,15,1,0,0,4223.4,2465.11,364.952,2.3911,604800,0,0,0,0,0,0,0,0), -- Risen Archmage
(75886,37868,631,15,1,0,0,4222.86,2504.58,364.96,3.90954,604800,0,0,0,0,0,0,0,0), -- Risen Archmage
(78001,38125,631,15,1,0,0,4369.75,2606.94,351.101,6.24627,7200,0,0,0,0,0,0,0,0), -- Ymirjar Deathbringer
(78003,38125,631,15,1,0,0,4340.83,2572.01,351.101,3.14394,7200,0,0,0,0,0,0,0,0), -- Ymirjar Deathbringer
(10718,38752,631,15,17,0,0,4203.89,2484.23,364.956,0,604800,0,0,0,0,0,0,0,0); -- Green Dragon Combat Trigger

-- Quito creature_addon y creature_template_addon que sobran
DELETE FROM `creature_addon` WHERE `guid` IN (77651,77652,77999,78000); -- Warhawk
DELETE FROM `creature_template_addon` WHERE `entry` IN (
37122, -- Captain Arnath
37123, -- Captain Brandon
37124, -- Captain Grondel
37125, -- Captain Rupert
37129  -- Crok Scourgebane
);

-- Guids de YTDB y ZLDB
-- Borro los linkedGuid 83235 (Valithria Dreamwalker (boss))
DELETE FROM `linked_respawn` WHERE `linkedGuid` IN (10718,77655,83235) AND `linkType`=0;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(83235,10718,0), -- Valithria Dreamwalker (boss)
(47622,10718,0), -- Valithria Dreamwalker (boss)
(75886,10718,0), -- Risen Archmage
(77143,10718,0), -- Risen Archmage
(62056,10718,0), -- Risen Archmage
(61780,10718,0), -- Risen Archmage
(10718,10718,0), -- Green Dragon Combat Trigger
(77655,77655,0), -- Sister Svalna
(78002,77655,0), -- Ymirjar Frostbinder
(77656,77655,0), -- Ymirjar Frostbinder
(96963,77655,0), -- Ymirjar Battle-Maiden
(96964,77655,0), -- Ymirjar Battle-Maiden
(77660,77655,0), -- Ymirjar Battle-Maiden
(77659,77655,0), -- Ymirjar Battle-Maiden
(77654,77655,0), -- Ymirjar Battle-Maiden
(77653,77655,0), -- Ymirjar Battle-Maiden
(47618,77655,0), -- Ymirjar Warlord
(92818,77655,0), -- Ymirjar Warlord
(78111,77655,0), -- Ymirjar Warlord
(78004,77655,0), -- Ymirjar Warlord
(96970,77655,0), -- Ymirjar Huntress
(96969,77655,0), -- Ymirjar Huntress
(77658,77655,0), -- Ymirjar Huntress
(77657,77655,0), -- Ymirjar Huntress
(77650,77655,0), -- Ymirjar Huntress
(77649,77655,0), -- Ymirjar Huntress
(78001,77655,0), -- Ymirjar Deathbringer
(78003,77655,0), -- Ymirjar Deathbringer
(169801,10718,0), -- The Lich King
(77648,77655,0), -- Captain Arnath
(77646,77655,0), -- Captain Brandon
(77645,77655,0), -- Captain Grondel
(77644,77655,0), -- Captain Rupert
(77647,77655,0); -- Crok Scourgebane

UPDATE `creature_template` SET `difficulty_entry_2`=0,`difficulty_entry_3`=0 WHERE `entry`=37122; -- Captain Arnath
UPDATE `creature_template` SET `difficulty_entry_2`=0,`difficulty_entry_3`=0 WHERE `entry`=37123; -- Captain Brandon
UPDATE `creature_template` SET `difficulty_entry_2`=0,`difficulty_entry_3`=0 WHERE `entry`=37124; -- Captain Grondel
UPDATE `creature_template` SET `difficulty_entry_2`=0,`difficulty_entry_3`=0 WHERE `entry`=37125; -- Captain Rupert
UPDATE `creature_template` SET `difficulty_entry_2`=0,`difficulty_entry_3`=0 WHERE `entry`=37129; -- Crok Scourgebane

UPDATE `creature_template` SET `baseattacktime`=1500 WHERE `entry` IN (37122,38298); -- Captain Arnath
UPDATE `creature_template` SET `baseattacktime`=1500 WHERE `entry` IN (37123,38299); -- Captain Brandon
UPDATE `creature_template` SET `baseattacktime`=1500 WHERE `entry` IN (37124,38303); -- Captain Grondel
UPDATE `creature_template` SET `baseattacktime`=1500 WHERE `entry` IN (37125,38304); -- Captain Rupert
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry` IN (37129,38000); -- Crok Scourgebane
-- Le pongo flags_extra e InhabitType como en TDB
UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=129 WHERE `entry`=38752; -- Green Dragon Combat Trigger
