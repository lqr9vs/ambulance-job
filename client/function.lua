function ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function StartTreatment(injury)
    local playerPed = PlayerPedId()
    LoadAnimDict("amb@world_human_cheering@male_a")
    TaskPlayAnim(playerPed, "amb@world_human_cheering@male_a", "base", 8.0, -8.0, -1, 49, 0, false, false, false)
    Citizen.Wait(5000) -- Simulate treatment time
    ClearPedTasks(playerPed)
    ShowNotification("You treated the " .. injury .. ".")
    TriggerServerEvent('ambulance:completeCall', CalculatePayout())
end

function CalculatePayout()
    return math.random(Config.MinPayout, Config.MaxPayout)
end