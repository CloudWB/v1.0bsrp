Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {900, 3000}, cops = 1, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2555.68, 380.66, 108.6-0.98), heading = 358.4, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1697.1, 4923.0, 42.06-0.98), heading = 325.1, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1819.43, 793.94, 138.08-0.98), heading = 136.2, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.06, -323.22, 69.20-0.98), heading = 111.6, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-46.90, -1758.55, 29.42-0.98), heading = 58.4, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1391.76, 3606.25, 34.98-0.98), heading = 193.3, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.94, 2711.22, 38.15-0.98), heading = 173.3, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-2966.38, 390.68, 15.04-0.98), heading = 81.5, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},    
    {coords = vector3(-1485.89, -377.87, 40.16-0.98), heading = 130.7, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.80, -908.49, 12.32-0.98), heading = 30.9, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1134.11, -982.35, 46.41-0.98), heading = 278.6, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1728.19, 6416.48, 35.03-0.98), heading = 253.3, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2676.63, 3279.87, 55.24-0.98), heading = 330.5, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1959.03, 3741.23, 32.34-0.98), heading = 307.4, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.55, 2669.71, 42.15-0.98), heading = 42.1, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3243.82, 999.95, 12.83-0.98), heading = 1.4, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3040.17, 583.95, 7.9-0.98), heading = 7.2, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2555.68, 380.66, 108.6-0.98), heading = 358.4, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {900, 3000}, cops = 2, blip = false, name = 'LSPD INFORMATION', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}

}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'commerçant',
        ['robbed'] = "Je viens d'être volé je n'ai plus d'argent !",
        ['cashrecieved'] = 'Vous avez volé :',
        ['currency'] = '$',
        ['scared'] = 'Effrayé:',
        ['no_cops'] = 'Il y a ~r~ pas ~w~ assez de flics en ligne !',
        ['cop_msg'] = '~b~Identité : ~w~Apu \n~b~Localisation : ~w~Forum Drive (5119m)\n~b~Infos : ~w~Braquage de superette',
        ['cop_yes_no'] = 'Accepter : ~g~E ~w~ou ~r~X',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = 'CENTRAL',
        ['walked_too_far'] = 'Tu as marché trop loin !'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}