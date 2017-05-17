#include <sourcemod>


int g_HideTracers[MAXPLAYERS+1]={0,...};
int g_HideTrails[MAXPLAYERS+1]={0,...};

public Plugin myinfo = 
{
	name = "Simple Hide features For each clients",
	author = "",
	description = "<- Description ->",
	version = "1.0",
	url = "<- URL ->"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_hide_tracer", cTracer);
	RegConsoleCmd("sm_hide_trail", cTrail);
}



public Action cTracer(int client, int args)
{
	g_HideTracers[client] = 1;
}

public Action cTrail(int client, int args)
{
	g_HideTrails[client] = 1;
}


public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	CreateNative("Hidetracers_ShouldHide", Native_ShouldHideTracers);
	CreateNative("HideTrails_ShouldHide", Native_ShouldHideTrails);
	return APLRes_Success;
}


public void OnClientConnected(int client)
{
	g_HideTrails[client] = 0;
	g_HideTracers[client] = 0;
}	

public int Native_ShouldHideTracers(Handle plugin, int numParams)
{
	int client = GetNativeCell(1);
	return g_HideTracers[client];
}


public int Native_ShouldHideTrails(Handle plugin, int numParams)
{
	int client = GetNativeCell(1);
	return g_HideTrails[client];
}

