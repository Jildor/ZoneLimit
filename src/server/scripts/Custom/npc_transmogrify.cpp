/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
Name: Transmogrify Npc
%Complete: 100
Category: Custom Script
EndScriptData */

#include "ScriptPCH.h"

enum TransmogrifyActions {
    ACTION_TRANSMOGRIFY_ADD_DISPLAY,
    ACTION_TRANSMOGRIFY_REMOVE_DISPLAY
};

const uint16 PriceInGold = 1000 * 100 * 100; // 1k golds

class npc_transmogrify : public CreatureScript
{
    public:
        npc_transmogrify() : CreatureScript("npc_transmogrify") { }

        bool OnGossipHello(Player* pPlayer, Creature* pCreature)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Hacer el cambio!", GOSSIP_SENDER_MAIN, ACTION_TRANSMOGRIFY_ADD_DISPLAY);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Revertir el cambio.", GOSSIP_SENDER_MAIN, ACTION_TRANSMOGRIFY_REMOVE_DISPLAY);
            pPlayer->SEND_GOSSIP_MENU(51000, pCreature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
        {
            player->PlayerTalkClass->SendCloseGossip();
            switch (action)
            {
                case ACTION_TRANSMOGRIFY_ADD_DISPLAY:
                    TransmogrifyItem(player, creature);
                    break;
                case ACTION_TRANSMOGRIFY_REMOVE_DISPLAY:
                    ClearItem(player, creature);
                    break;
            }
            return true;
        }

        void TransmogrifyItem(Player* player, Creature* creature)
        {
            ChatHandler handler(player);
            Item *trItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START);
            Item *displayItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START + 1);
            if (!trItem || !displayItem)
            {
                handler.PSendSysMessage("Coloca el objeto en la primera y segunda casilla!");
                return;
            }

            if (!player->HasEnoughMoney(PriceInGold))
            {
                handler.PSendSysMessage("Su precio es de %u de oro!", PriceInGold);
                return;
            }

            uint8 result = trItem->SetFakeDisplay(displayItem->GetTemplate()->ItemId);
            switch (result)
            {
                case FAKE_ERR_CANT_FIND_ITEM:
                    handler.PSendSysMessage("No se puede encontrar el objeto!");
                    break;
                case FAKE_ERR_WRONG_QUALITY:
                    handler.PSendSysMessage("El objeto tiene una calidad diferente!");
                    break;
                case FAKE_ERR_DIFF_SLOTS:
                    handler.PSendSysMessage("Los objetos son de diferente tipo!");
                    break;
                case FAKE_ERR_DIFF_CLASS:
                case FAKE_ERR_DIFF_RACE:
                    handler.PSendSysMessage("Los objetos no son de la misma clase!");
                    break;
                case FAKE_ERR_CANT_TRANS:
                    handler.PSendSysMessage("No es posible transfigurar estos objetos!");
                    break;
                case FAKE_ERR_OK:
                {
                    WorldPacket data;
                    data << uint8(INVENTORY_SLOT_BAG_0);
                    data << uint8(trItem->GetSlot());
                    player->GetSession()->HandleAutoEquipItemOpcode(data);

                    player->ModifyMoney(-1 * PriceInGold);
                    creature->GetAI()->DoCast(63491);

                    break;
                }
            }
        }

        void ClearItem(Player *player, Creature* creature)
        {
            ChatHandler handler(player);
            Item *trItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START);
            if (!trItem)
            {
                handler.PSendSysMessage("Coloca el objeto en la primera casilla!");
                return;
            }

            trItem->RemoveFakeDisplay();

            WorldPacket data;
            data << uint8(INVENTORY_SLOT_BAG_0);
            data << uint8(trItem->GetSlot());
            player->GetSession()->HandleAutoEquipItemOpcode(data);

            creature->GetAI()->DoCast(63491);
        }
};

void AddSC_transmogrify_script()
{
    new npc_transmogrify;
}
