--[[
    Traffic System Server Logic
    Created by: Codient
--]]

RegisterServerEvent("npcTraffic:reportCrazyDriver")
AddEventHandler("npcTraffic:reportCrazyDriver", function(coords)
    print("[NPC Traffic] Crazy driver reported at: ", coords)
    if Config.DispatchPoliceForCrazyDrivers then
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "[TRAFFIC ALERT]", "Crazy driver reported near coordinates: " .. tostring(coords) }
        })
    end
end)

RegisterServerEvent("npcTraffic:accidentReported")
AddEventHandler("npcTraffic:accidentReported", function(coords)
    print("[NPC Traffic] Accident reported at: ", coords)
    if Config.DispatchEMS then
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "[MEDIC ALERT]", "Accident reported near coordinates: " .. tostring(coords) }
        })
    end
end)
