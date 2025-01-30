-- Generative Neural Network for Pokemon Emerald Auto Battling by Mykola Forest-Chomyn
-- Inspired by the work of SethBling and his MarI/O project as well as the work of 40Cakes and his Pokemon Emerald shiny hunting bot

dofile("Memory.lua")
json = require "json"
PokemonNames = require "PokemonNames"
ItemNames = require "ItemNames"

Population = 300
DeltaDisjoint = 2.0
DeltaWeights = 0.4
DeltaThreshold = 1.0
 
StaleSpecies = 15
 
MutateConnectionsChance = 0.25
PerturbChance = 0.90
CrossoverChance = 0.75
LinkMutationChance = 2.0
NodeMutationChance = 0.50
BiasMutationChance = 0.40
StepSize = 0.1
DisableMutationChance = 0.4
EnableMutationChance = 0.2
 
TimeoutConstant = 20
 
MaxNodes = 1000000

GameSettings = {
	pstats         = 0x20244EC,
    pcount         = 0x20244E9,
	estats         = 0x2024744,
	bag            = 0x2039DD8,
    trainerpointer = 0x3005D90,
}

Types = {
	NORMAL = 0,
	FIGHTING = 1,
	FLYING = 2,
	POISON = 3,
	GROUND = 4,
	ROCK = 5,
	BUG = 6,
	GHOST = 7,
	STEEL = 8,
	FIRE = 10,
	WATER = 11,
	GRASS = 12,
	ELECTRIC = 13,
	PSYCHIC = 14,
	ICE = 15,
	DRAGON = 16,
	DARK = 17
}

TypeByMon = {
    ["Bulbasaur"] = {12, 3},
    ["Ivysaur"] = {12, 3},
    ["Venusaur"] = {12, 3},
    ["Charmander"] = {10},
    ["Charmeleon"] = {10},
    ["Charizard"] = {10, 2},
    ["Squirtle"] = {11},
    ["Wartortle"] = {11},
    ["Blastoise"] = {11},
    ["Caterpie"] = {6},
    ["Metapod"] = {6},
    ["Butterfree"] = {6, 2},
    ["Weedle"] = {6, 3},
    ["Kakuna"] = {6, 3},
    ["Beedrill"] = {6, 3},
    ["Pidgey"] = {0, 2},
    ["Pidgeotto"] = {0, 2},
    ["Pidgeot"] = {0, 2},
    ["Rattata"] = {0},
    ["Raticate"] = {0},
    ["Spearow"] = {0, 2},
    ["Fearow"] = {0, 2},
    ["Ekans"] = {3},
    ["Arbok"] = {3},
    ["Pikachu"] = {13},
    ["Raichu"] = {13},
    ["Sandshrew"] = {4},
    ["Sandslash"] = {4},
    ["NidoranF"] = {3},
    ["Nidorina"] = {3},
    ["Nidoqueen"] = {3, 4},
    ["NidoranM"] = {3},
    ["Nidorino"] = {3},
    ["Nidoking"] = {3, 4},
    ["Clefairy"] = {0},
    ["Clefable"] = {0},
    ["Vulpix"] = {10},
    ["Ninetales"] = {10},
    ["Jigglypuff"] = {0},
    ["Wigglytuff"] = {0},
    ["Zubat"] = {3, 2},
    ["Golbat"] = {3, 2},
    ["Oddish"] = {12, 3},
    ["Gloom"] = {12, 3},
    ["Vileplume"] = {12, 3},
    ["Paras"] = {6, 12},
    ["Parasect"] = {6, 12},
    ["Venonat"] = {6, 3},
    ["Venomoth"] = {6, 3},
    ["Diglett"] = {4},
    ["Dugtrio"] = {4},
    ["Meowth"] = {0},
    ["Persian"] = {0},
    ["Psyduck"] = {11},
    ["Golduck"] = {11},
    ["Mankey"] = {1},
    ["Primeape"] = {1},
    ["Growlithe"] = {10},
    ["Arcanine"] = {10},
    ["Poliwag"] = {11},
    ["Poliwhirl"] = {11},
    ["Poliwrath"] = {11, 1},
    ["Abra"] = {14},
    ["Kadabra"] = {14},
    ["Alakazam"] = {14},
    ["Machop"] = {1},
    ["Machoke"] = {1},
    ["Machamp"] = {1},
    ["Bellsprout"] = {12, 3},
    ["Weepinbell"] = {12, 3},
    ["Victreebel"] = {12, 3},
    ["Tentacool"] = {11, 3},
    ["Tentacruel"] = {11, 3},
    ["Geodude"] = {5, 4},
    ["Graveler"] = {5, 4},
    ["Golem"] = {5, 4},
    ["Ponyta"] = {10},
    ["Rapidash"] = {10},
    ["Slowpoke"] = {11, 14},
    ["Slowbro"] = {11, 14},
    ["Magnemite"] = {13, 8},
    ["Magneton"] = {13, 8},
    ["Farfetchd"] = {0, 2},
    ["Doduo"] = {0, 2},
    ["Dodrio"] = {0, 2},
    ["Seel"] = {11, 15},
    ["Dewgong"] = {11, 15},
    ["Grimer"] = {3},
    ["Muk"] = {3},
    ["Shellder"] = {11},
    ["Cloyster"] = {11, 15},
    ["Gastly"] = {7, 3},
    ["Haunter"] = {7, 3},
    ["Gengar"] = {7, 3},
    ["Onix"] = {5, 4},
    ["Drowzee"] = {14},
    ["Hypno"] = {14},
    ["Krabby"] = {11},
    ["Kingler"] = {11},
    ["Voltorb"] = {13},
    ["Electrode"] = {13},
    ["Exeggcute"] = {12, 14},
    ["Exeggutor"] = {12, 14},
    ["Cubone"] = {4},
    ["Marowak"] = {4},
    ["Hitmonlee"] = {1},
    ["Hitmonchan"] = {1},
    ["Lickitung"] = {0},
    ["Koffing"] = {3},
    ["Weezing"] = {3},
    ["Rhyhorn"] = {4, 5},
    ["Rhydon"] = {4, 5},
    ["Chansey"] = {0},
    ["Tangela"] = {12},
    ["Kangaskhan"] = {0},
    ["Horsea"] = {11},
    ["Seadra"] = {11},
    ["Goldeen"] = {11},
    ["Seaking"] = {11},
    ["Staryu"] = {11},
    ["Starmie"] = {11, 14},
    ["MrMime"] = {14},
	["Scyther"] = {6, 2},
    ["Jynx"] = {15, 14},
    ["Electabuzz"] = {13},
    ["Magmar"] = {10},
    ["Pinsir"] = {6},
    ["Tauros"] = {0},

    ["Magikarp"] = {11},
    ["Gyarados"] = {11, 2},
    ["Lapras"] = {11, 15},
    ["Ditto"] = {0},
    ["Eevee"] = {0},
    ["Vaporeon"] = {11},
    ["Jolteon"] = {13},
    ["Flareon"] = {10},
    ["Porygon"] = {0},
    ["Omanyte"] = {5, 11},
    ["Omastar"] = {5, 11},
    ["Kabuto"] = {5, 11},
    ["Kabutops"] = {5, 11},
    ["Aerodactyl"] = {5, 2},
    ["Snorlax"] = {0},
    ["Articuno"] = {15, 2},
    ["Zapdos"] = {13, 2},
    ["Moltres"] = {10, 2},
    ["Dratini"] = {16},
    ["Dragonair"] = {16},
    ["Dragonite"] = {16, 2},
    ["Mewtwo"] = {14},
    ["Mew"] = {14},
    ["Chikorita"] = {12},
    ["Bayleef"] = {12},
    ["Meganium"] = {12},
    ["Cyndaquil"] = {10},
    ["Quilava"] = {10},
    ["Typhlosion"] = {10},
    ["Totodile"] = {11},
    ["Croconaw"] = {11},
    ["Feraligatr"] = {11},
    ["Sentret"] = {0},
    ["Furret"] = {0},
    ["Hoothoot"] = {0, 2},
    ["Noctowl"] = {0, 2},
    ["Ledyba"] = {6, 2},
    ["Ledian"] = {6, 2},
    ["Spinarak"] = {6, 3},
    ["Ariados"] = {6, 3},
    ["Crobat"] = {3, 2},
    ["Chinchou"] = {11, 13},
    ["Lanturn"] = {11, 13},
    ["Pichu"] = {13},
    ["Cleffa"] = {0},
    ["Igglybuff"] = {0},
    ["Togepi"] = {0},
    ["Togetic"] = {0, 2},
    ["Natu"] = {14, 2},
    ["Xatu"] = {14, 2},
    ["Mareep"] = {13},
    ["Flaaffy"] = {13},
    ["Ampharos"] = {13},
    ["Bellossom"] = {12},
    ["Marill"] = {11},
    ["Azumarill"] = {11},
    ["Sudowoodo"] = {5},
    ["Politoed"] = {11},
    ["Hoppip"] = {12, 2},
    ["Skiploom"] = {12, 2},
    ["Jumpluff"] = {12, 2},
    ["Aipom"] = {0},
    ["Sunkern"] = {12},
    ["Sunflora"] = {12},
    ["Yanma"] = {6, 2},
    ["Wooper"] = {11, 4},
    ["Quagsire"] = {11, 4},
    ["Espeon"] = {14},
    ["Umbreon"] = {17},
    ["Murkrow"] = {17, 2},
    ["Slowking"] = {11, 14},
    ["Misdreavous"] = {7},
    ["Unown"] = {14},
    ["Wobbuffet"] = {14},
    ["Girafarig"] = {0, 14},
    ["Pineco"] = {6},
    ["Forretress"] = {6, 8},
    ["Dunsparce"] = {0},
    ["Gligar"] = {4, 2},
    ["Steelix"] = {8, 4},
    ["Snubbull"] = {0},
    ["Granbull"] = {0},
    ["Qwilfish"] = {11, 3},
    ["Scizor"] = {6, 8},
    ["Shuckle"] = {5, 6},
    ["Heracross"] = {6, 1},
    ["Sneasel"] = {15, 17},
    ["Teddiursa"] = {0},
    ["Ursaring"] = {0},
    ["Slugma"] = {10},
    ["Magcargo"] = {10, 5},
    ["Swinub"] = {15, 4},
    ["Piloswine"] = {15, 4},
    ["Corsola"] = {11, 5},
    ["Remoraid"] = {11},
    ["Octillery"] = {11},
    ["Delibird"] = {15, 2},
    ["Mantine"] = {11, 2},
    ["Skarmory"] = {8, 2},
    ["Houndour"] = {10, 17},
    ["Houndoom"] = {10, 17},
    ["Kingdra"] = {11, 16},
    ["Phanpy"] = {4},
    ["Donphan"] = {4},
    ["Porygon2"] = {0},
    ["Stantler"] = {0},
    ["Smeargle"] = {0},
    ["Tyrogue"] = {1},
    ["Hitmontop"] = {1},
    ["Smoochum"] = {15, 14},
    ["Elekid"] = {13},
    ["Magby"] = {10},
    ["Miltank"] = {0},
    ["Blissey"] = {0},
    ["Raikou"] = {13},
    ["Entei"] = {10},
    ["Suicune"] = {11},
    ["Larvitar"] = {5, 4},
    ["Pupitar"] = {5, 4},
    ["Tyranitar"] = {5, 17},
    ["Lugia"] = {14, 2},
    ["Ho-oh"] = {10, 2},
    ["Celebi"] = {12, 14},
	["Treecko"] = {12},
    ["Grovyle"] = {12},
    ["Sceptile"] = {12},
    ["Torchic"] = {10},
    ["Combusken"] = {10, 1},
    ["Blaziken"] = {10, 1},
    ["Mudkip"] = {11},
    ["Marshtomp"] = {11, 4},
    ["Swampert"] = {11, 4},
    ["Poochyena"] = {17},
    ["Mightyena"] = {17},
    ["Zigzagoon"] = {0},
    ["Linoone"] = {0},
    ["Wurmple"] = {6},
    ["Silcoon"] = {6},
    ["Beautifly"] = {6, 2},
    ["Cascoon"] = {6},
    ["Dustox"] = {6, 3},
    ["Lotad"] = {11, 12},
    ["Lombre"] = {11, 12},
    ["Ludicolo"] = {11, 12},
    ["Seedot"] = {12},
    ["Nuzleaf"] = {12, 17},
    ["Shiftry"] = {12, 17},
    ["Taillow"] = {0, 2},
    ["Swellow"] = {0, 2},
    ["Wingull"] = {11, 2},
    ["Pelipper"] = {11, 2},
    ["Ralts"] = {14},
    ["Kirlia"] = {14},
    ["Gardevoir"] = {14},
    ["Surskit"] = {6, 11},
    ["Masquerain"] = {6, 2},
    ["Shroomish"] = {12},
    ["Breloom"] = {12, 1},
    ["Slakoth"] = {0},
    ["Vigoroth"] = {0},
    ["Slaking"] = {0},
    ["Nincada"] = {6, 4},
    ["Ninjask"] = {6, 2},
    ["Shedinja"] = {6, 7},
    ["Whismur"] = {0},
    ["Loudred"] = {0},
    ["Exploud"] = {0},
    ["Makuhita"] = {1},
    ["Hariyama"] = {1},
    ["Azurill"] = {0},
    ["Nosepass"] = {5},
    ["Skitty"] = {0},
    ["Delcatty"] = {0},
    ["Sableye"] = {7, 17},
    ["Mawile"] = {8},
    ["Aron"] = {8, 5},
    ["Lairon"] = {8, 5},
    ["Aggron"] = {8, 5},
    ["Meditite"] = {1, 14},
    ["Medicham"] = {1, 14},
    ["Electrike"] = {13},
    ["Manectric"] = {13},
    ["Plusle"] = {13},
    ["Minun"] = {13},
    ["Volbeat"] = {6},
    ["Illumise"] = {6},
    ["Roselia"] = {12, 3},
    ["Gulpin"] = {3},
    ["Swalot"] = {3},
    ["Carvanha"] = {11, 17},
    ["Sharpedo"] = {11, 17},
    ["Wailmer"] = {11},
    ["Wailord"] = {11},
    ["Numel"] = {10, 4},
    ["Camerupt"] = {10, 4},
    ["Torkoal"] = {10},
    ["Spoink"] = {14},
    ["Grumpig"] = {14},
    ["Spinda"] = {0},
    ["Trapinch"] = {4},
    ["Vibrava"] = {4, 16},
    ["Flygon"] = {4, 16},
    ["Cacnea"] = {12},
    ["Cacturne"] = {12, 17},
    ["Swablu"] = {0, 2},
    ["Altaria"] = {16, 2},
    ["Zangoose"] = {0},
    ["Seviper"] = {3},
    ["Lunatone"] = {5, 14},
    ["Solrock"] = {5, 14},
    ["Barboach"] = {11, 4},
    ["Whiscash"] = {11, 4},
    ["Corphish"] = {11},
    ["Crawdaunt"] = {11, 17},
    ["Baltoy"] = {4, 14},
    ["Claydol"] = {4, 14},
    ["Lileep"] = {5, 12},
    ["Cradily"] = {5, 12},
    ["Anorith"] = {5, 6},
    ["Armaldo"] = {5, 6},
    ["Feebas"] = {11},
    ["Milotic"] = {11},
    ["Castform"] = {0},
    ["Kecleon"] = {0},
    ["Shuppet"] = {7},
    ["Banette"] = {7},
    ["Duskull"] = {7},
    ["Dusclops"] = {7},
    ["Tropius"] = {12, 2},
    ["Chimecho"] = {14},
    ["Absol"] = {17},
    ["Wynaut"] = {14},
    ["Snorunt"] = {15},
    ["Glalie"] = {15},
    ["Spheal"] = {11, 15},
    ["Sealeo"] = {11, 15},
    ["Walrein"] = {11, 15},
    ["Clamperl"] = {11},
    ["Huntail"] = {11},
    ["Gorebyss"] = {11},
    ["Relicanth"] = {11, 5},
    ["Luvdisc"] = {11},
    ["Bagon"] = {16},
    ["Shelgon"] = {16},
    ["Salamence"] = {16, 2},
    ["Beldum"] = {8, 14},
    ["Metang"] = {8, 14},
    ["Metagross"] = {8, 14},
    ["Regirock"] = {5},
    ["Regice"] = {15},
    ["Registeel"] = {8},
    ["Latias"] = {14, 16},
    ["Latios"] = {14, 16},
    ["Kyogre"] = {11},
    ["Groudon"] = {4},
    ["Rayquaza"] = {16, 2},
    ["Jirachi"] = {8, 14},
    ["Deoxys"] = {14},
}

buttons = {
    ["A"] = false,
    ["B"] = false,
    ["L"] = false,
    ["R"] = false,
    ["Up"] = false,
    ["Down"] = false,
    ["Left"] = false,
    ["Right"] = false,
    ["Select"] = false,
    ["Start"] = false,
}

function releaseAllButtons()
    for key, value in pairs(buttons) do
        buttons[key] = false
    end
end

-- Function to read the data of a Pokemon from the given address
function readMonData(address)
	local mon = {}
	mon.personality = Memory.readdword(address + 0)
	mon.magicWord = mon.personality ~ Memory.readdword(address + 4)
	mon.otId = Memory.readdword(address + 4)
	mon.language = Memory.readbyte(address + 18)
	local flags = Memory.readbyte(address + 19)
	mon.isBadEgg = flags & 1
	mon.hasSpecies = (flags >> 1) & 1
	mon.isEgg = (flags >> 2) & 1
	mon.markings = Memory.readbyte(address + 27)
	mon.status = Memory.readdword(address + 80)
	mon.level = Memory.readbyte(address + 84)
	mon.mail = Memory.readdword(address + 85)
	mon.hp = Memory.readword(address + 86)
	mon.maxHP = Memory.readword(address + 88)
	mon.attack = Memory.readword(address + 90)
	mon.defense = Memory.readword(address + 92)
	mon.speed = Memory.readword(address + 94)
	mon.spAttack = Memory.readword(address + 96)
	mon.spDefense = Memory.readword(address + 98)
	
	local key = mon.otId ~ mon.personality
	local substructSelector = {
		[ 0] = {0, 1, 2, 3},
		[ 1] = {0, 1, 3, 2},
		[ 2] = {0, 2, 1, 3},
		[ 3] = {0, 3, 1, 2},
		[ 4] = {0, 2, 3, 1},
		[ 5] = {0, 3, 2, 1},
		[ 6] = {1, 0, 2, 3},
		[ 7] = {1, 0, 3, 2},
		[ 8] = {2, 0, 1, 3},
		[ 9] = {3, 0, 1, 2},
		[10] = {2, 0, 3, 1},
		[11] = {3, 0, 2, 1},
		[12] = {1, 2, 0, 3},
		[13] = {1, 3, 0, 2},
		[14] = {2, 1, 0, 3},
		[15] = {3, 1, 0, 2},
		[16] = {2, 3, 0, 1},
		[17] = {3, 2, 0, 1},
		[18] = {1, 2, 3, 0},
		[19] = {1, 3, 2, 0},
		[20] = {2, 1, 3, 0},
		[21] = {3, 1, 2, 0},
		[22] = {2, 3, 1, 0},
		[23] = {3, 2, 1, 0},
	}
	
	local pSel = substructSelector[mon.personality % 24]
	local ss0 = {}
	local ss1 = {}
	local ss2 = {}
	local ss3 = {}
	
	for i = 0, 2 do
		ss0[i] = Memory.readdword(address + 32 + pSel[1] * 12 + i * 4) ~ key
		ss1[i] = Memory.readdword(address + 32 + pSel[2] * 12 + i * 4) ~ key
		ss2[i] = Memory.readdword(address + 32 + pSel[3] * 12 + i * 4) ~ key
		ss3[i] = Memory.readdword(address + 32 + pSel[4] * 12 + i * 4) ~ key
	end
	
	mon.species = (ss0[0] & 0xFFFF) + 1
	mon.name = PokemonNames[mon.species]
	mon.heldItem = ss0[0] >> 16
	mon.experience = ss0[1]
	mon.ppBonuses = ss0[2] & 0xFF
	mon.friendship = (ss0[2] >> 8) & 0xFF
	
	mon.moves = {
		ss1[0] & 0xFFFF,
		ss1[0] >> 16,
		ss1[1] & 0xFFFF,
		ss1[1] >> 16
	}
	mon.pp = {
		ss1[2] & 0xFF,
		(ss1[2] >> 8) & 0xFF,
		(ss1[2] >> 16) & 0xFF,
		ss1[2] >> 24
	}
	
	mon.hpEV = ss2[0] & 0xFF
	mon.attackEV = (ss2[0] >> 8) & 0xFF
	mon.defenseEV = (ss2[0] >> 16) & 0xFF
	mon.speedEV = ss2[0] >> 24
	mon.spAttackEV = ss2[1] & 0xFF
	mon.spDefenseEV = (ss2[1] >> 8) & 0xFF
	
	mon.pokerus = ss3[0] & 0xFF
	mon.metLocation = (ss3[0] >> 8) & 0xFF
	flags = ss3[0] >> 16
	mon.metLevel = flags & 0x7F
	mon.metGame = (flags >> 7) & 0xF
	mon.pokeball = (flags >> 11) & 0xF
	mon.otGender = (flags >> 15) & 0x1
	flags = ss3[1]
	mon.hpIV = flags & 0x1F
	mon.attackIV = (flags >> 5) & 0x1F
	mon.defenseIV = (flags >> 10) & 0x1F
	mon.speedIV = (flags >> 15) & 0x1F
	mon.spAttackIV = (flags >> 20) & 0x1F
	mon.spDefenseIV = (flags >> 25) & 0x1F
	mon.altAbility = (flags >> 31) & 1
	flags = ss3[2]

	mon.types = getMonType()
    
	return mon
end

-- Function to get the data of an item from the given address
function readItemData(addr, securityKey)
	local item = {}

	item.type = Memory.readword(addr + 0)
	item.name = ItemNames[item.type + 1]
	item.quantity = Memory.readword(addr + 2) ~ securityKey

	return item
end

-- Function to get data of all items in the player's bag
function getBag()
	local trainer = Memory.readdword(GameSettings.trainerpointer)
	local securityKey = Memory.readword(trainer + 172)

	local bag = {}
	local bagType = {"Items", "Poké Balls", "TMs & HMs", "Berries", "Key Items"}

	for i=0, 4 do
		local startBag = Memory.readdword(GameSettings.bag + i * 8)
		local numberOfBytes = Memory.readbyte(GameSettings.bag + i * 8 + 4)
		bag[bagType[i + 1]] = {}
		for j = 1, numberOfBytes do
			bag[bagType[i + 1]][j] = readItemData(startBag, securityKey)
			startBag = startBag + 4
		end
	end

	return bag
end

-- Function to get data of all Pokemon in the player's party
function getParty()
	local party = {}
	local start = GameSettings.pstats
	local partyCount = GameSettings.pcount
	
	for i = 1, Memory.readbyte(partyCount) do
		party[i] = readMonData(start)
		start = start + 100 -- Pokemon data structure is 100 bytes
	end
	
	return party
end

function getOpponent()
    local opponent = {}
    local start = GameSettings.estats
    
    opponent = readMonData(start)
    
    return opponent
end

function getMonType(mon)
    local types = {}
	local name = mon.name

	if TypeByMon[name] then
		types = TypeByMon[name]
	end

	return types
end

-- Function to get data related to the emulator itself
function getEmu()
	local emu_data = {
		frameCount = emu.framecount(),
		fps = client.get_approx_framerate(),
		detectedGame = GameSettings.gamename,
		rngState = Memory.readdword(GameSettings.rng),
		language = GameSettings.language
	}
	
	return emu_data
end

function WaitFrames(frames)
    local emuSpeed = GetEmu().speed
    local sleepTime = math.max((frames / 60.0) / emuSpeed, 0.02)
    for i=1, sleepTime do
		emu.frameadvance()
	end
end


function pressButton(button)
	controller = {}
	releaseAllButtons()
	controller[button] = true
	joypad.set(controller)
	WaitFrames(5)
	releaseAllButtons()
end

function getInputs()
	local inputs = {}
	
	inputs["party"] = getParty()
	inputs["opponent"] = getOpponent()
	inputs["bag"] = getBag()
	inputs["emu"] = getEmu()
	
	return inputs
end

function newInnovation()
	pool.innovation = pool.innovation + 1
	return pool.innovation
end

function newPool()
	local pool = {}
	pool.species = {}
	pool.generation = 0
	pool.innovation = Outputs
	pool.currentSpecies = 1
	pool.currentGenome = 1
	pool.currentFrame = 0
	pool.maxFitness = 0
   
	return pool
end

function newSpecies()
	local species = {}
	species.topFitness = 0
	species.staleness = 0
	species.genomes = {}
	species.averageFitness = 0
   
	return species
end

function newGenome()
	local genome = {}
	genome.genes = {}
	genome.fitness = 0
	genome.adjustedFitness = 0
	genome.network = {}
	genome.maxneuron = 0
	genome.globalRank = 0
	genome.mutationRates = {}
	genome.mutationRates["connections"] = MutateConnectionsChance
	genome.mutationRates["link"] = LinkMutationChance
	genome.mutationRates["bias"] = BiasMutationChance
	genome.mutationRates["node"] = NodeMutationChance
	genome.mutationRates["enable"] = EnableMutationChance
	genome.mutationRates["disable"] = DisableMutationChance
	genome.mutationRates["step"] = StepSize
   
	return genome
end
	
function copyGenome(genome)
	local genome2 = newGenome()
	for g=1,#genome.genes do
			table.insert(genome2.genes, copyGene(genome.genes[g]))
	end
	genome2.maxneuron = genome.maxneuron
	genome2.mutationRates["connections"] = genome.mutationRates["connections"]
	genome2.mutationRates["link"] = genome.mutationRates["link"]
	genome2.mutationRates["bias"] = genome.mutationRates["bias"]
	genome2.mutationRates["node"] = genome.mutationRates["node"]
	genome2.mutationRates["enable"] = genome.mutationRates["enable"]
	genome2.mutationRates["disable"] = genome.mutationRates["disable"]
   
	return genome2
end

function basicGenome()
	local genome = newGenome()
	local innovation = 1

	genome.maxneuron = Inputs
	mutate(genome)
   
	return genome
end

while true do
    emu.frameadvance()
	console.log(getParty())
	WaitFrames(10000)
end