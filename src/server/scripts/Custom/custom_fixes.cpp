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

#include "ScriptPCH.h"

/*###################################
# spell_gen_ribbon_pole_dancer_check
####################################*/

enum RibbonPoleData
{
    SPELL_HAS_FULL_MIDSUMMER_SET        = 58933,
    SPELL_BURNING_HOT_POLE_DANCE        = 58934,
    SPELL_RIBBON_DANCE                  = 29175,
    GO_RIBBON_POLE                      = 181605
};

class spell_gen_ribbon_pole_dancer_check : public SpellScriptLoader
{
    public:
        spell_gen_ribbon_pole_dancer_check() : SpellScriptLoader("spell_gen_ribbon_pole_dancer_check") { }

        class spell_gen_ribbon_pole_dancer_check_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_gen_ribbon_pole_dancer_check_AuraScript);

            bool Validate(SpellEntry const* /*spell*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_HAS_FULL_MIDSUMMER_SET))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_BURNING_HOT_POLE_DANCE))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_RIBBON_DANCE))
                    return false;
                return true;
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* target = GetTarget();

                if (!target)
                    return;

                // check if aura needs to be removed
                if (!target->FindNearestGameObject(GO_RIBBON_POLE, 20.0f) || !target->HasUnitState(UNIT_STAT_CASTING))
                {
                    target->InterruptNonMeleeSpells(false);
                    target->RemoveAurasDueToSpell(GetId());
                    return;
                }

                // set xp buff duration
                if (Aura* aur = target->GetAura(SPELL_RIBBON_DANCE))
                {
                    aur->SetMaxDuration(aur->GetMaxDuration() >= 3600000 ? 3600000 : aur->GetMaxDuration() + 180000);
                    aur->RefreshDuration();

                    // reward achievement criteria
                    if (aur->GetMaxDuration() == 3600000 && target->HasAura(SPELL_HAS_FULL_MIDSUMMER_SET))
                        target->CastSpell(target, SPELL_BURNING_HOT_POLE_DANCE, true);
                }
                else
                    target->AddAura(SPELL_RIBBON_DANCE, target);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_gen_ribbon_pole_dancer_check_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_gen_ribbon_pole_dancer_check_AuraScript();
        }
};

/*######
## npc_torch_tossing_bunny
######*/

enum
{
    SPELL_TORCH_TOSSING_COMPLETE_A = 45719,
    SPELL_TORCH_TOSSING_COMPLETE_H = 46651,
    SPELL_TORCH_TOSSING_TRAINING   = 45716,
    SPELL_TORCH_TOSSING_PRACTICE   = 46630,
    SPELL_TORCH_TOSS               = 46054,
    SPELL_TARGET_INDICATOR         = 45723,
    SPELL_BRAZIERS_HIT             = 45724
};

class npc_torch_tossing_bunny : public CreatureScript
{
    public:
        npc_torch_tossing_bunny() : CreatureScript("npc_torch_tossing_bunny") { }

        struct npc_torch_tossing_bunnyAI : public ScriptedAI
        {
            npc_torch_tossing_bunnyAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                _targetTimer = urand(5000, 20000);
            }

            void SpellHit(Unit* caster, SpellEntry const* spell)
            {
                if (spell->Id == SPELL_TORCH_TOSS && me->HasAura(SPELL_TARGET_INDICATOR))
                {
                    uint8 neededHits;

                    if (caster->HasAura(SPELL_TORCH_TOSSING_TRAINING))
                        neededHits = 8;
                    else if (caster->HasAura(SPELL_TORCH_TOSSING_PRACTICE))
                        neededHits = 20;
                    else
                        return;

                    DoCast(me, SPELL_BRAZIERS_HIT, true);
                    caster->AddAura(SPELL_BRAZIERS_HIT, caster);

                    if (caster->GetAuraCount(SPELL_BRAZIERS_HIT) >= neededHits)
                    {
                        // complete quest
                        caster->CastSpell(caster, SPELL_TORCH_TOSSING_COMPLETE_A, true);
                        caster->CastSpell(caster, SPELL_TORCH_TOSSING_COMPLETE_H, true);
                        caster->RemoveAurasDueToSpell(SPELL_BRAZIERS_HIT);
                        caster->RemoveAurasDueToSpell(neededHits == 8 ? SPELL_TORCH_TOSSING_TRAINING : SPELL_TORCH_TOSSING_PRACTICE);
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (_targetTimer <= diff)
                {
                    DoCast(SPELL_TARGET_INDICATOR);
                    _targetTimer = urand(10000, 20000);
                }
                else
                    _targetTimer -= diff;
            }

        private:
            uint32 _targetTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_torch_tossing_bunnyAI(creature);
        }
};

/*###########
# boss_ahune
############*/

enum AhuneData
{
    BOSS_AHUNE = 25740,
    NPC_AHUNITE_HAILSTONE = 25755,
    NPC_AHUNITE_COLDWAVE = 25756,
    NPC_AHUNITE_FROSTWIND = 25757,
    NPC_FROZEN_CORE = 25865,
    SPELL_AHUNES_SHIELD = 45954,
    SPELL_FROSTBOLT_VOLLEY = 62580,
    SPELL_FROST_BREATH = 44799,
	GO_ICE_CHEST = 187892
};

class boss_ahune : public CreatureScript
{
public:
    boss_ahune() : CreatureScript("boss_ahune") { }

    struct boss_ahuneAI : public ScriptedAI
    {
        boss_ahuneAI(Creature* creature) : ScriptedAI(creature) { }

        bool Submerged;
        bool Emerged;
        bool hasShield;
        uint32 SummonHailstone;
        uint32 SummonColdAndFrost;
        uint32 FrostboltVolley;
        uint32 FrostBreath;

        void Reset()
        {
            SummonHailstone = 5000;
			SummonColdAndFrost = 15000;
            FrostboltVolley = 3000;
            FrostBreath = 8000;
            Submerged = false;
            Emerged = false;
            hasShield = false;
            me->SetVisible(true);
            me->ApplySpellImmune(0, IMMUNITY_SCHOOL, SPELL_SCHOOL_MASK_FROST, true);
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_PACIFIED);
            if (TempSummon* summon = me->ToTempSummon())
                summon->DespawnOrUnsummon();
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->SummonCreature(NPC_AHUNITE_COLDWAVE, me->GetPositionX()+15, me->GetPositionY()-5, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 90000);
            me->SummonCreature(NPC_AHUNITE_COLDWAVE, me->GetPositionX()+15, me->GetPositionY()+5, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,90000);
            me->SummonCreature(NPC_AHUNITE_FROSTWIND, me->GetPositionX()+15, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 90000);
            DoCast(me, SPELL_AHUNES_SHIELD);
            hasShield = true;
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (HealthBelowPct(50) && !Submerged)
            {
                me->SummonCreature(NPC_FROZEN_CORE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(),0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_PACIFIED);
                me->SetVisible(false);
                Submerged = true;
            }

            if (!Submerged || Emerged)
            {
                if (SummonHailstone <= diff)
                {
                    me->SummonCreature(NPC_AHUNITE_HAILSTONE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 180000);
                    SummonHailstone = urand(30000,40000);
                }
                else SummonHailstone -= diff;

                if (SummonColdAndFrost <= diff)
                {
                    me->SummonCreature(NPC_AHUNITE_COLDWAVE, me->GetPositionX()+15, me->GetPositionY()-5, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 90000);
                    me->SummonCreature(NPC_AHUNITE_COLDWAVE, me->GetPositionX()+15, me->GetPositionY()+5, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,90000);
                    me->SummonCreature(NPC_AHUNITE_FROSTWIND, me->GetPositionX()+15, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 90000);
                    SummonColdAndFrost = 15000;
                } else SummonColdAndFrost -= diff;          

                if (FrostboltVolley <= diff)
                {
                    DoCast(me, SPELL_FROSTBOLT_VOLLEY);
                    FrostboltVolley = urand(18000,20000);
                }
                else FrostboltVolley -= diff;

                if (FrostBreath <= diff)
                {
                    DoCast(me->getVictim(), SPELL_FROST_BREATH);
                    FrostBreath = 16000;
                }
                else FrostBreath -= diff;
            }
            DoMeleeAttackIfReady();            
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (who->GetTypeId() == TYPEID_PLAYER && !me->isInCombat())
                me->AI()->AttackStart(who);
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            switch (summon->GetEntry())
            {
                    case NPC_FROZEN_CORE:
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_PACIFIED);
                    me->SetVisible(true);
                    Emerged = true;				    
                    break;
            }
        }

        void JustDied(Unit* /*killer*/)
        {
            me->SummonGameObject(GO_ICE_CHEST,-98.237152f,-209.066210f,-1.231776f,0,0,0,0,0,300000);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_ahuneAI(creature);
    }
};

enum TorchCatchingData
{
    SPELL_FLING_TORCH_MISSILE     = 45669,
    SPELL_TOSS_TORCH_SHADOW       = 46105,
    SPELL_TORCH_TARGET_PICKER     = 45907,
    SPELL_TORCHES_COUGHT          = 45693,
    SPELL_JUGGLE_TORCH_MISSED     = 45676,
    SPELL_TORCH_CATCHING_SUCCESS  = 46081,
    SPELL_TORCH_DAILY_SUCCESS     = 46654,
    NPC_JUGGLE_TARGET             = 25515,
    QUEST_TORCH_CATCHING_A        = 11657,
    QUEST_TORCH_CATCHING_H        = 11923,
    QUEST_MORE_TORCH_CATCHING_A   = 11924,
    QUEST_MORE_TORCH_CATCHING_H   = 11925
};

class spell_gen_torch_target_picker : public SpellScriptLoader
{
    public:
        spell_gen_torch_target_picker() : SpellScriptLoader("spell_gen_torch_target_picker") {}

        class spell_gen_torch_target_picker_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_torch_target_picker_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_FLING_TORCH_MISSILE))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_TOSS_TORCH_SHADOW))
                    return false;
                return true;
            }

            void FilterTargets(std::list<Unit*>& unitList)
            {
                Unit* caster = GetCaster();

                if (!caster)
                    return;

                std::list<Creature*> juggleList;
                caster->GetCreatureListWithEntryInGrid(juggleList, NPC_JUGGLE_TARGET, 10.0f);

                if (!juggleList.empty())
                    for (std::list<Creature*>::iterator iter = juggleList.begin(); iter != juggleList.end(); ++iter)
                        unitList.remove(*iter);

                if (unitList.empty())
                    return;

                std::list<Unit*>::iterator itr = unitList.begin();
                std::advance(itr, urand(0, unitList.size() - 1));

                Unit* target = *itr;
                unitList.clear();
                unitList.push_back(target);
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();

                if (!caster || !target)
                    return;

                caster->CastSpell(target, SPELL_FLING_TORCH_MISSILE, true);
                caster->CastSpell(target, SPELL_TOSS_TORCH_SHADOW, true);
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_gen_torch_target_picker_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_AREA_ENTRY_SRC);
                OnEffect += SpellEffectFn(spell_gen_torch_target_picker_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_torch_target_picker_SpellScript();
        }
};

class spell_gen_juggle_torch_catch : public SpellScriptLoader
{
    public:
        spell_gen_juggle_torch_catch() : SpellScriptLoader("spell_gen_juggle_torch_catch") {}

        class spell_gen_juggle_torch_catch_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gen_juggle_torch_catch_SpellScript);

            bool Validate(SpellEntry const* /*spellEntry*/)
            {
                if (!sSpellStore.LookupEntry(SPELL_TORCH_TARGET_PICKER))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_TORCHES_COUGHT))
                    return false;
                if (!sSpellStore.LookupEntry(SPELL_JUGGLE_TORCH_MISSED))
                    return false;
                return true;
            }

            void FilterTargets(std::list<Unit*>& unitList)
            {
                Unit* caster = GetCaster();
                Unit* juggleTarget = NULL;
                bool missed = true;

                if (unitList.empty() || !caster || !caster->ToPlayer())
                     return;

                for (std::list<Unit*>::iterator iter = unitList.begin(); iter != unitList.end(); ++iter)
                {
                    if (*iter == caster)
                        missed = false;

                    if ((*iter)->ToCreature())
                        juggleTarget = *iter;
                }

                if (missed)
                {
                    if (juggleTarget)
                        juggleTarget->CastSpell(juggleTarget, SPELL_JUGGLE_TORCH_MISSED, true);
                    caster->RemoveAurasDueToSpell(SPELL_TORCHES_COUGHT);
                }
                else
                {
                    uint8 neededCatches;

                    if (caster->ToPlayer()->GetQuestStatus(QUEST_TORCH_CATCHING_A) == QUEST_STATUS_INCOMPLETE
                        || caster->ToPlayer()->GetQuestStatus(QUEST_TORCH_CATCHING_H) == QUEST_STATUS_INCOMPLETE)
                    {
                        neededCatches = 4;
                    }
                    else if (caster->ToPlayer()->GetQuestStatus(QUEST_MORE_TORCH_CATCHING_A) == QUEST_STATUS_INCOMPLETE
                        || caster->ToPlayer()->GetQuestStatus(QUEST_MORE_TORCH_CATCHING_H) == QUEST_STATUS_INCOMPLETE)
                    {
                        neededCatches = 10;
                    }
                    else
                    {
                        caster->RemoveAurasDueToSpell(SPELL_TORCHES_COUGHT);
                        return;
                    }

                    caster->CastSpell(caster, SPELL_TORCH_TARGET_PICKER, true);
                    caster->CastSpell(caster, SPELL_TORCHES_COUGHT, true);

                    // reward quest
                    if (caster->GetAuraCount(SPELL_TORCHES_COUGHT) >= neededCatches)
                    {
                        caster->CastSpell(caster, SPELL_TORCH_CATCHING_SUCCESS, true);
                        caster->CastSpell(caster, SPELL_TORCH_DAILY_SUCCESS, true);
                        caster->RemoveAurasDueToSpell(SPELL_TORCHES_COUGHT);
                    }
                }
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_gen_juggle_torch_catch_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_AREA_ENTRY_DST);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gen_juggle_torch_catch_SpellScript();
        }
};

/*######################
# go_ice_stone_midsummer
########################*/

class go_ice_stone_midsummer : public GameObjectScript
{
public:
    go_ice_stone_midsummer() : GameObjectScript("go_ice_stone_midsummer") { }

    bool OnGossipHello(Player* /*player*/, GameObject* go)
    {
        go->SummonCreature(BOSS_AHUNE,-97.165665f,-208.148758f,-1.216157f,1.601278f,TEMPSUMMON_CORPSE_TIMED_DESPAWN,150000);
        return true;
    }
};


void AddSC_custom_fixes()
{
    new spell_gen_ribbon_pole_dancer_check();
    new npc_torch_tossing_bunny();
    new boss_ahune();
    new spell_gen_torch_target_picker();
    new spell_gen_juggle_torch_catch();
    new go_ice_stone_midsummer();
}