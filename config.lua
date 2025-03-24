Config = {}

-- Job Settings
Config.JobName = 'ambulance' -- Name of the job
Config.MinPayout = 500       -- Minimum payout for a call
Config.MaxPayout = 1500      -- Maximum payout for a call

-- Hospital Locations
Config.Hospitals = {
    {x = 337.0, y = -1394.5, z = 32.5}, -- Example hospital location
    {x = -450.0, y = -340.0, z = 34.5}  -- Another hospital location
}

-- Injuries and Treatments
Config.Injuries = {
    "bleeding",
    "broken_bone",
    "unconscious",
    "cardiac_arrest"
}

Config.Treatments = {
    bleeding = "bandage",
    broken_bone = "splint",
    unconscious = "cpr",
    cardiac_arrest = "defibrillator"
}

-- Ambulance Settings
Config.AmbulanceModel = 'ambulance' -- Model of the ambulance