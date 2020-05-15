ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

spawnCar = function(car)

    local car = GetHashKey(car)



    RequestModel(car)

    while not HasModelLoaded(car) do

        RequestModel(car)

        Citizen.Wait(1)

    end


    local vehicle = CreateVehicle(car, 437.698, -1022.361, 28.652, 28.652, true, false)

    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "POLICE")
end


local LSPD = {

    Base = { Title = "LSPD" },

    Data = { currentMenu = "~b~Liste des véhicules LSPD" },

    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            if btn.name == "Police - Charger" then

                spawnCar("police2")

                Citizen.Wait(1)

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1) 
          end

            if btn.name == "Police - Charger Banalisé" then

                Citizen.Wait(1)

                spawnCar("police12")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
         end

            if btn.name == "Police - Dodge" then

                Citizen.Wait(1)

                spawnCar("police8")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
         end

            if btn.name == "Police - Patrouille Cadet" then

                Citizen.Wait(1)

                spawnCar("police")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
        end

            if btn.name == "Police - 4x4" then

                Citizen.Wait(1)

                spawnCar("police6")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
      end

            if btn.name == "Police - Ford SUV" then

                Citizen.Wait(1)

                spawnCar("police3")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
    end

            if btn.name == "Police - Moto 1" then

                Citizen.Wait(1)

                spawnCar("policeb")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
    end


            if btn.name == "Police - UMK - Washington 2" then

                Citizen.Wait(1)

                spawnCar("police4")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
   end

            if btn.name == "Police - VDP - SUV" then

                Citizen.Wait(1)

                spawnCar("policet")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
   end

            if btn.name == "Police - Riot" then

                Citizen.Wait(1)

                spawnCar("riot")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
   end

            if btn.name == "Police - SultanRS" then

                Citizen.Wait(1)

                spawnCar("policesultanrs")

                ESX.ShowAdvancedNotification("LSPD", "Achat Effectué", "Le véhicule se trouve juste derriere vous", "CHAR_CALL911", 1)

            end

        end,

    },

        Menu = {

       ["~b~Liste des véhicules LSPD"] = {
              b = {
                {name = "Police - Charger", ask = "→", askX = true},
                {name = "Police - Patrouille Cadet", ask = "→", askX = true},
                {name = "Police - Moto 1", ask = "→", askX = true},
                {name = "Police - UMK - Washington 2", ask = "→", askX = true},
                {name = "Police - SultanRS", ask = "→", askX = true},
                {name = "Police - Riot", ask = "→", askX = true},
                {name = "Police - VDP - SUV", ask = "→", askX = true},
                {name = "Police - Ford SUV", ask = "→", askX = true},
                {name = "Police - 4x4", ask = "→", askX = true},
                {name = "Police - Charger Banalisé", ask = "→", askX = true},
                {name = "Police - Dodge", ask = "→", askX = true},


              }
          },

      }
  }

local lspd = vector3(457.535, -1008.364, 28.298)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if Vdist2(GetEntityCoords(PlayerPedId(), false), lspd) < 1.5 then
                 if ESX.PlayerData.job.name == 'police' then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour sortir un ~b~Véhicule")

		    if IsControlJustPressed(1,51) then 
                CreateMenu(LSPD)
               end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_andreas")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_andreas", 458.654, -1008.088, 27.271, 91.220, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

