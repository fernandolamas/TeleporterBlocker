/* AMX Mod X
	Anti Teleport by ZePinkie
	pa los boluditos que quieren pasarse de vivos
	poniendo tps en los slides.
	Somo poco, no se pasen de vivos.
	Si ponemos reglas y nos ponemos de acuerdo se puede jugar, pero dale
*/

#include <amxmodx>
#include <hamsandwich>
#include <engine>
#include <fun>
#include <fakemeta>
#include <tfcx>

public plugin_init()
{
	register_plugin("AntiTP Arg", "1.0", "ZePinkie")
    register_clcmd("build 5", "bruh", -1, "", -1);
	register_clcmd("build 4", "bruh", -1, "", -1);
}

public bruh(id)
{
	if ( get_user_class(id) == 9)
	{
		client_print(id, print_chat, "Si acordamos no usar TPs, que andas buildeando?");
		return 1;
	}
	else if ( get_user_class(id) == 8)
	{
		server_print("No se que buildean los spy con el 4-5?!");
		return 1;
	}
	else
	{
		server_print("Tratando de buildear TP con otra clase?");
		return 1;
	}
    return 0;
}

get_user_class(id)
{
    new class = entity_get_int(id, EV_INT_playerclass);
    return class;
}

set_user_class(id, class)
{
    entity_set_int(id, EV_INT_playerclass, class);
	set_pev(id, pev_playerclass, class)
    show_class(id, get_user_class(id));
    return 0;
}