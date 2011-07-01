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
    GO_RIBBON_POLE                      = 181605,
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

void AddSC_custom_fixes()
{
    new spell_gen_ribbon_pole_dancer_check();
    new npc_torch_tossing_bunny();
    new boss_ahune();
}