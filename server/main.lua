ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)
  ESX = obj
end)

ESX.RegisterServerCallback("hud:getPlayers", function(_source, cb)
  local players = ESX.GetPlayers()
  local count = 0

  for _ in pairs(players) do
    count = count + 1
  end

  cb(count)
end)
