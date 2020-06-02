Config              = {}
Config.MarkerType   = -1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 4.0, y = 4.0, z = 3.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips    = false

Config.RequiredCopsWeed  	= 0
Config.RequiredCopsCoke  	= 0
--------------------------------
--------------------------------
Config.RequiredCopsMeth     = 0
Config.RequiredCopsMethlab  = 0
Config.RequiredCopsAcetone  = 0
Config.RequiredCopsLithium  = 0
--------------------------------
--------------------------------
Config.RequiredCopsCrack    = 0
Config.RequiredCopsKetamine = 0
Config.RequiredCopsEcstasy  = 0
-------------------------------
Config.RequiredCopsOpium    = 0

Config.TimeToFarm           = 5 * 1000
Config.TimeToProcess        = 5 * 1000
Config.TimeToSell           = 5 * 1000

Config.Locale = 'fr'

Config.Zones = {
    CokeField           = {x=1922.12,  y=4886.75,   z=47.31,   name = _U('coke_field'),         sprite = 501,   color = 40},
    CokeProcessing      = {x=696.89,   y=-1265.28,  z=26.27,   name = _U('coke_processing'),    sprite = 478,   color = 40},
    CokeDealer          = {x=-981.79,  y=-1517.61,  z=5.06,    name = _U('coke_dealer'),        sprite = 500,   color = 75},
	---------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------
	MethField           = {x=-3262.22, y=960.96,    z=8.35,    name = _U('meth_field'),         sprite = 499,   color = 26},
	MethlabField        = {x=1957.35,  y=5056.65,   z=45.92,   name = _U('methlab_field'),      sprite = 499,   color = 26},
	AcetoneField        = {x=0.000,    y=0.000,     z=0.000,   name = _U('acetone_field'),      sprite = 499,   color = 26},
	LithiumField        = {x=-233.89,  y=6276.41,   z=31.68,   name = _U('lithium_field'),      sprite = 499,   color = 26},
	MethProcessing      = {x=706.84,   y=-693.43,   z=31.76,   name = _U('meth_processing'),    sprite = 499,   color = 26},
    MethDealer          = {x=-533.680, y=-2218.35,  z=6.40,    name = _U('meth_dealer'),        sprite = 500,   color = 75},
	---------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------
    WeedField           = {x=-1135.65, y=4971.69,   z=220.37,  name = _U('weed_field'),         sprite = 496,   color = 52},
    WeedProcessing      = {x=-1063.01, y=-1663.59,  z=4.57,    name = _U('weed_processing'),    sprite = 496,   color = 52},
    WeedDealer          = {x=-178.35,  y=1014.38,   z=232.14,  name = _U('weed_dealer'),        sprite = 500,   color = 75},
	---------------------------------------------------------------------------------------------------------------------------
	CrackField          = {x=841.28,   y=-2871.88,  z=13.82,   name = _U('crack_field'),		sprite = 501,	color = 40},
	CrackProcessing     = {x=1093.462, y=-3197.138, z=-38.993, name = _U('crack_processing'),	sprite = 478,	color = 40},
	CrackDealer         = {x=-40.05,   y=-1208.05,  z=29.504,  name = _U('crack_dealer'),		sprite = 500,	color = 75}
        ---------------------------------------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------------------------------------
--[[    KetamineField       = {x=1003.92,  y=-3199.35,  z=-38.993, name = _U('ketamine_field'),	     sprite = 499,	color = 26},
	KetamineProcessing  = {x=1011.05,  y=-3196.53,  z=-38.993, name = _U('ketamine_processing'), sprite = 499,	color = 26},
	KetamineDealer      = {x=0,        y=0,         z=0,	   name = _U('ketamine_dealer'),	 sprite = 500,	color = 75},
	    ---------------------------------------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------------------------------------
	EcstasyProcessing   = {x=1037.01,  y=-3205.34,  z=-38.17,  name = _U('ecstasy_processing'),  sprite = 496,	color = 52},
	EcstasyDealer       = {x=-1358.36, y=-1210.60,  z=4.451,   name = _U('ecstasy_dealer'),	     sprite = 500,	color = 75},
    EcstasyField        = {x=0,        y=0,         z=0,	   name = _U('ecstasy_field'),		 sprite = 496,	color = 52},
	---------------------------------------------------------------------------------------------------------------------------
	OpiumField      	= {x=1838.24,  y=5035.19,   z=57.272,  name = _U('opium_field'),		 sprite = 51,	color = 60},
	OpiumProcessing 	= {x=-438.54,  y=-2184.25,  z=10.522,  name = _U('opium_processing'),	 sprite = 51,	color = 60},
	OpiumDealer     	= {x=-1217.2,  y=-1055.4,   z=8.412,   name = _U('opium_dealer'),		 sprite = 500,	color = 75}--]]
}
