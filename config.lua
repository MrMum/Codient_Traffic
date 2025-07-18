--[[
    Realistic Traffic System - Config
    Created by: Codient
--]]

Config = {}

-- Global settings
Config.EnableDebug = false
Config.NPCTrafficEnabled = true
Config.TrafficDensity = 0.7 -- 0.0 to 1.0

-- Behavior toggles
Config.EnableRedLightViolations = true
Config.EnableWrongWayDrivers = true
Config.EnableAggressiveDrivers = true
Config.EnableAccidents = true
Config.EnableRandomBreakdowns = true

-- Crazy drivers
Config.CrazyDriverChance = 0.05 -- 5%
Config.CrazyDriverSpeedMultiplier = 1.8

-- Accidents
Config.AccidentChance = 0.02 -- 2%
Config.AutoCallEMS = true
Config.AutoCallPolice = false

-- Emergency dispatch
Config.DispatchEMS = true
Config.DispatchPoliceForCrazyDrivers = true

-- Debug visuals
Config.ShowDebugBlips = false
Config.ShowNPCPaths = false
