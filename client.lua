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
