ESX = exports.es_extended:getSharedObject()

local inHeal = false

local healingZone = BoxZone:Create(
    vector3(v.zone.x, v.zone.y, v.zone.z),
    v.zone.l, v.zone.w, {
        name = v.zone.name,
        heading = v.zone.h,
        debugPoly = false,
        minZ = v.zone.minZ,
        maxZ = v.zone.maxZ,
        onEnter = onEnter,
        onExit = onExit,
    }
)
local timeTotal = 10 * 1000
local onzone = false

for k, v in inpairs(Config.stressZone) do
healingZone:onPlayerInOut(function(isPointInside)
    local IsLoaded = ESX.IsPlayerLoaded()
    if IsLoaded then
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        if isPointInside then
            onzone = true
            ESX.ShowNotification('Kamu Memasuki Zona Nyaman!')
            -- lib.showTextUI('Zona Healing', {
            --     icon = 'fas fa-briefcase-medical',
            -- })
		    inHeal = true
            SetEntityHealth(PlayerPedId(), PlayerPedId())
            SetCanAttackFriendly(PlayerPedId(), false, true)
            NetworkSetFriendlyFireOption(false)
            SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
			while inHeal do
                reduceStress()
                Wait(timeTotal)
			end
        else
            onzone = false 
            NetworkSetFriendlyFireOption(true)
            ESX.ShowNotification('Kamu Memasuki Zona Nyaman!')
			-- lib.hideTextUI()
            inHeal = false
            SetCanAttackFriendly(PlayerPedId(), true, false)
            NetworkSetFriendlyFireOption(true)
        end
    end
end)
end

CreateThread(function()
    while isPointInside do
        Wait(0)
        local weapon = GetSelectedPedWeapon(ped)
            DisableControlAction(0, 24, true) -- LEFT MOUSE BUTTON
            DisableControlAction(0, 25, true) -- RIGHT MOUSE BUTTON
            DisableControlAction(0, 37, true) -- TAB
            DisableControlAction(0, 140, true)
            if IsDisabledControlJustPressed(2, 37) then
                TriggerEvent('ox_inventory:disarm')
            end
            if IsDisabledControlJustPressed(0, 24) then
                TriggerEvent('ox_inventory:disarm')
            end
            if IsDisabledControlJustPressed(0, 25) then
                TriggerEvent('ox_inventory:disarm')
            end
            if IsDisabledControlJustPressed(0, 37) then
                TriggerEvent('ox_inventory:disarm')
            end
    end
end)


function onEnter(self)
    for k, v in pairs (Config.Positions) do
            lib.showTextUI('Zona Nyaman',{
                icon = 'fas briefcase-medical',
            })
    end
end

function onExit(self)  
    lib.hideTextUI()
end


function InHealZone()
    return inHeal
end

exports('InHealZone', InHealZone)

function reduceStress()
	TriggerEvent('esx_status:remove', 'stress', 10000)
end
