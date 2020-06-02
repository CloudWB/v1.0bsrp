Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(705859983463415898)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('machinalogo.png')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Rejoignez nous dès maintenant')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('discord')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/VaH6R4Z')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)