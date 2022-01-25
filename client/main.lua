local ESX = nil
local visible = true

Citizen.CreateThread(function()
  while not ESX do
    TriggerEvent('esx:getSharedObject', function (obj)
      ESX = obj
    end)
    Citizen.Wait(0);
  end
  ESX.PlayerData = ESX.GetPlayerData()
  togHud(true)
  local ped = GetPlayerPed()
  SetEntityMaxHealth(ped, 200)
  SetEntityHealth(ped, 200)
end)

function togHud(tog)
  SendNUIMessage({ 
    type = tog and 'open' or 'close'
  })

  visible = tog
end

function updateHud()
  local ped = GetPlayerPed()
  local hunger = 0
  local thirst = 0
  ESX.PlayerData = ESX.GetPlayerData()
  local job = ESX.PlayerData.job.label or "Loading..."
  local grade = ESX.PlayerData.job.grade_label or "Loading..."

  TriggerEvent('esx_status:getStatus', 'hunger', function(status)
    hunger = status.getPercent()
  end)
  TriggerEvent('esx_status:getStatus', 'thirst', function(status)
    thirst = status.getPercent()
  end)

  ESX.TriggerServerCallback('hud:getPlayers', function(count)
    SendNUIMessage({
      type = 'update',
      health = GetEntityHealth(ped) - 100,
      armor = GetPedArmour(ped),
      hunger = hunger,
      thirst = thirst,
      players = count,
      job = job,
      grade = grade
    })
  end)
end

RegisterNetEvent('esx:playerLoaded');
AddEventHandler('esx:playerLoaded', function()
  togHud(true)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlPressed(0, Config.TogKey2) and IsControlJustPressed(0, Config.TogKey) then
      togHud(not visible)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
    updateHud()
  end
end)
