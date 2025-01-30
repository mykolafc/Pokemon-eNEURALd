-- Generative Neural Network for Pokemon Emerald Auto Battling by Mykola Forest-Chomyn
-- Inspired by the work of SethBling and his MarI/O project as well as the work of 40Cakes and his Pokemon Emerald shiny hunting bot

dofile("Memory.lua")
json = require "json"
PokemonNames = require "PokemonNames"
ItemNames = require "ItemNames"

GameSettings = {
	pstats         = 0x20244EC,
    pcount         = 0x20244E9,
	estats         = 0x2024744,
	bag            = 0x2039DD8,
    trainerpointer = 0x3005D90,
}

inputs = {
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
    for key, value in pairs(inputs) do
        inputs[key] = false
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

function getMonType()
    local types = {}
    

while true do
    --joypad.set(inputs)
    emu.frameadvance()
end