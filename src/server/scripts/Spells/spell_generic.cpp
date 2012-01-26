/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Scripts for spells with SPELLFAMILY_GENERIC which cannot be included in AI script file
 * of creature using it or can't be bound to any player class.
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "spell_gen_"
 */

#include "ScriptPCH.h"
#include "SpellAuraEffects.h"
#include "SkillDiscovery.h"
#include "GridNotifiers.h"

class spell_gen_absorb0_hitlimit1 : public SpellScriptLoader
{
    public:
        spell_gen_absorb0_hitlimit1() : SpellScriptLoader("spell_gen_absorb0_hitlimit1") { }

        class spell_gen_absorb0_hitlimit1_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_absorb0_hitlimit1_AuraScript);

            uint32 limit;

            bool Load()
            {
                // Max absorb stored in 1 dummy effect
                limit = GetSpellInfo()->Effects[EFFECT_1].CalcValue();
                return true;
            }

            void Absorb(AuraEffect* /*aurEff*/, DamageInfo& /*dmgInfo*/, uint32& absorbAmount)
            {
                absorbAmount = std::min(limit, absorbAmount);
            }

            void Register()
            {
                 OnEffectAbsorb += AuraEffectAbsorbFn(spell_gen_absorb0_hitlimit1_AuraScript::Absorb, EFFECT_0);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_absorb0_hitlimit1_AuraScript();
        }
};

// 41337 Aura of Anger
class spell_gen_aura_of_anger : public SpellScriptLoader
{
    public:
        spell_gen_aura_of_anger() : SpellScriptLoader("spell_gen_aura_of_anger") { }

        class spell_gen_aura_of_anger_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_aura_of_anger_AuraScript);

            void HandleEffectPeriodicUpdate(AuraEffect* aurEff)
            {
                if (AuraEffect* aurEff1 = aurEff->GetBase()->GetEffect(EFFECT_1))
                    aurEff1->ChangeAmount(aurEff1->GetAmount() + 5);
                aurEff->SetAmount(100 * aurEff->GetTickNumber());
            }

            void Register()
            {
                OnEffectUpdatePeriodic += AuraEffectUpdatePeriodicFn(spell_gen_aura_of_anger_AuraScript::HandleEffectPeriodicUpdate, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_aura_of_anger_AuraScript();
        }
};

class spell_gen_av_drekthar_presence : public SpellScriptLoader
{
    public:
        spell_gen_av_drekthar_presence() : SpellScriptLoader("spell_gen_av_drekthar_presence") { }

        class spell_gen_av_drekthar_presence_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_av_drekthar_presence_AuraScript);

            bool CheckAreaTarget(Unit* target)
            {
                switch(target->GetEntry())
                {
                    // alliance
                    case 14762: // Dun Baldar North Marshal
                    case 14763: // Dun Baldar South Marshal
                    case 14764: // Icewing Marshal
                    case 14765: // Stonehearth Marshal
                    case 11948: // Vandar Stormspike
                    // horde
                    case 14772: // East Frostwolf Warmaster
                    case 14776: // Tower Point Warmaster
                    case 14773: // Iceblood Warmaster
                    case 14777: // West Frostwolf Warmaster
                    case 11946: // Drek'thar
                        return true;
                    default:
                        return false;
                        break;
                }
            }
            void Register()
            {
                DoCheckAreaTarget += AuraCheckAreaTargetFn(spell_gen_av_drekthar_presence_AuraScript::CheckAreaTarget);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_av_drekthar_presence_AuraScript();
        }
};

// 46394 Brutallus Burn
class spell_gen_burn_brutallus : public SpellScriptLoader
{
    public:
        spell_gen_burn_brutallus() : SpellScriptLoader("spell_gen_burn_brutallus") { }

        class spell_gen_burn_brutallus_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_burn_brutallus_AuraScript);

            void HandleEffectPeriodicUpdate(AuraEffect* aurEff)
            {
                if (aurEff->GetTickNumber() % 11 == 0)
                    aurEff->SetAmount(aurEff->GetAmount() * 2);
            }

            void Register()
            {
                OnEffectUpdatePeriodic += AuraEffectUpdatePeriodicFn(spell_gen_burn_brutallus_AuraScript::HandleEffectPeriodicUpdate, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_burn_brutallus_AuraScript();
        }
};

enum eCannibalizeSpells
{
    SPELL_CANNIBALIZE_TRIGGERED = 20578,
};

class spell_gen_cannibalize : public SpellScriptLoader
{
    public:
        spell_gen_cannibalize() : SpellScriptLoader("spell_gen_cannibalize") { }

        class spell_gen_cannibalize_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_cannibalize_SpellScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_CANNIBALIZE_TRIGGERED))
                    return false;
                return true;
            }

            SpellCastResult CheckIfCorpseNear()
            {
                Unit* caster = GetCaster();
                float max_range = GetSpellInfo()->GetMaxRange(false);
                WorldObject* result = NULL;
                // search for nearby enemy corpse in range
                Trinity::AnyDeadUnitSpellTargetInRangeCheck check(caster, max_range, GetSpellInfo(), TARGET_SELECT_CHECK_ENEMY);
                Trinity::WorldObjectSearcher<Trinity::AnyDeadUnitSpellTargetInRangeCheck> searcher(caster, result, check);
                caster->GetMap()->VisitFirstFound(caster->m_positionX, caster->m_positionY, max_range, searcher);
                if (!result)
                    return SPELL_FAILED_NO_EDIBLE_CORPSES;
                return SPELL_CAST_OK;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                caster->CastSpell(caster, SPELL_CANNIBALIZE_TRIGGERED, false);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_cannibalize_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
                OnCheckCast += SpellCheckCastFn(spell_gen_cannibalize_SpellScript::CheckIfCorpseNear);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_cannibalize_SpellScript();
        }
};

// 45472 Parachute
enum eParachuteSpells
{
    SPELL_PARACHUTE         = 45472,
    SPELL_PARACHUTE_BUFF    = 44795,
};

class spell_gen_parachute : public SpellScriptLoader
{
    public:
        spell_gen_parachute() : SpellScriptLoader("spell_gen_parachute") { }

        class spell_gen_parachute_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_parachute_AuraScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_PARACHUTE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_PARACHUTE_BUFF))
                    return false;
                return true;
            }

            void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (Player* target = GetTarget()->ToPlayer())
                {
                    if (target->IsFalling())
                    {
                        target->RemoveAurasDueToSpell(SPELL_PARACHUTE);
                        target->CastSpell(target, SPELL_PARACHUTE_BUFF, true);
                    }
                }
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_parachute_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_parachute_AuraScript();
        }
};

enum NPCEntries
{
    NPC_DOOMGUARD   = 11859,
    NPC_INFERNAL    = 89,
    NPC_IMP         = 416,
};

class spell_gen_pet_summoned : public SpellScriptLoader
{
    public:
        spell_gen_pet_summoned() : SpellScriptLoader("spell_gen_pet_summoned") { }

        class spell_gen_pet_summoned_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_pet_summoned_SpellScript);

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->GetTypeId() != TYPEID_PLAYER)
                    return;

                Player* player = caster->ToPlayer();
                if (player->GetLastPetNumber())
                {
                    PetType newPetType = (player->getClass() == CLASS_HUNTER) ? HUNTER_PET : SUMMON_PET;
                    if (Pet* newPet = new Pet(player, newPetType))
                    {
                        if (newPet->LoadPetFromDB(player, 0, player->GetLastPetNumber(), true))
                        {
                            // revive the pet if it is dead
                            if (newPet->getDeathState() == DEAD)
                                newPet->setDeathState(ALIVE);

                            newPet->SetFullHealth();
                            newPet->SetPower(newPet->getPowerType(), newPet->GetMaxPower(newPet->getPowerType()));

                            switch (newPet->GetEntry())
                            {
                                case NPC_DOOMGUARD:
                                case NPC_INFERNAL:
                                    newPet->SetEntry(NPC_IMP);
                                    break;
                                default:
                                    break;
                            }
                        }
                        else
                            delete newPet;
                    }
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_pet_summoned_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_pet_summoned_SpellScript();
        }
};

class spell_gen_remove_flight_auras : public SpellScriptLoader
{
    public:
        spell_gen_remove_flight_auras() : SpellScriptLoader("spell_gen_remove_flight_auras") {}

        class spell_gen_remove_flight_auras_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_remove_flight_auras_SpellScript);
            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                Unit* target = GetHitUnit();
                if (!target)
                    return;
                target->RemoveAurasByType(SPELL_AURA_FLY);
                target->RemoveAurasByType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_remove_flight_auras_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_remove_flight_auras_SpellScript();
        }
};

// 66118 Leeching Swarm
enum eLeechingSwarmSpells
{
    SPELL_LEECHING_SWARM_DMG    = 66240,
    SPELL_LEECHING_SWARM_HEAL   = 66125,
};

class spell_gen_leeching_swarm : public SpellScriptLoader
{
    public:
        spell_gen_leeching_swarm() : SpellScriptLoader("spell_gen_leeching_swarm") { }

        class spell_gen_leeching_swarm_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_leeching_swarm_AuraScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_LEECHING_SWARM_DMG))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_LEECHING_SWARM_HEAL))
                    return false;
                return true;
            }

            void HandleEffectPeriodic(AuraEffect const* aurEff)
            {
                if (Unit* caster = GetCaster())
                {
                    int32 lifeLeeched = GetTarget()->CountPctFromCurHealth(aurEff->GetAmount());
                    if (lifeLeeched < 250)
                        lifeLeeched = 250;
                    // Damage
                    caster->CastCustomSpell(GetTarget(), SPELL_LEECHING_SWARM_DMG, &lifeLeeched, 0, 0, false);
                    // Heal
                    caster->CastCustomSpell(caster, SPELL_LEECHING_SWARM_HEAL, &lifeLeeched, 0, 0, false);
                }
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_leeching_swarm_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_leeching_swarm_AuraScript();
        }
};

// 24750 Trick
enum eTrickSpells
{
    SPELL_PIRATE_COSTUME_MALE           = 24708,
    SPELL_PIRATE_COSTUME_FEMALE         = 24709,
    SPELL_NINJA_COSTUME_MALE            = 24710,
    SPELL_NINJA_COSTUME_FEMALE          = 24711,
    SPELL_LEPER_GNOME_COSTUME_MALE      = 24712,
    SPELL_LEPER_GNOME_COSTUME_FEMALE    = 24713,
    SPELL_SKELETON_COSTUME              = 24723,
    SPELL_GHOST_COSTUME_MALE            = 24735,
    SPELL_GHOST_COSTUME_FEMALE          = 24736,
    SPELL_TRICK_BUFF                    = 24753,
};

class spell_gen_trick : public SpellScriptLoader
{
    public:
        spell_gen_trick() : SpellScriptLoader("spell_gen_trick") {}

        class spell_gen_trick_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_trick_SpellScript);
            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_PIRATE_COSTUME_MALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_PIRATE_COSTUME_FEMALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_NINJA_COSTUME_MALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_NINJA_COSTUME_FEMALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_LEPER_GNOME_COSTUME_MALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_LEPER_GNOME_COSTUME_FEMALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_SKELETON_COSTUME))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_GHOST_COSTUME_MALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_GHOST_COSTUME_FEMALE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_TRICK_BUFF))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                if (Player* target = GetHitPlayer())
                {
                    uint8 gender = target->getGender();
                    uint32 spellId = SPELL_TRICK_BUFF;
                    switch (urand(0, 5))
                    {
                        case 1:
                            spellId = gender ? SPELL_LEPER_GNOME_COSTUME_FEMALE : SPELL_LEPER_GNOME_COSTUME_MALE;
                            break;
                        case 2:
                            spellId = gender ? SPELL_PIRATE_COSTUME_FEMALE : SPELL_PIRATE_COSTUME_MALE;
                            break;
                        case 3:
                            spellId = gender ? SPELL_GHOST_COSTUME_FEMALE : SPELL_GHOST_COSTUME_MALE;
                            break;
                        case 4:
                            spellId = gender ? SPELL_NINJA_COSTUME_FEMALE : SPELL_NINJA_COSTUME_MALE;
                            break;
                        case 5:
                            spellId = SPELL_SKELETON_COSTUME;
                            break;
                        default:
                            break;
                    }

                    GetCaster()->CastSpell(target, spellId, true, NULL);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_trick_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_trick_SpellScript();
        }
};

// 24751 Trick or Treat
enum TrickOrTreatSpells
{
    SPELL_TRICK                 = 24714,
    SPELL_TREAT                 = 24715,
    SPELL_TRICKED_OR_TREATED    = 24755,
    SPELL_TRICKY_TREAT_SPEED    = 42919,
    SPELL_TRICKY_TREAT_TRIGGER  = 42965,
    SPELL_UPSET_TUMMY           = 42966
};

class spell_gen_trick_or_treat : public SpellScriptLoader
{
    public:
        spell_gen_trick_or_treat() : SpellScriptLoader("spell_gen_trick_or_treat") {}

        class spell_gen_trick_or_treat_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_trick_or_treat_SpellScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_TRICK))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_TREAT))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_TRICKED_OR_TREATED))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                if (Player* target = GetHitPlayer())
                {
                    GetCaster()->CastSpell(target, roll_chance_i(50) ? SPELL_TRICK : SPELL_TREAT, true, NULL);
                    GetCaster()->CastSpell(target, SPELL_TRICKED_OR_TREATED, true, NULL);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_trick_or_treat_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_trick_or_treat_SpellScript();
        }
};

class spell_gen_tricky_treat : public SpellScriptLoader
{
    public:
        spell_gen_tricky_treat() : SpellScriptLoader("spell_gen_tricky_treat") {}

        class spell_gen_tricky_treat_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_tricky_treat_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_TRICKY_TREAT_SPEED))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_TRICKY_TREAT_TRIGGER))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_UPSET_TUMMY))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                if (Unit* caster = GetCaster())
                    if (caster->HasAura(SPELL_TRICKY_TREAT_TRIGGER) && caster->GetAuraCount(SPELL_TRICKY_TREAT_SPEED) > 3 && roll_chance_i(33))
                        caster->CastSpell(caster, SPELL_UPSET_TUMMY, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_tricky_treat_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_tricky_treat_SpellScript();
        }
};

class spell_creature_permanent_feign_death : public SpellScriptLoader
{
    public:
        spell_creature_permanent_feign_death() : SpellScriptLoader("spell_creature_permanent_feign_death") { }

        class spell_creature_permanent_feign_death_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_creature_permanent_feign_death_AuraScript);

            void HandleEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* target = GetTarget();
                target->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
                target->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_creature_permanent_feign_death_AuraScript::HandleEffectApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_creature_permanent_feign_death_AuraScript();
        }
};

enum PvPTrinketTriggeredSpells
{
    SPELL_WILL_OF_THE_FORSAKEN_COOLDOWN_TRIGGER         = 72752,
    SPELL_WILL_OF_THE_FORSAKEN_COOLDOWN_TRIGGER_WOTF    = 72757,
};

class spell_pvp_trinket_wotf_shared_cd : public SpellScriptLoader
{
    public:
        spell_pvp_trinket_wotf_shared_cd() : SpellScriptLoader("spell_pvp_trinket_wotf_shared_cd") {}

        class spell_pvp_trinket_wotf_shared_cd_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_pvp_trinket_wotf_shared_cd_SpellScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_WILL_OF_THE_FORSAKEN_COOLDOWN_TRIGGER))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_WILL_OF_THE_FORSAKEN_COOLDOWN_TRIGGER_WOTF))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                Player* caster = GetCaster()->ToPlayer();
                if (!caster)
                    return;
                SpellInfo const* spellInfo = GetSpellInfo();

                caster->AddSpellCooldown(spellInfo->Id, 0, time(NULL) + sSpellMgr->GetSpellInfo(SPELL_WILL_OF_THE_FORSAKEN_COOLDOWN_TRIGGER)->GetRecoveryTime() / IN_MILLISECONDS);
                WorldPacket data(SMSG_SPELL_COOLDOWN, 8+1+4);
                data << uint64(caster->GetGUID());
                data << uint8(0);
                data << uint32(spellInfo->Id);
                data << uint32(0);
                caster->GetSession()->SendPacket(&data);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_pvp_trinket_wotf_shared_cd_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_pvp_trinket_wotf_shared_cd_SpellScript();
        }
};

enum AnimalBloodPoolSpell
{
    SPELL_ANIMAL_BLOOD      = 46221,
    SPELL_SPAWN_BLOOD_POOL  = 63471,
};

class spell_gen_animal_blood : public SpellScriptLoader
{
    public:
        spell_gen_animal_blood() : SpellScriptLoader("spell_gen_animal_blood") { }

        class spell_gen_animal_blood_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_animal_blood_AuraScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_SPAWN_BLOOD_POOL))
                    return false;
                return true;
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                // Remove all auras with spell id 46221, except the one currently being applied
                while (Aura* aur = GetUnitOwner()->GetOwnedAura(SPELL_ANIMAL_BLOOD, 0, 0, 0, GetAura()))
                    GetUnitOwner()->RemoveOwnedAura(aur);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (GetUnitOwner()->IsInWater())
                    GetUnitOwner()->CastSpell(GetUnitOwner(), SPELL_SPAWN_BLOOD_POOL, true);
            }

            void Register()
            {
                AfterEffectApply += AuraEffectRemoveFn(spell_gen_animal_blood_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
                AfterEffectRemove += AuraEffectRemoveFn(spell_gen_animal_blood_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_animal_blood_AuraScript();
        }
};

enum DivineStormSpell
{
    SPELL_DIVINE_STORM  = 53385,
};

// 70769 Divine Storm!
class spell_gen_divine_storm_cd_reset : public SpellScriptLoader
{
    public:
        spell_gen_divine_storm_cd_reset() : SpellScriptLoader("spell_gen_divine_storm_cd_reset") {}

        class spell_gen_divine_storm_cd_reset_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_divine_storm_cd_reset_SpellScript);

            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_DIVINE_STORM))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                if (Player* caster = GetCaster()->ToPlayer())
                    if (caster->HasSpellCooldown(SPELL_DIVINE_STORM))
                        caster->RemoveSpellCooldown(SPELL_DIVINE_STORM, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_divine_storm_cd_reset_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_divine_storm_cd_reset_SpellScript();
        }
};

class spell_gen_gunship_portal : public SpellScriptLoader
{
    public:
        spell_gen_gunship_portal() : SpellScriptLoader("spell_gen_gunship_portal") { }

        class spell_gen_gunship_portal_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_gunship_portal_SpellScript);

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->GetTypeId() != TYPEID_PLAYER)
                    return;

                if (Battleground* bg = caster->ToPlayer()->GetBattleground())
                    if (bg->GetTypeID(true) == BATTLEGROUND_IC)
                        bg->DoAction(1, caster->GetGUID());
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_gunship_portal_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_gunship_portal_SpellScript();
        }
};

enum parachuteIC
{
    SPELL_PARACHUTE_IC = 66657
};

class spell_gen_parachute_ic : public SpellScriptLoader
{
    public:
        spell_gen_parachute_ic() : SpellScriptLoader("spell_gen_parachute_ic") { }

        class spell_gen_parachute_ic_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_parachute_ic_AuraScript)

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                Unit* target = GetTarget();

                if (!target->ToPlayer())
                    return;

                if (target->ToPlayer()->m_movementInfo.fallTime > 2000)
                    target->CastSpell(target,SPELL_PARACHUTE_IC,true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_parachute_ic_AuraScript::HandleTriggerSpell, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_parachute_ic_AuraScript();
        }
};

class spell_gen_dungeon_credit : public SpellScriptLoader
{
    public:
        spell_gen_dungeon_credit() : SpellScriptLoader("spell_gen_dungeon_credit") { }

        class spell_gen_dungeon_credit_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_dungeon_credit_SpellScript);

            bool Load()
            {
                _handled = false;
                return true;
            }

            void CreditEncounter()
            {
                // This hook is executed for every target, make sure we only credit instance once
                if (_handled)
                    return;

                _handled = true;
                if (GetCaster()->GetTypeId() == TYPEID_UNIT)
                    if (InstanceScript* instance = GetCaster()->GetInstanceScript())
                        instance->UpdateEncounterState(ENCOUNTER_CREDIT_CAST_SPELL, GetSpellInfo()->Id, GetCaster());
            }

            void Register()
            {
                AfterHit += SpellHitFn(spell_gen_dungeon_credit_SpellScript::CreditEncounter);
            }

            bool _handled;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_dungeon_credit_SpellScript();
        }
};

class spell_gen_profession_research : public SpellScriptLoader
{
    public:
        spell_gen_profession_research() : SpellScriptLoader("spell_gen_profession_research") {}

        class spell_gen_profession_research_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_profession_research_SpellScript);

            SpellCastResult CheckRequirement()
            {
                if (GetCaster()->GetTypeId() == TYPEID_PLAYER && HasDiscoveredAllSpells(GetSpellInfo()->Id, GetCaster()->ToPlayer()))
                {
                    SetCustomCastResultMessage(SPELL_CUSTOM_ERROR_NOTHING_TO_DISCOVER);
                    return SPELL_FAILED_CUSTOM_ERROR;
                }

                return SPELL_CAST_OK;
            }

            void Register()
            {
                OnCheckCast += SpellCheckCastFn(spell_gen_profession_research_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_profession_research_SpellScript();
        }
};

class spell_generic_clone : public SpellScriptLoader
{
    public:
        spell_generic_clone() : SpellScriptLoader("spell_generic_clone") { }

        class spell_generic_clone_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_generic_clone_SpellScript);

            void HandleScriptEffect(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit* caster = GetCaster();
                uint32 spellId = uint32(GetSpellInfo()->Effects[effIndex].CalcValue());

                if (Unit* target = GetHitUnit())
                    target->CastSpell(caster, spellId, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_generic_clone_SpellScript::HandleScriptEffect, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
                OnEffect += SpellEffectFn(spell_generic_clone_SpellScript::HandleScriptEffect, EFFECT_2, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_generic_clone_SpellScript();
        }
};

enum CloneWeaponSpells
{
    SPELL_COPY_WEAPON       = 41055,
    SPELL_COPY_WEAPON_2     = 63416,
    SPELL_COPY_WEAPON_3     = 69891,

    SPELL_COPY_OFFHAND      = 45206,
    SPELL_COPY_OFFHAND_2    = 69892,

    SPELL_COPY_RANGED       = 57593
};

class spell_generic_clone_weapon : public SpellScriptLoader
{
    public:
        spell_generic_clone_weapon() : SpellScriptLoader("spell_generic_clone_weapon") { }

        class spell_generic_clone_weapon_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_generic_clone_weapon_SpellScript);
            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_WEAPON))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_WEAPON_2))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_WEAPON_3))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_OFFHAND))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_OFFHAND_2))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_COPY_RANGED))
                    return false;
                return true;
            }

            void HandleScriptEffect(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();

                if (!target)
                    return;

                uint32 spellId = uint32(GetSpellInfo()->Effects[EFFECT_0].CalcValue());
                target->CastSpell(caster, spellId, true);

                if (target->GetTypeId() == TYPEID_PLAYER)
                    return;

                switch (GetSpellInfo()->Id)
                {
                    case SPELL_COPY_WEAPON:
                    case SPELL_COPY_WEAPON_2:
                    case SPELL_COPY_WEAPON_3:
                    {
                        if (Player* player = caster->ToPlayer())
                        {
                            if (Item* mainItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND))
                                target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID, mainItem->GetEntry());
                        }
                        else
                            target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID, caster->GetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID));
                        break;
                    }
                    case SPELL_COPY_OFFHAND:
                    case SPELL_COPY_OFFHAND_2:
                    {
                        if (Player* player = caster->ToPlayer())
                        {
                            if (Item* offItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND))
                                target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 1, offItem->GetEntry());
                        }
                        else
                            target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 1, caster->GetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 1));
                        break;
                    }
                    case SPELL_COPY_RANGED:
                    {
                        if (Player* player = caster->ToPlayer())
                        {
                            if (Item* rangedItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_RANGED))
                                target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 2, rangedItem->GetEntry());
                        }
                        else
                            target->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 2, caster->GetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + 2));
                        break;
                    }
                    default:
                        break;
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_generic_clone_weapon_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_generic_clone_weapon_SpellScript();
        }
};

enum SeaforiumSpells
{
    SPELL_PLANT_CHARGES_CREDIT_ACHIEVEMENT = 60937,
};

class spell_gen_seaforium_blast : public SpellScriptLoader
{
    public:
        spell_gen_seaforium_blast() : SpellScriptLoader("spell_gen_seaforium_blast") {}

        class spell_gen_seaforium_blast_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_seaforium_blast_SpellScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_PLANT_CHARGES_CREDIT_ACHIEVEMENT))
                    return false;
                return true;
            }

            bool Load()
            {
                // OriginalCaster is always available in Spell::prepare
                return GetOriginalCaster()->GetTypeId() == TYPEID_PLAYER;
            }

            void AchievementCredit(SpellEffIndex /*effIndex*/)
            {
                // but in effect handling OriginalCaster can become NULL
                if (!GetOriginalCaster() || !GetHitGObj() || GetHitGObj()->GetGOInfo()->type != GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING)
                    return;

                GetOriginalCaster()->CastSpell(GetOriginalCaster(), SPELL_PLANT_CHARGES_CREDIT_ACHIEVEMENT, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_seaforium_blast_SpellScript::AchievementCredit, EFFECT_1, SPELL_EFFECT_GAMEOBJECT_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_seaforium_blast_SpellScript();
        }
};

enum FriendOrFowl
{
    SPELL_TURKEY_VENGEANCE  = 25285,
};

class spell_gen_turkey_marker : public SpellScriptLoader
{
    public:
        spell_gen_turkey_marker() : SpellScriptLoader("spell_gen_turkey_marker") { }

        class spell_gen_turkey_marker_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_turkey_marker_AuraScript);

            void OnApply(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
            {
                // store stack apply times, so we can pop them while they expire
                _applyTimes.push_back(getMSTime());

                // on stack 15 cast the achievement crediting spell
                if (GetStackAmount() >= 15)
                    GetTarget()->CastSpell(GetTarget(), SPELL_TURKEY_VENGEANCE, true, NULL, aurEff, GetCasterGUID());
            }

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (_applyTimes.empty())
                    return;

                // pop stack if it expired for us
                if (_applyTimes.front() + GetMaxDuration() < getMSTime())
                    ModStackAmount(-1, AURA_REMOVE_BY_EXPIRE);
            }

            void Register()
            {
                AfterEffectApply += AuraEffectApplyFn(spell_gen_turkey_marker_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_turkey_marker_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }

            std::list<uint32> _applyTimes;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_turkey_marker_AuraScript();
        }
};

class spell_gen_lifeblood : public SpellScriptLoader
{
    public:
        spell_gen_lifeblood() : SpellScriptLoader("spell_gen_lifeblood") { }

        class spell_gen_lifeblood_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_lifeblood_AuraScript);

            void CalculateAmount(AuraEffect const* aurEff, int32& amount, bool& /*canBeRecalculated*/)
            {
                if (Unit* owner = GetUnitOwner())
                    amount += int32(CalculatePctF(owner->GetMaxHealth(), 1.5f / aurEff->GetTotalTicks()));
            }

            void Register()
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_gen_lifeblood_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_PERIODIC_HEAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_lifeblood_AuraScript();
        }
};

enum MagicRoosterSpells
{
    SPELL_MAGIC_ROOSTER_NORMAL          = 66122,
    SPELL_MAGIC_ROOSTER_DRAENEI_MALE    = 66123,
    SPELL_MAGIC_ROOSTER_TAUREN_MALE     = 66124,
};

class spell_gen_magic_rooster : public SpellScriptLoader
{
    public:
        spell_gen_magic_rooster() : SpellScriptLoader("spell_gen_magic_rooster") { }

        class spell_gen_magic_rooster_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_magic_rooster_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                // prevent client crashes from stacking mounts
                target->RemoveAurasByType(SPELL_AURA_MOUNTED);

                uint32 spellId = SPELL_MAGIC_ROOSTER_NORMAL;
                switch (target->getRace())
                {
                    case RACE_DRAENEI:
                        if (target->getGender() == GENDER_MALE)
                            spellId = SPELL_MAGIC_ROOSTER_DRAENEI_MALE;
                        break;
                    case RACE_TAUREN:
                        if (target->getGender() == GENDER_MALE)
                            spellId = SPELL_MAGIC_ROOSTER_TAUREN_MALE;
                        break;
                    default:
                        break;
                }

                target->CastSpell(target, spellId, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_magic_rooster_SpellScript::HandleScript, EFFECT_2, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_magic_rooster_SpellScript();
        }
};

class spell_gen_allow_cast_from_item_only : public SpellScriptLoader
{
public:
    spell_gen_allow_cast_from_item_only() : SpellScriptLoader("spell_gen_allow_cast_from_item_only") { }

    class spell_gen_allow_cast_from_item_only_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_gen_allow_cast_from_item_only_SpellScript);

        SpellCastResult CheckRequirement()
        {
            if (!GetCastItem())
                return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

            return SPELL_CAST_OK;
        }

        void Register()
        {
            OnCheckCast += SpellCheckCastFn(spell_gen_allow_cast_from_item_only_SpellScript::CheckRequirement);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_gen_allow_cast_from_item_only_SpellScript();
    }
};

enum Launch
{
    SPELL_LAUNCH_NO_FALLING_DAMAGE = 66251
};

class spell_gen_launch : public SpellScriptLoader
{
    public:
        spell_gen_launch() : SpellScriptLoader("spell_gen_launch") {}

        class spell_gen_launch_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_launch_SpellScript);

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                if (Player* player = GetHitPlayer())
                    player->AddAura(SPELL_LAUNCH_NO_FALLING_DAMAGE,player); // prevents falling damage
            }

            void Launch()
            {
                WorldLocation const* const position = GetTargetDest();

                if (Player* player = GetHitPlayer())
                {
                    player->ExitVehicle();

                    // A better research is needed
                    // There is no spell for this, the following calculation was based on void Spell::CalculateJumpSpeeds

                    float speedZ = 10.0f;
                    float dist = position->GetExactDist2d(player->GetPositionX(),player->GetPositionY());
                    float speedXY = dist;

                    player->GetMotionMaster()->MoveJump(position->GetPositionX(),position->GetPositionY(),position->GetPositionZ(),speedXY,speedZ);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_launch_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_FORCE_CAST);
                AfterHit += SpellHitFn(spell_gen_launch_SpellScript::Launch);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_launch_SpellScript();
        }
};

class spell_gen_vehicle_scaling : public SpellScriptLoader
{
    public:
        spell_gen_vehicle_scaling() : SpellScriptLoader("spell_gen_vehicle_scaling") { }

        class spell_gen_vehicle_scaling_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_vehicle_scaling_AuraScript);

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
            {
                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return;

                float factor;
                uint16 baseItemLevel;

                // TODO: Reserach coeffs for different vehicles
                switch (GetId())
                {
                    case 66668:
                        factor = 1.0f;
                        baseItemLevel = 205;
                        break;
                    default:
                        factor = 1.0f;
                        baseItemLevel = 170;
                        break;
                }

                float avgILvl = caster->ToPlayer()->GetAverageItemLevel();
                if (avgILvl < baseItemLevel)
                    return;                     // TODO: Research possibility of scaling down

                amount = uint16((avgILvl - baseItemLevel) * factor);
            }

            void Register()
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_gen_vehicle_scaling_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_MOD_HEALING_PCT);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_gen_vehicle_scaling_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_gen_vehicle_scaling_AuraScript::CalculateAmount, EFFECT_2, SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_vehicle_scaling_AuraScript();
        }
};

/*##################################
# Pilgrim's bounty - The Turkinator
###################################*/

enum TheTurkinator
{
    SPELL_KILL_COUNTER_VISUAL       = 62015,
    SPELL_KILL_COUNTER_VISUAL_MAX   = 62021,
};

class spell_gen_turkey_tracker : public SpellScriptLoader
{
    public:
        spell_gen_turkey_tracker() : SpellScriptLoader("spell_gen_turkey_tracker") {}

        class spell_gen_turkey_tracker_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_turkey_tracker_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_KILL_COUNTER_VISUAL))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_KILL_COUNTER_VISUAL_MAX))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex /*effIndex*/)
            {

                if (GetCaster()->GetAura(SPELL_KILL_COUNTER_VISUAL_MAX))
                    return;

                Player* target = GetHitPlayer();
                if (!target)
                    return;
 
                if (Aura const* aura = GetCaster()->ToPlayer()->GetAura(GetSpellInfo()->Id))
                {
                    switch (aura->GetStackAmount())
                    {
                        case 10:
                            target->MonsterTextEmote("Turkey Hunter!", 0, true);
                            GetCaster()->CastSpell(target, SPELL_KILL_COUNTER_VISUAL, true, NULL);
                            break;
                        case 20:
                            target->MonsterTextEmote("Turkey Domination!", 0, true);
                            GetCaster()->CastSpell(target, SPELL_KILL_COUNTER_VISUAL, true, NULL);
                            break;
                        case 30:
                            target->MonsterTextEmote("Turkey Slaughter!", 0, true);
                            GetCaster()->CastSpell(target, SPELL_KILL_COUNTER_VISUAL, true, NULL);
                            break;
                        case 40:
                            target->MonsterTextEmote("TURKEY TRIUMPH!", 0, true);
                            GetCaster()->CastSpell(target, SPELL_KILL_COUNTER_VISUAL, true, NULL);
                            GetCaster()->CastSpell(target, SPELL_KILL_COUNTER_VISUAL_MAX, true, NULL); // Achievement Credit
                            break;
                        default:
                            break;
                    }
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_turkey_tracker_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_turkey_tracker_SpellScript();
        }
};

/*######################################
# Pilgrim's Bounty - spell_gen_feast_on
######################################*/

class spell_gen_feast_on : public SpellScriptLoader
{
    public:
        spell_gen_feast_on() : SpellScriptLoader("spell_gen_feast_on") { }

        class spell_gen_feast_on_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_feast_on_SpellScript);

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                int32 basePoints0 = SpellMgr::CalculateSpellEffectAmount(GetSpellInfo(), EFFECT_0);

                if (Unit* caster = GetCaster())
                    if (caster->IsVehicle())
                        if (Unit* passenger = caster->GetVehicleKit()->GetPassenger(0))
                            if (Player* player = passenger->ToPlayer())
                                player->CastSpell(player, basePoints0, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_feast_on_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_feast_on_SpellScript();
        }
};

/*#############################################################
# Pilgrim's Bounty - fed_pilgrims_bount AND Pilgrim's Paunch
###############################################################*/
enum WellFedPilgrimsBount
{
    // Feast On
    SPELL_A_SERVING_OF_TURKEY           = 61807,
    SPELL_A_SERVING_OF_CRANBERRIES      = 61804,
    SPELL_A_SERVING_OF_STUFFING         = 61806,
    SPELL_A_SERVING_OF_SWEET_POTATOES   = 61808,
    SPELL_A_SERVING_OF_PIE              = 61805,

    // Well Fed
    SPELL_WELL_FED_AP                   = 65414,
    SPELL_WELL_FED_ZM                   = 65412,
    SPELL_WELL_FED_HIT                  = 65416,
    SPELL_WELL_FED_HASTE                = 65410,
    SPELL_WELL_FED_SPIRIT               = 65415,

    // Pilgrim's Paunch	
    SPELL_THE_SPIRIT_OF_SHARING         = 61849,
};

class spell_gen_well_fed_pilgrims_bount_ap : public SpellScriptLoader
{
    public:
        spell_gen_well_fed_pilgrims_bount_ap() : SpellScriptLoader("spell_gen_well_fed_pilgrims_bount_ap") {}

        class spell_gen_well_fed_pilgrims_bount_ap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_well_fed_pilgrims_bount_ap_SpellScript);

			bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_WELL_FED_AP))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                Aura const* Turkey = target->GetAura(SPELL_A_SERVING_OF_TURKEY);
                Aura const* Cranberies = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES);
                Aura const* Stuffing = target->GetAura(SPELL_A_SERVING_OF_STUFFING);
                Aura const* SweetPotatoes = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES);
                Aura const* Pie = target->GetAura(SPELL_A_SERVING_OF_PIE);

                // A Serving of Turkey - Attack power and Stamina
                if (Aura const* aura = target->GetAura(SPELL_A_SERVING_OF_TURKEY))
                {
                    if (aura->GetStackAmount() == 5)
                        target->CastSpell(target, SPELL_WELL_FED_AP, true);
                }

                // The Spirit of Sharing - Achievement Credit
                if (!target->GetAura(SPELL_THE_SPIRIT_OF_SHARING))
                {
                    if ((Turkey && Turkey->GetStackAmount() == 5) && (Cranberies && Cranberies->GetStackAmount() == 5) && (Stuffing && Stuffing->GetStackAmount() == 5) &&
                        (SweetPotatoes && SweetPotatoes->GetStackAmount() == 5) && (Pie && Pie->GetStackAmount() == 5))
                        target->CastSpell(target, SPELL_THE_SPIRIT_OF_SHARING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_well_fed_pilgrims_bount_ap_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_well_fed_pilgrims_bount_ap_SpellScript();
        }
};

class spell_gen_well_fed_pilgrims_bount_zm : public SpellScriptLoader
{
    public:
        spell_gen_well_fed_pilgrims_bount_zm() : SpellScriptLoader("spell_gen_well_fed_pilgrims_bount_zm") {}

        class spell_gen_well_fed_pilgrims_bount_zm_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_well_fed_pilgrims_bount_zm_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_WELL_FED_ZM))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {                
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                Aura const* Turkey = target->GetAura(SPELL_A_SERVING_OF_TURKEY);
                Aura const* Cranberies = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES);
                Aura const* Stuffing = target->GetAura(SPELL_A_SERVING_OF_STUFFING);
                Aura const* SweetPotatoes = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES);
                Aura const* Pie = target->GetAura(SPELL_A_SERVING_OF_PIE);

                // A Serving of Cranberries - Spell power and Stamina
                if (Aura const* aura = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES))
                {
                    if (aura->GetStackAmount() == 5)
                        target->CastSpell(target, SPELL_WELL_FED_ZM, true);
                }

                // The Spirit of Sharing - Achievement Credit
                if (!target->GetAura(SPELL_THE_SPIRIT_OF_SHARING))
                {
                    if ((Turkey && Turkey->GetStackAmount() == 5) && (Cranberies && Cranberies->GetStackAmount() == 5) && (Stuffing && Stuffing->GetStackAmount() == 5) &&
                        (SweetPotatoes && SweetPotatoes->GetStackAmount() == 5) && (Pie && Pie->GetStackAmount() == 5))
                        target->CastSpell(target, SPELL_THE_SPIRIT_OF_SHARING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_well_fed_pilgrims_bount_zm_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_well_fed_pilgrims_bount_zm_SpellScript();
        }
};

class spell_gen_well_fed_pilgrims_bount_hit : public SpellScriptLoader
{
    public:
        spell_gen_well_fed_pilgrims_bount_hit() : SpellScriptLoader("spell_gen_well_fed_pilgrims_bount_hit") {}

        class spell_gen_well_fed_pilgrims_bount_hit_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_well_fed_pilgrims_bount_hit_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_WELL_FED_HIT))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                Aura const* Turkey = target->GetAura(SPELL_A_SERVING_OF_TURKEY);
                Aura const* Cranberies = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES);
                Aura const* Stuffing = target->GetAura(SPELL_A_SERVING_OF_STUFFING);
                Aura const* SweetPotatoes = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES);
                Aura const* Pie = target->GetAura(SPELL_A_SERVING_OF_PIE);

                // A Serving of Stuffing - Hit rating and Stamina
                if (Aura const* aura = target->GetAura(SPELL_A_SERVING_OF_STUFFING))
                {
                    if (aura->GetStackAmount() == 5)
                        target->CastSpell(target, SPELL_WELL_FED_HIT, true);
                }

                // The Spirit of Sharing - Achievement Credit
                if (!target->GetAura(SPELL_THE_SPIRIT_OF_SHARING))
                {
                    if ((Turkey && Turkey->GetStackAmount() == 5) && (Cranberies && Cranberies->GetStackAmount() == 5) && (Stuffing && Stuffing->GetStackAmount() == 5) &&
                        (SweetPotatoes && SweetPotatoes->GetStackAmount() == 5) && (Pie && Pie->GetStackAmount() == 5))
                        target->CastSpell(target, SPELL_THE_SPIRIT_OF_SHARING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_well_fed_pilgrims_bount_hit_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_well_fed_pilgrims_bount_hit_SpellScript();
        }
};

class spell_gen_well_fed_pilgrims_bount_haste : public SpellScriptLoader
{
    public:
        spell_gen_well_fed_pilgrims_bount_haste() : SpellScriptLoader("spell_gen_well_fed_pilgrims_bount_haste") {}

        class spell_gen_well_fed_pilgrims_bount_haste_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_well_fed_pilgrims_bount_haste_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_WELL_FED_HASTE))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                Aura const* Turkey = target->GetAura(SPELL_A_SERVING_OF_TURKEY);
                Aura const* Cranberies = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES);
                Aura const* Stuffing = target->GetAura(SPELL_A_SERVING_OF_STUFFING);
                Aura const* SweetPotatoes = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES);
                Aura const* Pie = target->GetAura(SPELL_A_SERVING_OF_PIE);

                // A Serving of Sweet Potatoes - Haste rating and Stamina
                if (Aura const* aura = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES))
                {
                    if (aura->GetStackAmount() == 5)
                        target->CastSpell(target, SPELL_WELL_FED_HASTE, true);
                }

                // The Spirit of Sharing - Achievement Credit
                if (!target->GetAura(SPELL_THE_SPIRIT_OF_SHARING))
                {
                    if ((Turkey && Turkey->GetStackAmount() == 5) && (Cranberies && Cranberies->GetStackAmount() == 5) && (Stuffing && Stuffing->GetStackAmount() == 5) &&
                        (SweetPotatoes && SweetPotatoes->GetStackAmount() == 5) && (Pie && Pie->GetStackAmount() == 5))
                        target->CastSpell(target, SPELL_THE_SPIRIT_OF_SHARING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_well_fed_pilgrims_bount_haste_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }

        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_well_fed_pilgrims_bount_haste_SpellScript();
        }
};

class spell_gen_well_fed_pilgrims_bount_spirit : public SpellScriptLoader
{
    public:
        spell_gen_well_fed_pilgrims_bount_spirit() : SpellScriptLoader("spell_gen_well_fed_pilgrims_bount_spirit") {}

        class spell_gen_well_fed_pilgrims_bount_spirit_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_well_fed_pilgrims_bount_spirit_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_WELL_FED_SPIRIT))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* target = GetHitPlayer();
                if (!target)
                    return;

                Aura const* Turkey = target->GetAura(SPELL_A_SERVING_OF_TURKEY);
                Aura const* Cranberies = target->GetAura(SPELL_A_SERVING_OF_CRANBERRIES);
                Aura const* Stuffing = target->GetAura(SPELL_A_SERVING_OF_STUFFING);
                Aura const* SweetPotatoes = target->GetAura(SPELL_A_SERVING_OF_SWEET_POTATOES);
                Aura const* Pie = target->GetAura(SPELL_A_SERVING_OF_PIE);

                // Feast On Pie - Spirit and Stamina
                if (Aura const* aura = target->GetAura(SPELL_A_SERVING_OF_PIE))
                {
                    if (aura->GetStackAmount() == 5)
                        target->CastSpell(target, SPELL_WELL_FED_SPIRIT, true);
                }

                // The Spirit of Sharing - Achievement Credit
                if (!target->GetAura(SPELL_THE_SPIRIT_OF_SHARING))
                {
                    if ((Turkey && Turkey->GetStackAmount() == 5) && (Cranberies && Cranberies->GetStackAmount() == 5) && (Stuffing && Stuffing->GetStackAmount() == 5) &&
                        (SweetPotatoes && SweetPotatoes->GetStackAmount() == 5) && (Pie && Pie->GetStackAmount() == 5))
                        target->CastSpell(target, SPELL_THE_SPIRIT_OF_SHARING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_well_fed_pilgrims_bount_spirit_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_well_fed_pilgrims_bount_spirit_SpellScript();
        }
};

/*#######################################################
# Pilgrim's Bounty - "FOOD FIGHT!" AND Sharing is Caring
#########################################################*/

enum OnPlatePilgrimsBount
{
    // "FOOD FIGHT!" - Achivement Credit
    SPELL_ON_PLATE_TURKEY           = 61928,
    SPELL_ON_PLATE_CRANBERRIES      = 61925,
    SPELL_ON_PLATE_STUFFING         = 61927,
    SPELL_ON_PLATE_SWEET_POTATOES   = 61929,
    SPELL_ON_PLATE_PIE              = 61926,

    // Sharing is Caring - Achivement Credit
    SPELL_PASS_THE_TURKEY           = 66373,
    SPELL_PASS_THE_CRANBERRIES      = 66372,
    SPELL_PASS_THE_STUFFING         = 66375,
    SPELL_PASS_THE_SWEET_POTATOES   = 66376,
    SPELL_PASS_THE_PIE              = 66374,
};

class spell_gen_on_plate_pilgrims_bount_turkey : public SpellScriptLoader
{
    public:
        spell_gen_on_plate_pilgrims_bount_turkey() : SpellScriptLoader("spell_gen_on_plate_pilgrims_bount_turkey") { }

        class spell_gen_on_plate_pilgrims_bount_turkey_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_on_plate_pilgrims_bount_turkey_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_ON_PLATE_TURKEY))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->IsVehicle())
                {
                    Unit* player = caster->GetVehicleKit()->GetPassenger(0);
                    if (!player)
                        return;

                    player->CastSpell(GetHitUnit(), SPELL_ON_PLATE_TURKEY, true, NULL, NULL, player->ToPlayer()->GetGUID());
                    player->CastSpell(player, SPELL_PASS_THE_TURKEY, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_on_plate_pilgrims_bount_turkey_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_on_plate_pilgrims_bount_turkey_SpellScript();
        }
};

class spell_gen_on_plate_pilgrims_bount_cranberries : public SpellScriptLoader
{
    public:
        spell_gen_on_plate_pilgrims_bount_cranberries() : SpellScriptLoader("spell_gen_on_plate_pilgrims_bount_cranberries") { }

        class spell_gen_on_plate_pilgrims_bount_cranberries_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_on_plate_pilgrims_bount_cranberries_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_ON_PLATE_CRANBERRIES))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->IsVehicle())
                {
                    Unit* player = caster->GetVehicleKit()->GetPassenger(0);
                    if (!player)
                        return;

                    player->CastSpell(GetHitUnit(), SPELL_ON_PLATE_CRANBERRIES, true, NULL, NULL, player->ToPlayer()->GetGUID());
                    player->CastSpell(player, SPELL_PASS_THE_CRANBERRIES, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_on_plate_pilgrims_bount_cranberries_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_on_plate_pilgrims_bount_cranberries_SpellScript();
        }
};

class spell_gen_on_plate_pilgrims_bount_stuffing : public SpellScriptLoader
{
    public:
        spell_gen_on_plate_pilgrims_bount_stuffing() : SpellScriptLoader("spell_gen_on_plate_pilgrims_bount_stuffing") { }

        class spell_gen_on_plate_pilgrims_bount_stuffing_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_on_plate_pilgrims_bount_stuffing_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_ON_PLATE_STUFFING))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->IsVehicle())
                {
                    Unit* player = caster->GetVehicleKit()->GetPassenger(0);
                    if (!player)
                        return;

                    player->CastSpell(GetHitUnit(), SPELL_ON_PLATE_STUFFING, true, NULL, NULL, player->ToPlayer()->GetGUID());
                    player->CastSpell(player, SPELL_PASS_THE_STUFFING, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_on_plate_pilgrims_bount_stuffing_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_on_plate_pilgrims_bount_stuffing_SpellScript();
        }
};

class spell_gen_on_plate_pilgrims_bount_sweet_potatoes : public SpellScriptLoader
{
    public:
        spell_gen_on_plate_pilgrims_bount_sweet_potatoes() : SpellScriptLoader("spell_gen_on_plate_pilgrims_bount_sweet_potatoes") { }

        class spell_gen_on_plate_pilgrims_bount_sweet_potatoes_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_on_plate_pilgrims_bount_sweet_potatoes_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_ON_PLATE_SWEET_POTATOES))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->IsVehicle())
                {
                    Unit* player = caster->GetVehicleKit()->GetPassenger(0);
                    if (!player)
                        return;

                    player->CastSpell(GetHitUnit(), SPELL_ON_PLATE_SWEET_POTATOES, true, NULL, NULL, player->ToPlayer()->GetGUID());
                    player->CastSpell(player, SPELL_PASS_THE_SWEET_POTATOES, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_on_plate_pilgrims_bount_sweet_potatoes_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_on_plate_pilgrims_bount_sweet_potatoes_SpellScript();
        }
};

class spell_gen_on_plate_pilgrims_bount_pie : public SpellScriptLoader
{
    public:
        spell_gen_on_plate_pilgrims_bount_pie() : SpellScriptLoader("spell_gen_on_plate_pilgrims_bount_pie") { }

        class spell_gen_on_plate_pilgrims_bount_pie_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_on_plate_pilgrims_bount_pie_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_ON_PLATE_PIE))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (caster->IsVehicle())
                {
                    Unit* player = caster->GetVehicleKit()->GetPassenger(0);
                    if (!player)
                        return;

                    player->CastSpell(GetHitUnit(), SPELL_ON_PLATE_PIE, true, NULL, NULL, player->ToPlayer()->GetGUID());
                    player->CastSpell(player, SPELL_PASS_THE_PIE, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_on_plate_pilgrims_bount_pie_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_on_plate_pilgrims_bount_pie_SpellScript();
        }
};

/*####################################
# Pilgrim's Bounty - Bountiful Feast
######################################*/

enum BountifuFeast
{
    // Bountiful Feast
    SPELL_BOUNTIFUL_FEAST_DRINK          = 66041,
    SPELL_BOUNTIFUL_FEAST_FOOD           = 66478,
    SPELL_BOUNTIFUL_FEAST_REFRESHMENT    = 66622,
};

class spell_gen_bountiful_feast : public SpellScriptLoader
{
    public:
        spell_gen_bountiful_feast() : SpellScriptLoader("spell_gen_bountiful_feast") { }

        class spell_gen_bountiful_feast_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_bountiful_feast_SpellScript);

            void HandleScriptEffect(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                caster->CastSpell(caster, SPELL_BOUNTIFUL_FEAST_DRINK, true);
                caster->CastSpell(caster, SPELL_BOUNTIFUL_FEAST_FOOD, true);
                caster->CastSpell(caster, SPELL_BOUNTIFUL_FEAST_REFRESHMENT, true);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_gen_bountiful_feast_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_bountiful_feast_SpellScript();
        }
};

/*####################################
# Pilgrim's Bounty - Buff Food
######################################*/

enum PilgrimsBountyBuffFood
{
    // Pilgrims Bounty Buff Food
    SPELL_WELL_FED_AP_TRIGGER       = 65414,
    SPELL_WELL_FED_ZM_TRIGGER       = 65412,
    SPELL_WELL_FED_HIT_TRIGGER      = 65416,
    SPELL_WELL_FED_HASTE_TRIGGER    = 65410,
    SPELL_WELL_FED_SPIRIT_TRIGGER   = 65415,
};

class spell_gen_slow_roasted_turkey : public SpellScriptLoader
{
    public:
        spell_gen_slow_roasted_turkey() : SpellScriptLoader("spell_gen_slow_roasted_turkey") { }

        class spell_gen_slow_roasted_turkey_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_slow_roasted_turkey_AuraScript)

            bool Load()
            {
                _handled = false;
                return true;
            }

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                if (_handled)
                    return;

                Unit* caster = GetCaster();
                if (!caster)
                    return;

                _handled = true;
                caster->CastSpell(caster, SPELL_WELL_FED_AP_TRIGGER, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_slow_roasted_turkey_AuraScript::HandleTriggerSpell, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            bool _handled;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_slow_roasted_turkey_AuraScript();
        }
};

class spell_gen_cranberry_chutney : public SpellScriptLoader
{
    public:
        spell_gen_cranberry_chutney() : SpellScriptLoader("spell_gen_cranberry_chutney") { }

        class spell_gen_cranberry_chutney_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_cranberry_chutney_AuraScript)

            bool Load()
            {
                _handled = false;
                return true;
            }

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                if (_handled)
                    return;

                Unit* caster = GetCaster();
                if (!caster)
                    return;

                _handled = true;
                caster->CastSpell(caster, SPELL_WELL_FED_ZM_TRIGGER, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_cranberry_chutney_AuraScript::HandleTriggerSpell, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            bool _handled;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_cranberry_chutney_AuraScript();
        }
};

class spell_gen_spice_bread_stuffing : public SpellScriptLoader
{
    public:
        spell_gen_spice_bread_stuffing() : SpellScriptLoader("spell_gen_spice_bread_stuffing") { }

        class spell_gen_spice_bread_stuffing_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_spice_bread_stuffing_AuraScript)

            bool Load()
            {
                _handled = false;
                return true;
            }

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                if (_handled)
                    return;

                Unit* caster = GetCaster();
                if (!caster)
                    return;

                _handled = true;
                caster->CastSpell(caster, SPELL_WELL_FED_HIT_TRIGGER, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_spice_bread_stuffing_AuraScript::HandleTriggerSpell, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            bool _handled;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_spice_bread_stuffing_AuraScript();
        }
};

class spell_gen_pumpkin_pie : public SpellScriptLoader
{
    public:
        spell_gen_pumpkin_pie() : SpellScriptLoader("spell_gen_pumpkin_pie") { }

        class spell_gen_pumpkin_pie_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_pumpkin_pie_AuraScript)

            bool Load()
            {
                _handled = false;
                return true;
            }

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                if (_handled)
                    return;

                Unit* caster = GetCaster();
                if (!caster)
                    return;

                _handled = true;
                caster->CastSpell(caster, SPELL_WELL_FED_SPIRIT_TRIGGER, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_pumpkin_pie_AuraScript::HandleTriggerSpell, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            bool _handled;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_pumpkin_pie_AuraScript();
        }
};

class spell_gen_candied_sweet_potato : public SpellScriptLoader
{
    public:
        spell_gen_candied_sweet_potato() : SpellScriptLoader("spell_gen_candied_sweet_potato") { }

        class spell_gen_candied_sweet_potato_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_candied_sweet_potato_AuraScript)

            bool Load()
            {
                _handled = false;
                return true;
            }

            void HandleTriggerSpell(AuraEffect const* /*aurEff*/)
            {
                if (_handled)
                    return;

                Unit* caster = GetCaster();
                if (!caster)
                    return;

                _handled = true;
                caster->CastSpell(caster, SPELL_WELL_FED_HASTE_TRIGGER, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_candied_sweet_potato_AuraScript::HandleTriggerSpell, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            bool _handled;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_candied_sweet_potato_AuraScript();
        }
};

class spell_gen_oracle_wolvar_reputation: public SpellScriptLoader
{
public:
    spell_gen_oracle_wolvar_reputation() : SpellScriptLoader("spell_gen_oracle_wolvar_reputation") { }

    class spell_gen_oracle_wolvar_reputation_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_gen_oracle_wolvar_reputation_SpellScript)

        void HandleDummy(SpellEffIndex effIndex)
        {                 
            
            if (Player* player = GetCaster()->ToPlayer())
            {

                uint32 factionId = GetSpellInfo()->Effects[effIndex].CalcValue();
                int32  repChange =  GetSpellInfo()->Effects[EFFECT_1].CalcValue();

                FactionEntry const* factionEntry = sFactionStore.LookupEntry(factionId);

                if (!factionEntry)
                    return;

                // Set rep to baserep + basepoints (expecting spillover for oposite faction -> become hated)
                // Not when player already has equal or higher rep with this faction
                if (player->GetReputationMgr().GetBaseReputation(factionEntry) < repChange)
                    player->GetReputationMgr().SetReputation(factionEntry, repChange);

                // EFFECT_INDEX_2 most likely update at war state, we already handle this in SetReputation
            }
              
        }

        void Register()
        {
        OnEffect += SpellEffectFn(spell_gen_oracle_wolvar_reputation_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_gen_oracle_wolvar_reputation_SpellScript();
    }
};

void AddSC_generic_spell_scripts()
{
    new spell_gen_absorb0_hitlimit1();
    new spell_gen_aura_of_anger();
    new spell_gen_av_drekthar_presence();
    new spell_gen_burn_brutallus();
    new spell_gen_cannibalize();
    new spell_gen_leeching_swarm();
    new spell_gen_parachute();
    new spell_gen_pet_summoned();
    new spell_gen_remove_flight_auras();
    new spell_gen_trick();
    new spell_gen_trick_or_treat();
    new spell_gen_tricky_treat();
    new spell_creature_permanent_feign_death();
    new spell_pvp_trinket_wotf_shared_cd();
    new spell_gen_animal_blood();
    new spell_gen_divine_storm_cd_reset();
    new spell_gen_parachute_ic();
    new spell_gen_gunship_portal();
    new spell_gen_dungeon_credit();
    new spell_gen_profession_research();
    new spell_generic_clone();
    new spell_generic_clone_weapon();
    new spell_gen_seaforium_blast();
    new spell_gen_turkey_marker();
    new spell_gen_lifeblood();
    new spell_gen_magic_rooster();
    new spell_gen_allow_cast_from_item_only();
    new spell_gen_launch();
    new spell_gen_vehicle_scaling();
    new spell_gen_oracle_wolvar_reputation();
    new spell_gen_turkey_tracker();
    new spell_gen_feast_on();
    new spell_gen_well_fed_pilgrims_bount_ap();
    new spell_gen_well_fed_pilgrims_bount_zm();
    new spell_gen_well_fed_pilgrims_bount_hit();
    new spell_gen_well_fed_pilgrims_bount_haste();
    new spell_gen_well_fed_pilgrims_bount_spirit();
    new spell_gen_on_plate_pilgrims_bount_turkey();
    new spell_gen_on_plate_pilgrims_bount_cranberries();
    new spell_gen_on_plate_pilgrims_bount_stuffing();
    new spell_gen_on_plate_pilgrims_bount_sweet_potatoes();
    new spell_gen_on_plate_pilgrims_bount_pie();
    new spell_gen_bountiful_feast();
    new spell_gen_slow_roasted_turkey();
    new spell_gen_cranberry_chutney();
    new spell_gen_spice_bread_stuffing();
    new spell_gen_pumpkin_pie();
    new spell_gen_candied_sweet_potato();
}
