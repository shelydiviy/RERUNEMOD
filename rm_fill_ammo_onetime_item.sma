#include <amxmodx>
#include <amxmisc>
#include <rm_api>

new rune_model_id = -1;

public plugin_init()
{
	register_plugin("RM_AMMO","2.0","Karaulov"); 
	rm_register_rune("Боеприпасы","Восполняет количество патронов.",Float:{255.0,255.0,255.0}, "models/w_weaponbox.mdl",_,rune_model_id);
	rm_base_use_rune_as_item( );
}

public plugin_precache()
{
	rune_model_id = precache_model("models/w_weaponbox.mdl");
}


ReloadWeapons(const pPlayer)
{
	for (new InventorySlotType:i = PRIMARY_WEAPON_SLOT, pItem; i <= PISTOL_SLOT; i++)
	{
		pItem = get_member(pPlayer, m_rgpPlayerItems, i)

		while (pItem > 0 && !is_nullent(pItem))
		{
			new cliptest = get_member(pItem,m_Weapon_iClip);
			cliptest +=10;
			cliptest = min(cliptest,rg_get_iteminfo(pItem, ItemInfo_iMaxClip));
			set_member(pItem, m_Weapon_iClip, cliptest)
			pItem = get_member(pItem, m_pNext)
		}
	}
}

public rm_give_rune(id)
{
	ReloadWeapons(id);
}

