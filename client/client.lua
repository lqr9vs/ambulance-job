local isOnDuty = false
local currentCall = nil
local currentPatient = nil

-- Commands
RegisterCommand("startduty", function()
    isOnDuty = true
    ShowNotification("You are now on duty as an EMS.")
    GenerateEmergencyCall()
end)

RegisterCommand("endduty", function()
    isOnDuty = false
    ShowNotification("You are now off duty.")
end)

RegisterCommand("treat", function()
    if not currentPatient then
        ShowNotification("No patient to treat.")
        return
    end
    OpenTreatmentMenu()
end)

-- Threads
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isOnDuty and currentCall then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local callCoords = currentCall.location
            DrawMarker(1, callCoords.x, callCoords.y, callCoords.z, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
            if Vdist(playerCoords.x, playerCoords.y, playerCoords.z, callCoords.x, callCoords.y, callCoords.z) < 2.0 then
                ShowNotification("Press ~INPUT_CONTEXT~ to assist the patient.")
                if IsControlJustReleased(0, 38) then -- 38 is the "E" key
                    currentPatient = true
                    ShowNotification("Patient is now under your care. Use /treat to provide treatment.")
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) -- Generate a new call every 60 seconds
        if isOnDuty and not currentCall then
            GenerateEmergencyCall()
        end
    end
end)