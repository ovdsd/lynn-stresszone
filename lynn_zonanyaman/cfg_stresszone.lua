Config = {}

-- Sets the distance around where the antistress effect will be activated. DEFAULT = 20
Config.ZoneLength = 20

-- Set the amount of stress you want to eliminate. DEFAULT QB = 1, DEFAULT ESX = 600
Config.reducepercent = 1000

-- Sets the time it takes for the plugin to reduce stress "in seconds". DEFAULT = 10
Config.delay = 10

-- This option is only ESX
Config.strings = {
	menssageStressDown = "You Feel more Relieved" -- Message to notify that stress is lowering
}

-- Set reduce stress zones
Config.stressZone = {
  
    {
        zone = {
            name = 'pantaikota', 
            x = 261.08, 
            y = 2605.29, 
            z = 44.82, 
            l = 20, 
            w = 20, 
            h = 2, 
            minZ = 42.42, 
            maxZ = 46.42
        }
    },

    {
        zone = {
            name = 'paleto', 
            x = 261.08, 
            y = 2605.29, 
            z = 44.82, 
            l = 20, 
            w = 20, 
            h = 2, 
            minZ = 42.42, 
            maxZ = 46.42
        }
    },

    {
        zone = {
            name = 'sandyshores', 
            x = 261.08, 
            y = 2605.29, 
            z = 44.82, 
            l = 20, 
            w = 20, 
            h = 2, 
            minZ = 42.42, 
            maxZ = 46.42
        }
    },

}

