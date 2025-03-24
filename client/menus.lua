-- Example: Treatment Menu
function OpenTreatmentMenu()
    local elements = {}
    for _, injury in ipairs(Config.Injuries) do
        table.insert(elements, {label = "Treat " .. injury, value = injury})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'treatment_menu', {
        title = "Select Treatment",
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        StartTreatment(data.current.value)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end