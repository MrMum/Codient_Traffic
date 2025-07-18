--[[
    Traffic System Client Logic
    Created by: Codient
--]]

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if not Config.NPCTrafficEnabled then return end

        local allPeds = GetGamePool('CPed')
        for _, ped in ipairs(allPeds) do
            if IsPedInAnyVehicle(ped, false) and not IsPedAPlayer(ped) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                if not DoesEntityExist(vehicle) then goto continue end

                local chance = math.random()
                if chance < Config.CrazyDriverChance then
                    TaskVehicleDriveWander(ped, vehicle, GetVehicleMaxSpeed(vehicle) * Config.CrazyDriverSpeedMultiplier, 786603)
                    if Config.DispatchPoliceForCrazyDrivers then
                        TriggerServerEvent("npcTraffic:reportCrazyDriver", GetEntityCoords(vehicle))
                    end
                elseif Config.EnableRedLightViolations and math.random() < 0.05 then
                    TaskVehicleDriveWander(ped, vehicle, 30.0, 1074528293)
                elseif Config.EnableWrongWayDrivers and math.random() < 0.03 then
                    TaskVehicleDriveWander(ped, vehicle, 40.0, 1074528293)
                    SetEntityHeading(vehicle, GetEntityHeading(vehicle) + 180)
                elseif Config.EnableAccidents and math.random() < Config.AccidentChance then
                    ApplyForceToEntity(vehicle, 1, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, true, true, true)
                    if Config.AutoCallEMS then
                        TriggerServerEvent("npcTraffic:accidentReported", GetEntityCoords(vehicle))
                    end
                end

                ::continue::
            end
        end
    end
end)
