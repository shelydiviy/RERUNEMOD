#include <amxmodx>
#include <amxmisc>
#include <rm_api>

new rune_model_id = -1;
new mp_maxmoney;

public plugin_init()
{
	register_plugin("RM_CASH","2.2","Karaulov"); 
	rm_register_rune("Деньги","Дает 5000$",Float:{255.0,255.0,255.0}, "models/rm_reloaded/w_dollar.mdl",_,rune_model_id);
	// Класс руны: предмет
	rm_base_use_rune_as_item( );
	
	mp_maxmoney = get_cvar_pointer("mp_maxmoney");
}

public plugin_precache()
{
	rune_model_id = precache_model("models/rm_reloaded/w_dollar.mdl");
}

public rm_give_rune(id)
{
	if (get_member(id,m_iAccount) < get_pcvar_num(mp_maxmoney))
	{
		rg_add_account(id,clamp(get_member(id,m_iAccount)+5000,0,get_pcvar_num(mp_maxmoney)),AS_SET);
		return NEED_DROP_RUNE;
	}
	else 
		return NO_NEED_DROP_RUNE;
}
