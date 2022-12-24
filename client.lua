Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1000)
      local maxSpeed = 40
      local playerPed = PlayerPedId()
      local vehiculo = GetVehiclePedIsUsing(playerPed)
      local currentSpeed = (GetEntitySpeed(vehiculo)* 2.236936) 
      if currentSpeed > maxSpeed and IsPedSittingInAnyVehicle(PlayerPedId()) and GetPedInVehicleSeat(vehiculo, -1) == PlayerPedId() then 
        SetCurrentPedWeapon(playerPed, 0xA2719263, true)
      end
    end
  end)


-------------------TEST-----------
local ESX = require('es_extended')
local Notifications = ESX.GetNotificationHandle()

-- Establece la velocidad máxima permitida.
local MaxSpeed = 50

-- Crea un hilo que se ejecutará cada segundo.
Citizen.CreateThread(function()
  while true do
    -- Espera un segundo antes de volver a comprobar la velocidad.
    Citizen.Wait(1000)

    -- Obtén el ID del jugador y el vehículo que está utilizando.
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(playerPed)

    -- Comprueba si el jugador está en un vehículo.
    if DoesEntityExist(vehicle) then
      -- Obtén la velocidad actual del vehículo.
      local speed = (GetEntitySpeed(vehicle) * 2.236936)

      -- Si la velocidad supera la velocidad máxima permitida, deshabilita el disparo.
      if speed > MaxSpeed then
        SetPlayerCanDoDriveBy
(PlayerId(), false)
Notifications.PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
ESX.ShowNotification('You cannot shoot while driving above r50km/hs!')
else
-- Si la velocidad es inferior o igual a la velocidad máxima permitida, habilita el disparo.
SetPlayerCanDoDriveBy(PlayerId(), true)
end
end
end
end)

