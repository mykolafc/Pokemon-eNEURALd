-- Generative Neural Network for Pokemon Emerald Auto Battling by Mykola Forest-Chomyn
-- Inspired by the work of SethBling and his MarI/O project as well as the work of 40Cakes and his Pokemon Emerald shiny hunting bot

dofile("Memory.lua")
json = require "json"
PokemonNames = require "PokemonNames"
ItemNames = require "ItemNames"
Moves = require "Moves"

--Filename = "save.state"

Inputs = 10
Outputs = 9

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
	
	mon.species = PokemonNames[(ss0[0] & 0xFFFF) + 1]
	mon.heldItem = ss0[0] >> 16
	mon.experience = ss0[1]
	mon.ppBonuses = ss0[2] & 0xFF
	mon.friendship = (ss0[2] >> 8) & 0xFF
	
	movebytes = {
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

    for i = 0, 3 do
        mon.moves[i] = Moves[movebytes[i] + 1]
    end
	
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

	mon.types = getMonType(mon)
    
	return mon
end

function sigmoid(x)
    return 1 / (1 + math.exp(-x))
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
		--rngState = Memory.readdword(GameSettings.rng),
		language = GameSettings.language
	}
	return emu_data
end

function WaitFrames(frames)
    local emu = getEmu()
    local emuSpeed = emu.fps
    local sleepTime = math.max((frames / 60.0) / emuSpeed, 0.02)
    for i=1, sleepTime do
		emu.frameadvance()
	end
end


function pressButton(button)
	controller = {}
	controller[button] = true
	joypad.set(controller)
	WaitFrames(2)
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

function useMove(mon, move)
    pressButton("A")
    WaitFrames(3)
    if mon.moves[0] = move then
        pressButton("A")
    elseif mon.moves[1] = move then
        pressButton("Right")
        WaitFrames(3)
        pressButton("A")
    elseif mon.moves[2] = move then
        pressButton("Down")
        WaitFrames(3)
        pressButton("A")
    elseif mon.moves[3] = move then
        pressButton("Right")
        WaitFrames(3)
        pressButton("Down")
        WaitFrames(3)
        pressButton("A")
    end
end

function useItem(item)
    -- Select the item
end

function switchMon(monPosition)
    pressButton("Down")
    WaitFrames(5)
    for monPosition - 2 do
        pressButton("Down")
        WaitFrames(2)
    end
    pressButton("A")
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

function newGene()
    local gene = {}
    gene.into = 0
    gene.out = 0
    gene.weight = 0.0
    gene.enabled = true
    gene.innovation = 0
   
    return gene
end

function copyGene(gene)
    local gene2 = newGene()
    gene2.into = gene.into
    gene2.out = gene.out
    gene2.weight = gene.weight
    gene2.enabled = gene.enabled
    gene2.innovation = gene.innovation
   
    return gene2
end

function newNeuron()
    local neuron = {}
    neuron.incoming = {}
    neuron.value = 0.0
   
    return neuron
end

function generateNetwork(genome)
    local network = {}
    network.neurons = {}
   
    for i=1,Inputs do
            network.neurons[i] = newNeuron()
    end
   
    for o=1,Outputs do
            network.neurons[MaxNodes+o] = newNeuron()
    end
   
    table.sort(genome.genes, function (a,b)
            return (a.out < b.out)
    end)
    for i=1,#genome.genes do
            local gene = genome.genes[i]
            if gene.enabled then
                    if network.neurons[gene.out] == nil then
                            network.neurons[gene.out] = newNeuron()
                    end
                    local neuron = network.neurons[gene.out]
                    table.insert(neuron.incoming, gene)
                    if network.neurons[gene.into] == nil then
                            network.neurons[gene.into] = newNeuron()
                    end
            end
    end
   
    genome.network = network
end

function evaluateNetwork(network, inputs)
    -- Add bias input
    table.insert(inputs, 1)
    
    -- Check if the number of inputs is correct
    if #inputs ~= Inputs then
        console.writeline("Incorrect number of neural network inputs.")
        return {}
    end
   
    -- Assign input values to the corresponding input neurons
    for i = 1, Inputs do
        network.neurons[i].value = inputs[i]
    end
   
    -- Calculate the value for each neuron in the network
    for _, neuron in pairs(network.neurons) do
        local sum = 0
        -- Sum the weighted inputs for the neuron
        for j = 1, #neuron.incoming do
            local incoming = neuron.incoming[j]
            local other = network.neurons[incoming.into]
            sum = sum + incoming.weight * other.value
        end
        
        -- Apply the activation function if the neuron has incoming connections
        if #neuron.incoming > 0 then
            neuron.value = sigmoid(sum)
        end
    end
   
    -- Determine the outputs based on the values of the output neurons
    local maxOutput = 0
    for o = 1, Outputs do
        if network.neurons[MaxNodes + o].value > network.neurons[MaxNodes + maxOutput].value then
            maxOutput = o
        end
    end

    return MaxNodes + maxOutput

end

function crossover(g1, g2)
    -- Make sure g1 is the higher fitness genome
    if g2.fitness > g1.fitness then
            tempg = g1
            g1 = g2
            g2 = tempg
    end

    local child = newGenome()
   
    local innovations2 = {}
    for i=1,#g2.genes do
            local gene = g2.genes[i]
            innovations2[gene.innovation] = gene
    end
   
    for i=1,#g1.genes do
            local gene1 = g1.genes[i]
            local gene2 = innovations2[gene1.innovation]
            if gene2 ~= nil and math.random(2) == 1 and gene2.enabled then
                    table.insert(child.genes, copyGene(gene2))
            else
                    table.insert(child.genes, copyGene(gene1))
            end
    end
   
    child.maxneuron = math.max(g1.maxneuron,g2.maxneuron)
   
    for mutation,rate in pairs(g1.mutationRates) do
            child.mutationRates[mutation] = rate
    end
   
    return child
end

function randomNeuron(genes, nonInput)
    local neurons = {}
    
    -- Include input neurons if nonInput is not true
    if not nonInput then
        for i = 1, Inputs do
            neurons[i] = true
        end
    end
    
    -- Include output neurons
    for o = 1, Outputs do
        neurons[MaxNodes + o] = true
    end
    
    -- Include neurons from genes
    for i = 1, #genes do
        if (not nonInput) or genes[i].into > Inputs then
            neurons[genes[i].into] = true
        end
        if (not nonInput) or genes[i].out > Inputs then
            neurons[genes[i].out] = true
        end
    end

    -- Count the total number of neurons
    local count = 0
    for _, _ in pairs(neurons) do
        count = count + 1
    end
    
    -- Select a random neuron
    local n = math.random(1, count)
    for k, v in pairs(neurons) do
        n = n - 1
        if n == 0 then
            return k
        end
    end
    
    return 0
end

function containsLink(genes, link)
	for i=1,#genes do
			local gene = genes[i]
			if gene.into == link.into and gene.out == link.out then
					return true
			end
	end
end

function pointMutate(genome)
    local step = genome.mutationRates["step"]
   
    for i = 1, #genome.genes do
        local gene = genome.genes[i]
        if math.random() < PerturbChance then
            -- Perturb the gene's weight by a small random value within the range of -step to +step
            gene.weight = gene.weight + math.random() * step * 2 - step
        else
            -- Assign a completely new random weight within the range of -2 to +2
            gene.weight = math.random() * 4 - 2
        end
    end
end

function linkMutate(genome, forceBias)
	local neuron1 = randomNeuron(genome.genes, false)
	local neuron2 = randomNeuron(genome.genes, true)
	 
	local newLink = newGene()
	if neuron1 <= Inputs and neuron2 <= Inputs then
			--Both input nodes
			return
	end
	if neuron2 <= Inputs then
			-- Swap output and input
			local temp = neuron1
			neuron1 = neuron2
			neuron2 = temp
	end

	newLink.into = neuron1
	newLink.out = neuron2
	if forceBias then
			newLink.into = Inputs
	end
   
	if containsLink(genome.genes, newLink) then
			return
	end
	newLink.innovation = newInnovation()
	newLink.weight = math.random()*4-2
   
	table.insert(genome.genes, newLink)
end

function nodeMutate(genome)
    -- If there are no genes in the genome, return immediately
    if #genome.genes == 0 then
        return
    end

    -- Increment the maxneuron count in the genome
    genome.maxneuron = genome.maxneuron + 1

    -- Select a random gene from the genome
    local gene = genome.genes[math.random(1, #genome.genes)]
    
    -- If the selected gene is not enabled, return immediately
    if not gene.enabled then
        return
    end
    
    -- Disable the selected gene
    gene.enabled = false

    -- Create the first new gene, copying the original gene
    local gene1 = copyGene(gene)
    gene1.out = genome.maxneuron  -- Set the output of the first new gene to the new neuron
    gene1.weight = 1.0            -- Set the weight of the first new gene to 1.0
    gene1.innovation = newInnovation()  -- Assign a new innovation number
    gene1.enabled = true          -- Enable the first new gene
    table.insert(genome.genes, gene1)  -- Add the first new gene to the genome

    -- Create the second new gene, copying the original gene
    local gene2 = copyGene(gene)
    gene2.into = genome.maxneuron  -- Set the input of the second new gene to the new neuron
    gene2.innovation = newInnovation()  -- Assign a new innovation number
    gene2.enabled = true          -- Enable the second new gene
    table.insert(genome.genes, gene2)  -- Add the second new gene to the genome
end

function enableDisableMutate(genome, enable)
	local candidates = {}
	for _,gene in pairs(genome.genes) do
			if gene.enabled == not enable then
					table.insert(candidates, gene)
			end
	end
   
	if #candidates == 0 then
			return
	end
   
	local gene = candidates[math.random(1,#candidates)]
	gene.enabled = not gene.enabled
end

function mutate(genome)
    -- Adjust mutation rates slightly
    for mutation, rate in pairs(genome.mutationRates) do
        if math.random(1, 2) == 1 then
            genome.mutationRates[mutation] = 0.95 * rate
        else
            genome.mutationRates[mutation] = 1.05263 * rate
        end
    end

    -- Apply point mutation to connections
    if math.random() < genome.mutationRates["connections"] then
        pointMutate(genome)
    end
   
    -- Apply link mutation
    local p = genome.mutationRates["link"]
    while p > 0 do
        if math.random() < p then
            linkMutate(genome, false)
        end
        p = p - 1
    end

    -- Apply bias link mutation
    p = genome.mutationRates["bias"]
    while p > 0 do
        if math.random() < p then
            linkMutate(genome, true)
        end
        p = p - 1
    end
   
    -- Apply node mutation
    p = genome.mutationRates["node"]
    while p > 0 do
        if math.random() < p then
            nodeMutate(genome)
        end
        p = p - 1
    end
   
    -- Apply enable mutation
    p = genome.mutationRates["enable"]
    while p > 0 do
        if math.random() < p then
            enableDisableMutate(genome, true)
        end
        p = p - 1
    end

    -- Apply disable mutation
    p = genome.mutationRates["disable"]
    while p > 0 do
        if math.random() < p then
            enableDisableMutate(genome, false)
        end
        p = p - 1
    end
end

function disjoint(genes1, genes2)
	local i1 = {}
	for i = 1,#genes1 do
			local gene = genes1[i]
			i1[gene.innovation] = true
	end

	local i2 = {}
	for i = 1,#genes2 do
			local gene = genes2[i]
			i2[gene.innovation] = true
	end
   
	local disjointGenes = 0
	for i = 1,#genes1 do
			local gene = genes1[i]
			if not i2[gene.innovation] then
					disjointGenes = disjointGenes+1
			end
	end
   
	for i = 1,#genes2 do
			local gene = genes2[i]
			if not i1[gene.innovation] then
					disjointGenes = disjointGenes+1
			end
	end
   
	local n = math.max(#genes1, #genes2)
   
	return disjointGenes / n
end

function weights(genes1, genes2)
	local i2 = {}
	for i = 1,#genes2 do
			local gene = genes2[i]
			i2[gene.innovation] = gene
	end

	local sum = 0
	local coincident = 0
	for i = 1,#genes1 do
			local gene = genes1[i]
			if i2[gene.innovation] ~= nil then
					local gene2 = i2[gene.innovation]
					sum = sum + math.abs(gene.weight - gene2.weight)
					coincident = coincident + 1
			end
	end
   
	return sum / coincident
end

function sameSpecies(genome1, genome2)
	local dd = DeltaDisjoint*disjoint(genome1.genes, genome2.genes)
	local dw = DeltaWeights*weights(genome1.genes, genome2.genes)
	return dd + dw < DeltaThreshold
end

function rankGlobally()
	local global = {}
	for s = 1,#pool.species do
			local species = pool.species[s]
			for g = 1,#species.genomes do
					table.insert(global, species.genomes[g])
			end
	end
	table.sort(global, function (a,b)
			return (a.fitness < b.fitness)
	end)
   
	for g=1,#global do
			global[g].globalRank = g
	end
end

function calculateAverageFitness(species)
	local total = 0
   
	for g=1,#species.genomes do
			local genome = species.genomes[g]
			total = total + genome.globalRank
	end
   
	species.averageFitness = total / #species.genomes
end

function totalAverageFitness()
	local total = 0
	for s = 1,#pool.species do
			local species = pool.species[s]
			total = total + species.averageFitness
	end

	return total
end

function cullSpecies(cutToOne)
	for s = 1,#pool.species do
			local species = pool.species[s]
		   
			table.sort(species.genomes, function (a,b)
					return (a.fitness > b.fitness)
			end)
		   
			local remaining = math.ceil(#species.genomes/2)
			if cutToOne then
					remaining = 1
			end
			while #species.genomes > remaining do
					table.remove(species.genomes)
			end
	end
end

function breedChild(species)
	local child = {}
	if math.random() < CrossoverChance then
			g1 = species.genomes[math.random(1, #species.genomes)]
			g2 = species.genomes[math.random(1, #species.genomes)]
			child = crossover(g1, g2)
	else
			g = species.genomes[math.random(1, #species.genomes)]
			child = copyGenome(g)
	end
   
	mutate(child)
   
	return child
end

function removeStaleSpecies()
	local survived = {}

	for s = 1,#pool.species do
			local species = pool.species[s]
		   
			table.sort(species.genomes, function (a,b)
					return (a.fitness > b.fitness)
			end)
		   
			if species.genomes[1].fitness > species.topFitness then
					species.topFitness = species.genomes[1].fitness
					species.staleness = 0
			else
					species.staleness = species.staleness + 1
			end
			if species.staleness < StaleSpecies or species.topFitness >= pool.maxFitness then
					table.insert(survived, species)
			end
	end

	pool.species = survived
end

function removeWeakSpecies()
	local survived = {}

	local sum = totalAverageFitness()
	for s = 1,#pool.species do
			local species = pool.species[s]
			breed = math.floor(species.averageFitness / sum * Population)
			if breed >= 1 then
					table.insert(survived, species)
			end
	end

	pool.species = survived
end

function addToSpecies(child)
	local foundSpecies = false
	for s=1,#pool.species do
			local species = pool.species[s]
			if not foundSpecies and sameSpecies(child, species.genomes[1]) then
					table.insert(species.genomes, child)
					foundSpecies = true
			end
	end
   
	if not foundSpecies then
			local childSpecies = newSpecies()
			table.insert(childSpecies.genomes, child)
			table.insert(pool.species, childSpecies)
	end
end

function newGeneration()
	cullSpecies(false) -- Cull the bottom half of each species
	rankGlobally()
	removeStaleSpecies()
	rankGlobally()
	for s = 1,#pool.species do
			local species = pool.species[s]
			calculateAverageFitness(species)
	end
	removeWeakSpecies()
	local sum = totalAverageFitness()
	local children = {}
	for s = 1,#pool.species do
			local species = pool.species[s]
			breed = math.floor(species.averageFitness / sum * Population) - 1
			for i=1,breed do
					table.insert(children, breedChild(species))
			end
	end
	cullSpecies(true) -- Cull all but the top member of each species
	while #children + #pool.species < Population do
			local species = pool.species[math.random(1, #pool.species)]
			table.insert(children, breedChild(species))
	end
	for c=1,#children do
			local child = children[c]
			addToSpecies(child)
	end
   
	pool.generation = pool.generation + 1
   
	writeFile("backup." .. pool.generation .. "." .. forms.gettext(saveLoadFile))
end

function initializePool()
	pool = newPool()

	for i=1,Population do
			basic = basicGenome()
			addToSpecies(basic)
	end

	initializeRun()
end

function initializeRun()
	savestate.load(Filename);
	pool.currentFrame = 0
	timeout = TimeoutConstant
	releaseAllButtons()
   
	local species = pool.species[pool.currentSpecies]
	local genome = species.genomes[pool.currentGenome]
	generateNetwork(genome)
	evaluateCurrent()
end

function evaluateCurrent()
	local species = pool.species[pool.currentSpecies]
	local genome = species.genomes[pool.currentGenome]

	inputs = getInputs()
	selection = evaluateNetwork(genome.network, inputs)
   
	-- use the corresponding selection function
	if selection < 5 then
		useMove(party[1], selection)
	elseif selection < 9 then
		switchMon(selection - 3)
	end
end

if pool == nil then
	initializePool()
end

function nextGenome()
	pool.currentGenome = pool.currentGenome + 1
	if pool.currentGenome > #pool.species[pool.currentSpecies].genomes then
			pool.currentGenome = 1
			pool.currentSpecies = pool.currentSpecies+1
			if pool.currentSpecies > #pool.species then
					newGeneration()
					pool.currentSpecies = 1
			end
	end
end

function fitnessAlreadyMeasured()
	local species = pool.species[pool.currentSpecies]
	local genome = species.genomes[pool.currentGenome]
   
	return genome.fitness ~= 0
end

function writeFile(filename)
	local file = io.open(filename, "w")
	file:write(pool.generation .. "\n")
	file:write(pool.maxFitness .. "\n")
	file:write(#pool.species .. "\n")
	for n,species in pairs(pool.species) do
			file:write(species.topFitness .. "\n")
			file:write(species.staleness .. "\n")
			file:write(#species.genomes .. "\n")
			for m,genome in pairs(species.genomes) do
					file:write(genome.fitness .. "\n")
					file:write(genome.maxneuron .. "\n")
					for mutation,rate in pairs(genome.mutationRates) do
							file:write(mutation .. "\n")
							file:write(rate .. "\n")
					end
					file:write("done\n")
				   
					file:write(#genome.genes .. "\n")
					for l,gene in pairs(genome.genes) do
							file:write(gene.into .. " ")
							file:write(gene.out .. " ")
							file:write(gene.weight .. " ")
							file:write(gene.innovation .. " ")
							if(gene.enabled) then
									file:write("1\n")
							else
									file:write("0\n")
							end
					end
			end
	end
	file:close()
end

function savePool()
	local filename = forms.gettext(saveLoadFile)
	writeFile(filename)
end

function loadFile(filename)
	local file = io.open(filename, "r")
	pool = newPool()
	pool.generation = file:read("*number")
	pool.maxFitness = file:read("*number")
	forms.settext(maxFitnessLabel, "Max Fitness: " .. math.floor(pool.maxFitness))
	local numSpecies = file:read("*number")
	for s=1,numSpecies do
			local species = newSpecies()
			table.insert(pool.species, species)
			species.topFitness = file:read("*number")
			species.staleness = file:read("*number")
			local numGenomes = file:read("*number")
			for g=1,numGenomes do
					local genome = newGenome()
					table.insert(species.genomes, genome)
					genome.fitness = file:read("*number")
					genome.maxneuron = file:read("*number")
					local line = file:read("*line")
					while line ~= "done" do
							genome.mutationRates[line] = file:read("*number")
							line = file:read("*line")
					end
					local numGenes = file:read("*number")
					for n=1,numGenes do
							local gene = newGene()
							table.insert(genome.genes, gene)
							local enabled
							gene.into, gene.out, gene.weight, gene.innovation, enabled = file:read("*number", "*number", "*number", "*number", "*number")
							if enabled == 0 then
									gene.enabled = false
							else
									gene.enabled = true
							end
						   
					end
			end
	end
	file:close()
   
	while fitnessAlreadyMeasured() do
			nextGenome()
	end
	initializeRun()
	pool.currentFrame = pool.currentFrame + 1
end

function loadPool()
	local filename = forms.gettext(saveLoadFile)
	loadFile(filename)
end

function playTop()
	local maxfitness = 0
	local maxs, maxg
	for s,species in pairs(pool.species) do
			for g,genome in pairs(species.genomes) do
					if genome.fitness > maxfitness then
							maxfitness = genome.fitness
							maxs = s
							maxg = g
					end
			end
	end
   
	pool.currentSpecies = maxs
	pool.currentGenome = maxg
	pool.maxFitness = maxfitness
	forms.settext(maxFitnessLabel, "Max Fitness: " .. math.floor(pool.maxFitness))
	initializeRun()
	pool.currentFrame = pool.currentFrame + 1
	return
end

function onExit()
	forms.destroy(form)
end

writeFile("temp.pool")

event.onexit(onExit)

form = forms.newform(200, 260, "Fitness")
maxFitnessLabel = forms.label(form, "Max Fitness: " .. math.floor(pool.maxFitness), 5, 8)
showNetwork = forms.checkbox(form, "Show Map", 5, 30)
showMutationRates = forms.checkbox(form, "Show M-Rates", 5, 52)
restartButton = forms.button(form, "Restart", initializePool, 5, 77)
saveButton = forms.button(form, "Save", savePool, 5, 102)
loadButton = forms.button(form, "Load", loadPool, 80, 102)
saveLoadFile = forms.textbox(form, Filename .. ".pool", 170, 25, nil, 5, 148)
saveLoadLabel = forms.label(form, "Save/Load:", 5, 129)
playTopButton = forms.button(form, "Play Top", playTop, 5, 170)
hideBanner = forms.checkbox(form, "Hide Banner", 5, 190)

while true do
	local backgroundColor = 0xD0FFFFFF
	if not forms.ischecked(hideBanner) then
			gui.drawBox(0, 0, 300, 26, backgroundColor, backgroundColor)
	end

	local species = pool.species[pool.currentSpecies]
	local genome = species.genomes[pool.currentGenome]
   
	if pool.currentFrame%5 == 0 then
			evaluateCurrent()
	end
   
	local party = getParty()
	local opponent = getOpponent()
	local partyHP = 0
	local partyTotalHP = 0
	local fainted = {}

	for i = 1, #party do
		partyHP = partyHP + party[i].hp
		partyTotalHP = partyTotalHP + party[i].maxHP
		if party[i].hp == 0 then
			table.insert(fainted, i)

    -- Change FITNESS FUNCTION here
	local fitness = 1000
	for #fainted do
			fitness = fitness - 150
	end
	fitness = fitness + ((opponent.maxHP - opponent.hp) / opponent.maxHP * 100)
	if opponent.hp == 0 then
			fitness = fitness + 4000
			fitness = fitness + ((partyHP / partyTotalHP) * 500)
	end
	

	if fitness == 0 then
			fitness = -1
	end
	genome.fitness = fitness
	
	if fitness > pool.maxFitness then
			pool.maxFitness = fitness
			forms.settext(maxFitnessLabel, "Max Fitness: " .. math.floor(pool.maxFitness))
			writeFile("backup." .. pool.generation .. "." .. forms.gettext(saveLoadFile))
	end
	
	console.writeline("Gen " .. pool.generation .. " species " .. pool.currentSpecies .. " genome " .. pool.currentGenome .. " fitness: " .. fitness)
	pool.currentSpecies = 1
	pool.currentGenome = 1
	while fitnessAlreadyMeasured() do
			nextGenome()
	end
	initializeRun()

	local measured = 0
	local total = 0
	for _,species in pairs(pool.species) do
			for _,genome in pairs(species.genomes) do
					total = total + 1
					if genome.fitness ~= 0 then
							measured = measured + 1
					end
			end
	end
	if not forms.ischecked(hideBanner) then
			gui.drawText(0, 0, "Gen " .. pool.generation .. " species " .. pool.currentSpecies .. " genome " .. pool.currentGenome .. " (" .. math.floor(measured/total*100) .. "%)", 0xFF000000, 11)
			gui.drawText(0, 12, "Fitness: " .. math.floor(rightmost - (pool.currentFrame) / 2 - (timeout + timeoutBonus)*2/3), 0xFF000000, 11)
			gui.drawText(100, 12, "Max Fitness: " .. math.floor(pool.maxFitness), 0xFF000000, 11)
	end
		   
	pool.currentFrame = pool.currentFrame + 1

    emu.frameadvance()
 end