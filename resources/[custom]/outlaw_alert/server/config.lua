Config = {}

Config.Alerts = {
    carjacking = {
        label = 'carjacking',
        duration = 1, -- alert's duration in minutes
        active = true, -- launch alerts
        ignorePolice = true -- ignore if player's job is police
    },
    carthief = {
        label = 'carthief',
        duration = 1,
        active = true,
        ignorePolice = false
    },
    streetfight = {
        label = 'streetfight',
        duration = 1,
        active = true,
        ignorePolice = false
    },
    gunshot = {
        label = 'gunshot',
        duration = 1,
        active = true,
        ignorePolice = false
    }
}