ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RMenu.Add('paramètres', 'main', RageUI.CreateMenu("Paramètres", "~b~Menu~s~ Paramètres"))
RMenu.Add('paramètres', 'optiperso', RageUI.CreateSubMenu(RMenu:Get('paramètres', 'main'), "Paramètres", "~b~Menu~s~ Optimisation"))
RMenu.Add('paramètres', 'minimap', RageUI.CreateSubMenu(RMenu:Get('paramètres', 'main'), "Paramètres", "~b~Menu~s~ MiniMap"))
RMenu.Add('paramètres', 'filtre', RageUI.CreateSubMenu(RMenu:Get('paramètres', 'main'), "Paramètres", "~b~Menu~s~ Filtres & Couleurs"))

RageUI.CreateWhile(1.0, RMenu:Get('paramètres', 'main'), 56, function()

    RageUI.IsVisible(RMenu:Get('paramètres', 'main'), true, true, true, function()

        RageUI.Button("Optimisation Personnage", "Optimiser son Personnage", { RightLabel = "→→→" }, true, function()
        end, RMenu:Get('paramètres', 'optiperso'))
        RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("Tomber | Se relever", "KO !", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerEvent("Ragdoll", plyPed)
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("Mode Cinématique", "Bande Noir !", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                openCinematique()
            end
        end)
        RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("Afficher | Cacher MiniMap", "Afficher | Cacher MiniMap", { RightLabel = "→→→" }, true, function()
        end, RMenu:Get('paramètres', 'minimap'))
        RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("Filtres & Couleurs", "Filtres & Couleurs", { RightLabel = "→→→" }, true, function()
        end, RMenu:Get('paramètres', 'filtre'))

    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('paramètres', 'optiperso'), true, true, true, function()

        RageUI.Button("Syncroniser son Personnage", "Syncroniser Votre Personnage !", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ESX.ShowNotification('Personnage ~g~Synchronisé~s~')
                PlaySoundFrontend( -1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                Citizen.Wait(1)
            end
        end)
        
        

        RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        RageUI.Button("Débug son Personnage", "Débuguer Votre Personnage  !", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ESX.ShowNotification('Personnage ~g~Débug~s~')
				TriggerEvent('powx:playerSpawned')
				TriggerEvent("powx:getPlayerData")
                TriggerEvent("powx:getPlayerDataMoney")
                ClearBrief()
                ClearGpsFlags()
                ClearPrints()
                ClearSmallPrints()
                ClearReplayStats()
                LeaderboardsClearCacheData()
                ClearFocus()
                ClearHdArea()
                ClearHelp()
                ClearNotificationsPos()
                ClearPedInPauseMenu()
                ClearFloatingHelp()
                ClearGpsPlayerWaypoint()
                ClearGpsRaceTrack()
                ClearReminderMessage()
                ClearThisPrint()
                RemoveLoadingPrompt()
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
            end
        end)
    end, function()
    end)

        RageUI.IsVisible(RMenu:Get('paramètres', 'minimap'), true, true, true, function()

            RageUI.Button("------------------------ ~g~Afficher~s~ la Carte -------------------------", "Afficher la Carte !", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    ESX.ShowNotification('MiniMap | ~g~Activé')
                    DisplayRadar(true)
                end
            end)
            RageUI.Button("------------------------ ~r~Cacher~s~ la Carte --------------------------", "Cacher la Carte !", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    ESX.ShowNotification('MiniMap | ~r~Désactiver')
                    DisplayRadar(false)
                end
            end)

    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('paramètres', 'filtre'), true, true, true, function()

        RageUI.Button("~b~Filtre~s~ : Normale", "Filtre : Normale", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetTimecycleModifier('')
                end
            end)
            RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
            RageUI.Button("~b~Filtre~s~ : Améliorées", "Filtre : Améliorées", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetTimecycleModifier('tunnel')
                end
            end)
            RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
            RageUI.Button("~b~Filtre~s~ : Noir et Blancs", "Filtre : Noir et Blancs", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetTimecycleModifier('rply_saturation_neg')
                end
            end)
            RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
            RageUI.Button("~b~Filtre~s~ : Cinema", "Filtre : Cinema", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetTimecycleModifier('cinema')
                end
            end)
            RageUI.Button("------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
            RageUI.Button("~b~Filtre~s~ : Couleurs Thermique", "Filtre : Couleurs Thermique", {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetTimecycleModifier('rply_saturation')
                end
            end)
        end, function()
            ---Panels
          
        end)
    
    end)



--Fonction Tomber | Se relever

function setRagdoll(flag)
	ragdoll = flag
end
  
Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  if ragdoll then
	SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
  end
end
end)

ragdol = true

RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
  if (ragdol) then
	  setRagdoll(true)
	  ragdol = false
  else
	  setRagdoll(false)
	  ragdol = true
  end
end)



--Fonction Mode Cinematique


local hasCinematic = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPauseMenuActive() then
			ESX.UI.HUD.SetDisplay(0.0)
		elseif hasCinematic == true then
			ESX.UI.HUD.SetDisplay(0.0)
		end
	end
end)

 function openCinematique()
	hasCinematic = not hasCinematic
	if not hasCinematic then -- show
		SendNUIMessage({openCinema = true})
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
		TriggerEvent('ui:toggle', false)
	elseif hasCinematic then -- hide
		SendNUIMessage({openCinema = false})
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('es:setMoneyDisplay', 1.0)
		TriggerEvent('esx_status:setDisplay', 1.0)
		DisplayRadar(true)
		TriggerEvent('ui:toggle', true)
	end
 end