Citizen.CreateThread(function()
  while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
      Citizen.Wait(10)
  end

  PlayerData = ESX.GetPlayerData()
end)

AddEventHandler('esx:onPlayerDeath', function(data)
  isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
  isDead = false
end)

local hacking = false

RegisterNetEvent('usbdrugs:used')
AddEventHandler('usbdrugs:used', function()
  TriggerEvent('mhacking:show')
  TriggerEvent('mhacking:start',3,20,mycb2)
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        if GetDistanceBetweenCoords(coords, 2719.523, -363.7117, -53.58677, true) < 2.0 then
            ESX.Game.Utils.DrawText3D(vector3( 2719.523, -363.7117, -53.58677), "PRESS [E] TO ~r~HACK~s~ USB.", 0.6)
            if IsControlJustReleased(0, 38) then
                ClearAllBlipRoutes()
                SetBlipAlpha(blip, 0)
                Citizen.Wait(10)
                DoScreenFadeOut(1000)
                TriggerEvent('mhacking:show')
                TriggerEvent('mhacking:start',3,20,mycb)
                hacking = true
                break
            end
            end
    end
end)

RegisterNetEvent('usbdrugs:collected')
AddEventHandler('usbdrugs:collected', function()
  Wait(1500)
  ClearAllBlipRoutes()
end)

function mycb(success, timeremaining)
  if success then
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    exports['mythic_notify']:DoLongHudText ('success', 'System successfully hacked!')
    DoScreenFadeIn(1000)
    Citizen.Wait(2000)
    exports['mythic_notify']:DoLongHudText ('inform', 'On your map you will find a location')
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    local blip = AddBlipForCoord(990.783, -2149.724, 30.20534)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 5)
    Citizen.Wait(500)
    createped()
    Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0)
          local playerPed = PlayerPedId()
          local coords = GetEntityCoords(playerPed)
          if GetDistanceBetweenCoords(coords, 990.783, -2149.724, 30.20534, true) < 12.0 then
              ESX.Game.Utils.DrawText3D(vector3(990.783, -2149.724, 30.20534), "Press [E] to steal ~r~cocaine~s~.", 0.6)
              if IsControlJustReleased(0, 38) then
                SetBlipAlpha(blip, 0)
                TriggerEvent('mhacking:show')
                TriggerEvent('mhacking:start',1,30,mycb3)
                hacking = true
                break
              end
          end
      end
  end)
    hacking = false
  else
    print('Failed')
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    ClearAllBlipRoutes()
    RemoveBlip(blip)
    hacking = false
  end
end

function mycb2(success, timeremaining)
  if success then
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    createped()
    exports['mythic_notify']:DoLongHudText ('success', 'System successfully hacked!')
    Citizen.Wait(2000)
    exports['mythic_notify']:DoLongHudText ('inform', 'On your map you will find a location')
    Citizen.Wait(2000)
    exports['mythic_notify']:DoLongHudText ('inform', 'You may find something of interest')
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    local blip = AddBlipForCoord(-1708.438, -1120.245, 12.45333)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 5)
    hacking = false
  else
    print('Failed')
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    ClearAllBlipRoutes()
    RemoveBlip(blip)
    hacking = false
  end
end

function mycb3(success, timeremaining)
  if success then
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Citizen.Wait(1500)
    exports['progressBars']:startUI(30000, "Stealing cocaine!")
    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
    Citizen.Wait(31000)
    ClearPedTasksImmediately(playerPed)
      TriggerServerEvent('usbdrugs:reward')-- pressed
      Citizen.Wait(1000)
      ClearAllBlipRoutes()
      SetBlipAlpha(blip, 0)
    hacking = false
  else
    print('Failed')
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    ClearAllBlipRoutes()
    RemoveBlip(blip)
    hacking = false
  end
end

function createped()

  local pos = GetEntityCoords(GetPlayerPed(-1))
  local hashKey1 = GetHashKey("Lost01GMY")
  local hashKey2 = GetHashKey("Lost02GMY")
  local hashKey3 = GetHashKey("Lost03GMY")
  local pedSpawned = false
  local pedType = 5

  RequestModel(hashKey)
  while not HasModelLoaded(hashKey) do
      RequestModel(hashKey)
      Citizen.Wait(500)
  end

  RequestModel(hashKey2)
  while not HasModelLoaded(hashKey2) do
      RequestModel(hashKey2)
      Citizen.Wait(500)
  end

  RequestModel(hashKey3)
  while not HasModelLoaded(hashKey3) do
      RequestModel(hashKey3)
      Citizen.Wait(500)
  end

  print('Spawning Peds?')

  guard = CreatePed(pedType, hashKey1,-1708.438, -1120.245, 12.45333, 0, 1, 1)
  guard2 = CreatePed(pedType, hashKey2,-1708.438, -1120.245, 12.45333, 1, 1, 1)
  guard3 =  CreatePed(pedType, hashKey3,-1708.438, -1120.245, 12.45333, 2, 1, 1)


  SetPedShootRate(guard,  750)
  SetPedCombatAttributes(guard, 46, true)
  SetPedFleeAttributes(guard, 0, 0)
  SetPedAsEnemy(guard,true)
  SetPedMaxHealth(guard, 900)
  SetPedAlertness(guard, 3)
  SetPedCombatRange(guard, 0)
  SetPedCombatMovement(guard, 3)
  TaskCombatPed(guard, GetPlayerPed(-1), 0,16)
  GiveWeaponToPed(guard, GetHashKey("WEAPON_SMG"), 5000, true, true)
  SetPedRelationshipGroupHash( guard, GetHashKey("HATES_PLAYER"))

  SetPedShootRate(guard2,  750)
  SetPedCombatAttributes(guard2, 46, true)
  SetPedFleeAttributes(guard2, 0, 0)
  SetPedAsEnemy(guard2,true)
  SetPedMaxHealth(guard2, 900)
  SetPedAlertness(guard2, 3)
  SetPedCombatRange(guard2, 0)
  SetPedCombatMovement(guard2, 3)
  TaskCombatPed(guard2, GetPlayerPed(-1), 0,16)
  GiveWeaponToPed(guard2, GetHashKey("WEAPON_SMG"), 5000, true, true)
  SetPedRelationshipGroupHash( guard2, GetHashKey("HATES_PLAYER"))

  SetPedShootRate(guard3,  750)
  SetPedCombatAttributes(guard3, 46, true)
  SetPedFleeAttributes(guard3, 0, 0)
  SetPedAsEnemy(guard3,true)
  SetPedMaxHealth(guard3, 900)
  SetPedAlertness(guard3, 3)
  SetPedCombatRange(guard3, 0)
  SetPedCombatMovement(guard3, 3)
  TaskCombatPed(guard3, GetPlayerPed(-1), 0,16)
  GiveWeaponToPed(guard3, GetHashKey("WEAPON_SMG"), 5000, true, true)
  SetPedRelationshipGroupHash( guard3, GetHashKey("HATES_PLAYER"))
end