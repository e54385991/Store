#if defined _hidetracers_included
  #endinput
#endif
#define _hidetracers_included

 native Hidetracers_ShouldHide(client);
 
/**
Shared plugin information
**/
public SharedPlugin:_pl_hidetracers = 
{
	name = "hide_features",
	file = "hide_features.smx",
#if defined REQUIRE_PLUGIN
	required = 1
#else
	required = 0
#endif
};

public _pl_hidetracers_SetNTVOptional()
{
	MarkNativeAsOptional("Hidetracers_ShouldHide");
}