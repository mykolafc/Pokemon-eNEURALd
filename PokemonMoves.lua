local Moves = {
    [1] = {
        name = "Pound",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 35,
        description = "A physical attack delivered with a long tail or a foreleg, etc."
    },
    [2] = {
        name = "Karate Chop",
        type = "Fighting",
        category = "Physical",
        power = 50,
        accuracy = 100,
        pp = 25,
        description = "The target is attacked with a sharp chop. Critical hits land more easily."
    },
    [3] = {
        name = "Double Slap",
        type = "Normal",
        category = "Physical",
        power = 15,
        accuracy = 85,
        pp = 10,
        description = "The target is slapped repeatedly, back and forth, two to five times in a row."
    },
    [4] = {
        name = "Comet Punch",
        type = "Normal",
        category = "Physical",
        power = 18,
        accuracy = 85,
        pp = 15,
        description = "The target is hit with a flurry of punches that strike two to five times in a row."
    },
    [5] = {
        name = "Mega Punch",
        type = "Normal",
        category = "Physical",
        power = 80,
        accuracy = 85,
        pp = 20,
        description = "The target is slugged by a punch thrown with muscle-packed power."
    },
    [6] = {
        name = "Pay Day",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 20,
        description = "Numerous coins are hurled at the target to inflict damage. Money is earned after the battle."
    },
    [7] = {
        name = "Fire Punch",
        type = "Fire",
        category = "Physical",
        power = 75,
        accuracy = 100,
        pp = 15,
        description = "The target is punched with a fiery fist. This may also leave the target with a burn."
    },
    [8] = {
        name = "Ice Punch",
        type = "Ice",
        category = "Physical",
        power = 75,
        accuracy = 100,
        pp = 15,
        description = "The target is punched with an icy fist. This may also leave the target frozen."
    },
    [9] = {
        name = "Thunder Punch",
        type = "Electric",
        category = "Physical",
        power = 75,
        accuracy = 100,
        pp = 15,
        description = "The target is punched with an electrified fist. This may also leave the target with paralysis."
    },
    [10] = {
        name = "Scratch",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 35,
        description = "Hard, pointed, and sharp claws rake the target to inflict damage."
    },
    [11] = {
        name = "Vice Grip",
        type = "Normal",
        category = "Physical",
        power = 55,
        accuracy = 100,
        pp = 30,
        description = "The target is gripped and squeezed by the user's very thick and sturdy pincers."
    },
    [12] = {
        name = "Guillotine",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 30,
        pp = 5,
        description = "A vicious, tearing attack with pincers. The target faints instantly if this attack hits."
    },
    [13] = {
        name = "Razor Wind",
        type = "Normal",
        category = "Special",
        power = 80,
        accuracy = 100,
        pp = 10,
        description = "A two-turn attack. Blades of wind hit opposing Pokémon on the second turn. Critical hits land more easily."
    },
    [14] = {
        name = "Swords Dance",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A frenetic dance to uplift the fighting spirit. This sharply raises the user's Attack stat."
    },
    [15] = {
        name = "Cut",
        type = "Normal",
        category = "Physical",
        power = 50,
        accuracy = 95,
        pp = 30,
        description = "The target is cut with a scythe or claw. This can also be used to cut down thin trees."
    },
    [16] = {
        name = "Gust",
        type = "Flying",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 35,
        description = "A gust of wind is whipped up by wings and launched at the target to inflict damage."
    },
    [17] = {
        name = "Wing Attack",
        type = "Flying",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 35,
        description = "The target is struck with large, imposing wings spread wide to inflict damage."
    },
    [18] = {
        name = "Whirlwind",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The target is blown away, and a different Pokémon is dragged out. In the wild, this ends a battle against a single Pokémon."
    },
    [19] = {
        name = "Fly",
        type = "Flying",
        category = "Physical",
        power = 90,
        accuracy = 95,
        pp = 15,
        description = "The user flies up into the sky and then strikes its target on the next turn."
    },
    [20] = {
        name = "Bind",
        type = "Normal",
        category = "Physical",
        power = 15,
        accuracy = 85,
        pp = 20,
        description = "Things such as long bodies or tentacles are used to bind and squeeze the target for four to five turns."
    },
    [21] = {
        name = "Slam",
        type = "Normal",
        category = "Physical",
        power = 80,
        accuracy = 75,
        pp = 20,
        description = "The target is slammed with a long tail, vines, or the like to inflict damage."
    },
    [22] = {
        name = "Vine Whip",
        type = "Grass",
        category = "Physical",
        power = 45,
        accuracy = 100,
        pp = 25,
        description = "The target is struck with slender, whiplike vines to inflict damage."
    },
    [23] = {
        name = "Stomp",
        type = "Normal",
        category = "Physical",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "The target is stomped with a big foot. This may also make the target flinch."
    },
    [24] = {
        name = "Double Kick",
        type = "Fighting",
        category = "Physical",
        power = 30,
        accuracy = 100,
        pp = 30,
        description = "The target is quickly kicked twice in succession using both feet."
    },
    [25] = {
        name = "Mega Kick",
        type = "Normal",
        category = "Physical",
        power = 120,
        accuracy = 75,
        pp = 5,
        description = "The target is attacked by a kick launched with muscle-packed power."
    },
    [26] = {
        name = "Jump Kick",
        type = "Fighting",
        category = "Physical",
        power = 100,
        accuracy = 95,
        pp = 10,
        description = "The user jumps up high, then strikes with a kick. If the kick misses, the user hurts itself."
    },
    [27] = {
        name = "Rolling Kick",
        type = "Fighting",
        category = "Physical",
        power = 60,
        accuracy = 85,
        pp = 15,
        description = "The user lashes out with a quick, spinning kick. This may also make the target flinch."
    },
    [28] = {
        name = "Sand Attack",
        type = "Ground",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "Sand is hurled in the target's face, reducing its accuracy."
    },
    [29] = {
        name = "Headbutt",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 15,
        description = "The user sticks out its head and attacks by charging straight into the target. This may also make the target flinch."
    },
    [30] = {
        name = "Horn Attack",
        type = "Normal",
        category = "Physical",
        power = 65,
        accuracy = 100,
        pp = 25,
        description = "The target is jabbed with a sharply pointed horn to inflict damage."
    },
    [31] = {
        name = "Fury Attack",
        type = "Normal",
        category = "Physical",
        power = 15,
        accuracy = 85,
        pp = 20,
        description = "The target is jabbed repeatedly with a horn or beak two to five times in a row."
    },
    [32] = {
        name = "Horn Drill",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 30,
        pp = 5,
        description = "The user stabs the target with a horn that rotates like a drill. The target faints instantly if this attack hits."
    },
    [33] = {
        name = "Tackle",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 35,
        description = "A physical attack in which the user charges and slams into the target with its whole body."
    },
    [34] = {
        name = "Body Slam",
        type = "Normal",
        category = "Physical",
        power = 85,
        accuracy = 100,
        pp = 15,
        description = "The user drops onto the target with its full body weight. This may also leave the target with paralysis."
    },
    [35] = {
        name = "Wrap",
        type = "Normal",
        category = "Physical",
        power = 15,
        accuracy = 90,
        pp = 20,
        description = "A long body, vines, or the like are used to wrap and squeeze the target for four to five turns."
    },
    [36] = {
        name = "Take Down",
        type = "Normal",
        category = "Physical",
        power = 90,
        accuracy = 85,
        pp = 20,
        description = "A reckless, full-body charge attack for slamming into the target. This also damages the user a little."
    },
    [37] = {
        name = "Thrash",
        type = "Normal",
        category = "Physical",
        power = 120,
        accuracy = 100,
        pp = 10,
        description = "The user rampages and attacks for two to three turns. The user then becomes confused."
    },
    [38] = {
        name = "Double-Edge",
        type = "Normal",
        category = "Physical",
        power = 120,
        accuracy = 100,
        pp = 15,
        description = "A reckless, life-risking tackle. This also damages the user quite a lot."
    },
    [39] = {
        name = "Tail Whip",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user wags its tail cutely, making opposing Pokémon less wary and lowering their Defense stat."
    },
    [40] = {
        name = "Poison Sting",
        type = "Poison",
        category = "Physical",
        power = 15,
        accuracy = 100,
        pp = 35,
        description = "The user stabs the target with a poisonous stinger. This may also poison the target."
    },
    [41] = {
        name = "Twineedle",
        type = "Bug",
        category = "Physical",
        power = 25,
        accuracy = 100,
        pp = 20,
        description = "The user damages the target twice in succession by jabbing it with two spikes. This may also poison the target."
    },
    [42] = {
        name = "Pin Missile",
        type = "Bug",
        category = "Physical",
        power = 25,
        accuracy = 95,
        pp = 20,
        description = "Sharp spikes are shot at the target in rapid succession. They hit two to five times in a row."
    },
    [43] = {
        name = "Leer",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user gives opposing Pokémon an intimidating leer that lowers their Defense stat."
    },
    [44] = {
        name = "Bite",
        type = "Dark",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 25,
        description = "The target is bitten with viciously sharp fangs. This may also make the target flinch."
    },
    [45] = {
        name = "Growl",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user growls in an endearing way, making opposing Pokémon less wary. This lowers their Attack stat."
    },
    [46] = {
        name = "Roar",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The target is scared off, and a different Pokémon is dragged out. In the wild, this ends a battle against a single Pokémon."
    },
    [47] = {
        name = "Sing",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 55,
        pp = 15,
        description = "A soothing lullaby is sung in a calming voice that puts the target into a deep slumber."
    },
    [48] = {
        name = "Supersonic",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 55,
        pp = 20,
        description = "The user generates odd sound waves from its body that confuse the target."
    },
    [49] = {
        name = "Sonic Boom",
        type = "Normal",
        category = "Special",
        power = 0,
        accuracy = 90,
        pp = 20,
        description = "The target is hit with a destructive shock wave that always inflicts 20 HP damage."
    },
    [50] = {
        name = "Disable",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "For four turns, this move prevents the target from using the move it last used."
    },
    [51] = {
        name = "Acid",
        type = "Poison",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 30,
        description = "The opposing Pokémon are attacked with a spray of harsh acid. This may also lower their Sp. Def stat."
    },
    [52] = {
        name = "Ember",
        type = "Fire",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 25,
        description = "The target is attacked with small flames. This may also leave the target with a burn."
    },
    [53] = {
        name = "Flamethrower",
        type = "Fire",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 15,
        description = "The target is scorched with an intense blast of fire. This may also leave the target with a burn."
    },
    [54] = {
        name = "Mist",
        type = "Ice",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user cloaks itself and its allies in a white mist that prevents any of their stats from being lowered for five turns."
    },
    [55] = {
        name = "Water Gun",
        type = "Water",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 25,
        description = "The target is blasted with a forceful shot of water."
    },
    [56] = {
        name = "Hydro Pump",
        type = "Water",
        category = "Special",
        power = 110,
        accuracy = 80,
        pp = 5,
        description = "The target is blasted by a huge volume of water launched under great pressure."
    },
    [57] = {
        name = "Surf",
        type = "Water",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 15,
        description = "The user attacks everything around it by swamping its surroundings with a giant wave."
    },
    [58] = {
        name = "Ice Beam",
        type = "Ice",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 10,
        description = "The target is struck with an icy-cold beam of energy. This may also leave the target frozen."
    },
    [59] = {
        name = "Blizzard",
        type = "Ice",
        category = "Special",
        power = 110,
        accuracy = 70,
        pp = 5,
        description = "A howling blizzard is summoned to strike opposing Pokémon. This may also leave the target frozen."
    },
    [60] = {
        name = "Psybeam",
        type = "Psychic",
        category = "Special",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "The target is attacked with a peculiar ray. This may also confuse the target."
    },
    [61] = {
        name = "Bubble Beam",
        type = "Water",
        category = "Special",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "A spray of bubbles is forcefully ejected at the target. This may also lower the target's Speed stat."
    },
    [62] = {
        name = "Aurora Beam",
        type = "Ice",
        category = "Special",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "The target is hit with a rainbow-colored beam. This may also lower the target's Attack stat."
    },
    [63] = {
        name = "Hyper Beam",
        type = "Normal",
        category = "Special",
        power = 150,
        accuracy = 90,
        pp = 5,
        description = "The target is attacked with a powerful beam. The user must rest on the next turn to regain its energy."
    },
    [64] = {
        name = "Peck",
        type = "Flying",
        category = "Physical",
        power = 35,
        accuracy = 100,
        pp = 35,
        description = "The target is jabbed with a sharply pointed beak or horn."
    },
    [65] = {
        name = "Drill Peck",
        type = "Flying",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 20,
        description = "A corkscrewing attack with a sharp beak acting as a drill."
    },
    [66] = {
        name = "Submission",
        type = "Fighting",
        category = "Physical",
        power = 80,
        accuracy = 80,
        pp = 20,
        description = "The user grabs the target and recklessly dives for the ground. This also damages the user a little."
    },
    [67] = {
        name = "Low Kick",
        type = "Fighting",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A powerful low kick that makes the target fall over. The heavier the target, the greater the move's power."
    },
    [68] = {
        name = "Counter",
        type = "Fighting",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A retaliation move that counters any physical attack, inflicting double the damage taken."
    },
    [69] = {
        name = "Seismic Toss",
        type = "Fighting",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The target is thrown using the power of gravity. It inflicts damage equal to the user's level."
    },
    [70] = {
        name = "Strength",
        type = "Normal",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 15,
        description = "The target is slugged with a punch thrown at maximum power. This can also be used to move heavy boulders."
    },
    [71] = {
        name = "Absorb",
        type = "Grass",
        category = "Special",
        power = 20,
        accuracy = 100,
        pp = 25,
        description = "A nutrient-draining attack. The user's HP is restored by half the damage taken by the target."
    },
    [72] = {
        name = "Mega Drain",
        type = "Grass",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 15,
        description = "A nutrient-draining attack. The user's HP is restored by half the damage taken by the target."
    },
    [73] = {
        name = "Leech Seed",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 90,
        pp = 10,
        description = "A seed is planted on the target. It steals some HP from the target every turn."
    },
    [74] = {
        name = "Growth",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user's body grows all at once, raising the Attack and Sp. Atk stats."
    },
    [75] = {
        name = "Razor Leaf",
        type = "Grass",
        category = "Physical",
        power = 55,
        accuracy = 95,
        pp = 25,
        description = "Sharp-edged leaves are launched to slash at the opposing team. Critical hits land more easily."
    },
    [76] = {
        name = "Solar Beam",
        type = "Grass",
        category = "Special",
        power = 120,
        accuracy = 100,
        pp = 10,
        description = "A two-turn attack. The user gathers light, then blasts a bundled beam on the next turn."
    },
    [77] = {
        name = "Poison Powder",
        type = "Poison",
        category = "Status",
        power = 0,
        accuracy = 75,
        pp = 35,
        description = "The user scatters a cloud of poisonous dust that poisons the target."
    },
    [78] = {
        name = "Stun Spore",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 75,
        pp = 30,
        description = "The user scatters a cloud of numbing powder that paralyzes the target."
    },
    [79] = {
        name = "Sleep Powder",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 75,
        pp = 15,
        description = "The user scatters a big cloud of sleep-inducing dust around the target."
    },
    [80] = {
        name = "Petal Dance",
        type = "Grass",
        category = "Special",
        power = 120,
        accuracy = 100,
        pp = 10,
        description = "The user attacks by scattering petals for two to three turns. The user then becomes confused."
    },
    [81] = {
        name = "String Shot",
        type = "Bug",
        category = "Status",
        power = 0,
        accuracy = 95,
        pp = 40,
        description = "The user shoots silk at the target to lower its Speed stat."
    },
    [82] = {
        name = "Dragon Rage",
        type = "Dragon",
        category = "Special",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "This attack hits the target with a shock wave of pure rage. This attack always inflicts 40 HP damage."
    },
    [83] = {
        name = "Fire Spin",
        type = "Fire",
        category = "Special",
        power = 35,
        accuracy = 85,
        pp = 15,
        description = "The target becomes trapped within a fierce vortex of fire that rages for four to five turns."
    },
    [84] = {
        name = "Thunder Shock",
        type = "Electric",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 30,
        description = "A jolt of electricity crashes down on the target to inflict damage. This may also leave the target with paralysis."
    },
    [85] = {
        name = "Thunderbolt",
        type = "Electric",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 15,
        description = "A strong electric blast crashes down on the target. This may also leave the target with paralysis."
    },
    [86] = {
        name = "Thunder Wave",
        type = "Electric",
        category = "Status",
        power = 0,
        accuracy = 90,
        pp = 20,
        description = "The user launches a weak jolt of electricity that paralyzes the target."
    },
    [87] = {
        name = "Thunder",
        type = "Electric",
        category = "Special",
        power = 110,
        accuracy = 70,
        pp = 10,
        description = "A wicked thunderbolt is dropped on the target to inflict damage. This may also leave the target with paralysis."
    },
    [88] = {
        name = "Rock Throw",
        type = "Rock",
        category = "Physical",
        power = 50,
        accuracy = 90,
        pp = 15,
        description = "The user picks up and throws a small rock at the target to attack."
    },
    [89] = {
        name = "Earthquake",
        type = "Ground",
        category = "Physical",
        power = 100,
        accuracy = 100,
        pp = 10,
        description = "The user sets off an earthquake that strikes every Pokémon around it."
    },
    [90] = {
        name = "Fissure",
        type = "Ground",
        category = "Physical",
        power = 0,
        accuracy = 30,
        pp = 5,
        description = "The user opens up a fissure in the ground and drops the target in. The target faints instantly if this attack hits."
    },
    [91] = {
        name = "Dig",
        type = "Ground",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 10,
        description = "The user burrows into the ground, then attacks on the next turn. It can also be used to exit dungeons."
    },
    [92] = {
        name = "Toxic",
        type = "Poison",
        category = "Status",
        power = 0,
        accuracy = 90,
        pp = 10,
        description = "A move that leaves the target badly poisoned. Its poison damage worsens every turn."
    },
    [93] = {
        name = "Confusion",
        type = "Psychic",
        category = "Special",
        power = 50,
        accuracy = 100,
        pp = 25,
        description = "The target is hit by a weak telekinetic force. This may also confuse the target."
    },
    [94] = {
        name = "Psychic",
        type = "Psychic",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 10,
        description = "The target is hit by a strong telekinetic force. This may also lower the target's Sp. Def stat."
    },
    [95] = {
        name = "Hypnosis",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 60,
        pp = 20,
        description = "The user employs hypnotic suggestion to make the target fall into a deep sleep."
    },
    [96] = {
        name = "Meditate",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user meditates to awaken the power deep within its body and raise its Attack stat."
    },
    [97] = {
        name = "Agility",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user relaxes and lightens its body to move faster. This sharply raises the Speed stat."
    },
    [98] = {
        name = "Quick Attack",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 30,
        description = "The user lunges at the target at a speed that makes it almost invisible. This move always goes first."
    },
    [99] = {
        name = "Rage",
        type = "Normal",
        category = "Physical",
        power = 20,
        accuracy = 100,
        pp = 20,
        description = "As long as this move is in use, the power of rage raises the Attack stat each time the user is hit in battle."
    },
    [100] = {
        name = "Teleport",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "Use it to flee from any wild Pokémon. It can also warp to the last Pokémon Center visited."
    },
    [101] = {
        name = "Night Shade",
        type = "Ghost",
        category = "Special",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user makes the target see a frightening mirage. It inflicts damage equal to the user's level."
    },
    [102] = {
        name = "Mimic",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user copies the target's last move. The move can be used during battle until the Pokémon is switched out."
    },
    [103] = {
        name = "Screech",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 85,
        pp = 40,
        description = "An earsplitting screech harshly lowers the target's Defense stat."
    },
    [104] = {
        name = "Double Team",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "By moving rapidly, the user makes illusory copies of itself to raise its evasiveness."
    },
    [105] = {
        name = "Recover",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "Restoring its own cells, the user restores its own HP by half of its max HP."
    },
    [106] = {
        name = "Harden",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user stiffens all the muscles in its body to raise its Defense stat."
    },
    [107] = {
        name = "Minimize",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user compresses its body to make itself look smaller, which sharply raises its evasiveness."
    },
    [108] = {
        name = "Smokescreen",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user releases an obscuring cloud of smoke or ink. This lowers the target's accuracy."
    },
    [109] = {
        name = "Confuse Ray",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The target is exposed to a sinister ray that triggers confusion."
    },
    [110] = {
        name = "Withdraw",
        type = "Water",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user withdraws its body into its hard shell, raising its Defense stat."
    },
    [111] = {
        name = "Defense Curl",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user curls up to conceal weak spots and raise its Defense stat."
    },
    [112] = {
        name = "Barrier",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user throws up a sturdy wall that sharply raises its Defense stat."
    },
    [113] = {
        name = "Light Screen",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "A wondrous wall of light is put up to reduce damage from special attacks for five turns."
    },
    [114] = {
        name = "Haze",
        type = "Ice",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user creates a haze that eliminates every stat change among all the Pokémon engaged in battle."
    },
    [115] = {
        name = "Reflect",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A wondrous wall of light is put up to reduce damage from physical attacks for five turns."
    },
    [116] = {
        name = "Focus Energy",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user takes a deep breath and focuses to raise the critical-hit ratio of its attacks."
    },
    [117] = {
        name = "Bide",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user endures attacks for two turns, then strikes back to cause double the damage taken."
    },
    [118] = {
        name = "Metronome",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user waggles a finger and stimulates its brain into randomly using nearly any move."
    },
    [119] = {
        name = "Mirror Move",
        type = "Flying",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user counters the target by mimicking the target's last move."
    },
    [120] = {
        name = "Self-Destruct",
        type = "Normal",
        category = "Physical",
        power = 200,
        accuracy = 100,
        pp = 5,
        description = "The user attacks everything around it by causing an explosion. The user faints upon using this move."
    },
    [121] = {
        name = "Egg Bomb",
        type = "Normal",
        category = "Physical",
        power = 100,
        accuracy = 75,
        pp = 10,
        description = "A large egg is hurled at the target with maximum force to inflict damage."
    },
    [122] = {
        name = "Lick",
        type = "Ghost",
        category = "Physical",
        power = 30,
        accuracy = 100,
        pp = 30,
        description = "The target is licked with a long tongue, causing damage. This may also paralyze the target."
    },
    [123] = {
        name = "Smog",
        type = "Poison",
        category = "Special",
        power = 30,
        accuracy = 70,
        pp = 20,
        description = "The target is attacked with a discharge of filthy gases. This may also poison the target."
    },
    [124] = {
        name = "Sludge",
        type = "Poison",
        category = "Special",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "Unsanitary sludge is hurled at the target. This may also poison the target."
    },
    [125] = {
        name = "Bone Club",
        type = "Ground",
        category = "Physical",
        power = 65,
        accuracy = 85,
        pp = 20,
        description = "The user clubs the target with a bone. This may also make the target flinch."
    },
    [126] = {
        name = "Fire Blast",
        type = "Fire",
        category = "Special",
        power = 110,
        accuracy = 85,
        pp = 5,
        description = "The target is attacked with an intense blast of all-consuming fire. This may also leave the target with a burn."
    },
    [127] = {
        name = "Waterfall",
        type = "Water",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 15,
        description = "The user charges at the target and may make it flinch. It can also be used to climb a waterfall."
    },
    [128] = {
        name = "Clamp",
        type = "Water",
        category = "Physical",
        power = 35,
        accuracy = 85,
        pp = 15,
        description = "The target is clamped and squeezed by the user's very thick and sturdy shell for four to five turns."
    },
    [129] = {
        name = "Swift",
        type = "Normal",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "Star-shaped rays are shot at the opposing team. This attack never misses."
    },
    [130] = {
        name = "Skull Bash",
        type = "Normal",
        category = "Physical",
        power = 130,
        accuracy = 100,
        pp = 10,
        description = "The user tucks in its head to raise its Defense stat on the first turn, then rams the target on the next turn."
    },
    [131] = {
        name = "Spike Cannon",
        type = "Normal",
        category = "Physical",
        power = 20,
        accuracy = 100,
        pp = 15,
        description = "Sharp spikes are shot at the target in rapid succession. They hit two to five times in a row."
    },
    [132] = {
        name = "Constrict",
        type = "Normal",
        category = "Physical",
        power = 10,
        accuracy = 100,
        pp = 35,
        description = "The target is attacked with long, creeping tentacles or vines. This may also lower the target's Speed stat."
    },
    [133] = {
        name = "Amnesia",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user temporarily empties its mind to forget its concerns. This sharply raises the user's Sp. Def stat."
    },
    [134] = {
        name = "Kinesis",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 80,
        pp = 15,
        description = "The user distracts the target by bending a spoon. This lowers the target's accuracy."
    },
    [135] = {
        name = "Soft-Boiled",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user restores its own HP by up to half of its max HP. May also be used in the field to heal HP."
    },
    [136] = {
        name = "High Jump Kick",
        type = "Fighting",
        category = "Physical",
        power = 130,
        accuracy = 90,
        pp = 10,
        description = "The target is attacked with a knee kick from a jump. If it misses, the user is hurt instead."
    },
    [137] = {
        name = "Glare",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user intimidates the target with the pattern on its belly to cause paralysis."
    },
    [138] = {
        name = "Dream Eater",
        type = "Psychic",
        category = "Special",
        power = 100,
        accuracy = 100,
        pp = 15,
        description = "The user eats the dreams of a sleeping target. It absorbs half the damage caused to heal the user's HP."
    },
    [139] = {
        name = "Poison Gas",
        type = "Poison",
        category = "Status",
        power = 0,
        accuracy = 90,
        pp = 40,
        description = "A cloud of poison gas is sprayed in the face of opposing Pokémon. This may also poison those hit."
    },
    [140] = {
        name = "Barrage",
        type = "Normal",
        category = "Physical",
        power = 15,
        accuracy = 85,
        pp = 20,
        description = "Round objects are hurled at the target to strike two to five times in a row."
    },
    [141] = {
        name = "Leech Life",
        type = "Bug",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 10,
        description = "The user drains the target's blood. The user's HP is restored by half the damage taken by the target."
    },
    [142] = {
        name = "Lovely Kiss",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 75,
        pp = 10,
        description = "With a scary face, the user tries to force a kiss on the target. If it succeeds, the target falls asleep."
    },
    [143] = {
        name = "Sky Attack",
        type = "Flying",
        category = "Physical",
        power = 140,
        accuracy = 90,
        pp = 5,
        description = "A second-turn attack move where critical hits land more easily. This may also make the target flinch."
    },
    [144] = {
        name = "Transform",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user transforms into a copy of the target right down to having the same move set."
    },
    [145] = {
        name = "Bubble",
        type = "Water",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 30,
        description = "A spray of countless bubbles is jetted at the opposing team. This may also lower their Speed stats."
    },
    [146] = {
        name = "Dizzy Punch",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 10,
        description = "The target is hit with rhythmically launched punches. This may also leave the target confused."
    },
    [147] = {
        name = "Spore",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user scatters bursts of spores that induce sleep."
    },
    [148] = {
        name = "Flash",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user flashes a bright light that cuts the target's accuracy. It can also be used to illuminate caves."
    },
    [149] = {
        name = "Psywave",
        type = "Psychic",
        category = "Special",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The target is attacked with an odd psychic wave. The attack varies in intensity."
    },
    [150] = {
        name = "Splash",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user just flops and splashes around to no effect at all..."
    },
    [151] = {
        name = "Acid Armor",
        type = "Poison",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user alters its cellular structure to liquefy itself, sharply raising its Defense stat."
    },
    [152] = {
        name = "Crabhammer",
        type = "Water",
        category = "Physical",
        power = 100,
        accuracy = 90,
        pp = 10,
        description = "The target is hammered with a large pincer. Critical hits land more easily."
    },
    [153] = {
        name = "Explosion",
        type = "Normal",
        category = "Physical",
        power = 250,
        accuracy = 100,
        pp = 5,
        description = "The user attacks everything around it by causing a tremendous explosion. The user faints upon using this move."
    },
    [154] = {
        name = "Fury Swipes",
        type = "Normal",
        category = "Physical",
        power = 18,
        accuracy = 80,
        pp = 15,
        description = "The target is raked with sharp claws or scythes quickly two to five times in a row."
    },
    [155] = {
        name = "Bonemerang",
        type = "Ground",
        category = "Physical",
        power = 50,
        accuracy = 90,
        pp = 10,
        description = "The user throws the bone it holds. The bone loops to hit the target twice coming and going."
    },
    [156] = {
        name = "Rest",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user goes to sleep for two turns. This fully restores the user's HP and heals any status conditions."
    },
    [157] = {
        name = "Rock Slide",
        type = "Rock",
        category = "Physical",
        power = 75,
        accuracy = 90,
        pp = 10,
        description = "Large boulders are hurled at the opposing Pokémon to inflict damage. This may also make the opposing Pokémon flinch."
    },
    [158] = {
        name = "Hyper Fang",
        type = "Normal",
        category = "Physical",
        power = 80,
        accuracy = 90,
        pp = 15,
        description = "The user bites hard on the target with its sharp front fangs. This may also make the target flinch."
    },
    [159] = {
        name = "Sharpen",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user makes its edges more jagged, which raises its Attack stat."
    },
    [160] = {
        name = "Conversion",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user changes its type to become the same type as one of its moves."
    },
    [161] = {
        name = "Tri Attack",
        type = "Normal",
        category = "Special",
        power = 80,
        accuracy = 100,
        pp = 10,
        description = "The user strikes with a simultaneous three-beam attack. May also burn, freeze, or paralyze the target."
    },
    [162] = {
        name = "Super Fang",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 90,
        pp = 10,
        description = "The user chomps hard on the target with its sharp front fangs. This cuts the target's HP in half."
    },
    [163] = {
        name = "Slash",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 20,
        description = "The target is attacked with a slash of claws or blades. Critical hits land more easily."
    },
    [164] = {
        name = "Substitute",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user makes a copy of itself using some of its HP. The copy serves as the user's decoy."
    },
    [165] = {
        name = "Struggle",
        type = "Normal",
        category = "Physical",
        power = 50,
        accuracy = 100,
        pp = 1,
        description = "An attack that is used in desperation only if the user has no PP. It also hurts the user slightly."
    },
    [166] = {
        name = "Sketch",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 1,
        description = "It enables the user to permanently learn the move last used by the target. Once used, Sketch disappears."
    },
    [167] = {
        name = "Triple Kick",
        type = "Fighting",
        category = "Physical",
        power = 10,
        accuracy = 90,
        pp = 10,
        description = "A consecutive three-kick attack that becomes more powerful with each successive hit."
    },
    [168] = {
        name = "Thief",
        type = "Dark",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 25,
        description = "The user attacks and steals the target's held item simultaneously. The user can't steal anything if it already holds an item."
    },
    [169] = {
        name = "Spider Web",
        type = "Bug",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user ensnares the target with thin, gooey silk so it can't flee from battle."
    },
    [170] = {
        name = "Mind Reader",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user senses the target's movements with its mind to ensure its next attack does not miss the target."
    },
    [171] = {
        name = "Nightmare",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "A sleeping target sees a nightmare that inflicts some damage every turn."
    },
    [172] = {
        name = "Flame Wheel",
        type = "Fire",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 25,
        description = "The user cloaks itself in fire and charges at the target. This may also leave the target with a burn."
    },
    [173] = {
        name = "Snore",
        type = "Normal",
        category = "Special",
        power = 50,
        accuracy = 100,
        pp = 15,
        description = "This attack can be used only if the user is asleep. The harsh noise may also make the target flinch."
    },
    [174] = {
        name = "Curse",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "A move that works differently for the Ghost type than for all other types."
    },
    [175] = {
        name = "Flail",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user flails about aimlessly to attack. The less HP the user has, the greater the move's power."
    },
    [176] = {
        name = "Conversion 2",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user changes its type to make itself resistant to the type of the attack the target used last."
    },
    [177] = {
        name = "Aeroblast",
        type = "Flying",
        category = "Special",
        power = 100,
        accuracy = 95,
        pp = 5,
        description = "A vortex of air is shot at the target to inflict damage. Critical hits land more easily."
    },
    [178] = {
        name = "Cotton Spore",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user releases cotton-like spores that cling to the target, harshly reducing its Speed stat."
    },
    [179] = {
        name = "Reversal",
        type = "Fighting",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "An all-out attack that becomes more powerful the less HP the user has."
    },
    [180] = {
        name = "Spite",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user unleashes its grudge on the move last used by the target by cutting 4 PP from it."
    },
    [181] = {
        name = "Powder Snow",
        type = "Ice",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 25,
        description = "The user attacks with a chilling gust of powdery snow. This may also freeze the opposing Pokémon."
    },
    [182] = {
        name = "Protect",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "Enables the user to evade all attacks. Its chance of failing rises if it is used in succession."
    },
    [183] = {
        name = "Mach Punch",
        type = "Fighting",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 30,
        description = "The user throws a punch at blinding speed. This move always goes first."
    },
    [184] = {
        name = "Scary Face",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user frightens the target with a scary face to harshly reduce its Speed stat."
    },
    [185] = {
        name = "Feint Attack",
        type = "Dark",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user approaches the target disarmingly, then throws a sucker punch. This attack never misses."
    },
    [186] = {
        name = "Sweet Kiss",
        type = "Fairy",
        category = "Status",
        power = 0,
        accuracy = 75,
        pp = 10,
        description = "The user kisses the target with a sweet, angelic cuteness that causes confusion."
    },
    [187] = {
        name = "Belly Drum",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user maximizes its Attack stat in exchange for HP equal to half its max HP."
    },
    [188] = {
        name = "Sludge Bomb",
        type = "Poison",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 10,
        description = "Unsanitary sludge is hurled at the target. This may also poison the target."
    },
    [189] = {
        name = "Mud-Slap",
        type = "Ground",
        category = "Special",
        power = 20,
        accuracy = 100,
        pp = 10,
        description = "The user hurls mud in the target's face to inflict damage and lower its accuracy."
    },
    [190] = {
        name = "Octazooka",
        type = "Water",
        category = "Special",
        power = 65,
        accuracy = 85,
        pp = 10,
        description = "The user attacks by spraying ink in the target's face or eyes. This may also lower the target's accuracy."
    },
    [191] = {
        name = "Spikes",
        type = "Ground",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user lays a trap of spikes at the opposing team's feet. The trap hurts opposing Pokémon that switch into battle."
    },
    [192] = {
        name = "Zap Cannon",
        type = "Electric",
        category = "Special",
        power = 120,
        accuracy = 50,
        pp = 5,
        description = "The user fires an electric blast like a cannon to inflict damage and cause paralysis."
    },
    [193] = {
        name = "Foresight",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "Enables a Ghost-type target to be hit by Normal- and Fighting-type attacks. It also enables an evasive target to be hit."
    },
    [194] = {
        name = "Destiny Bond",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "When this move is used, if the user faints, the Pokémon that landed the knockout hit also faints."
    },
    [195] = {
        name = "Perish Song",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "Any Pokémon that hears this song faints in three turns, unless it switches out of battle."
    },
    [196] = {
        name = "Icy Wind",
        type = "Ice",
        category = "Special",
        power = 55,
        accuracy = 95,
        pp = 15,
        description = "The user attacks with a gust of chilled air. This also lowers the opposing Pokémon's Speed stats."
    },
    [197] = {
        name = "Detect",
        type = "Fighting",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "It enables the user to evade all attacks. Its chance of failing rises if it is used in succession."
    },
    [198] = {
        name = "Bone Rush",
        type = "Ground",
        category = "Physical",
        power = 25,
        accuracy = 90,
        pp = 10,
        description = "The user strikes the target with a hard bone two to five times in a row."
    },
    [199] = {
        name = "Lock-On",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user takes sure aim at the target. This ensures the next attack does not miss the target."
    },
    [200] = {
        name = "Outrage",
        type = "Dragon",
        category = "Physical",
        power = 120,
        accuracy = 100,
        pp = 10,
        description = "The user rampages and attacks for two to three turns. The user then becomes confused."
    },
    [201] = {
        name = "Sandstorm",
        type = "Rock",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "A five-turn sandstorm is summoned to hurt all combatants except the Rock, Ground, and Steel types."
    },
    [202] = {
        name = "Giga Drain",
        type = "Grass",
        category = "Special",
        power = 75,
        accuracy = 100,
        pp = 10,
        description = "A nutrient-draining attack. The user's HP is restored by half the damage taken by the target."
    },
    [203] = {
        name = "Endure",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user endures any attack with at least 1 HP. Its chance of failing rises if it is used in succession."
    },
    [204] = {
        name = "Charm",
        type = "Fairy",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user gazes at the target rather charmingly, making it less wary. This harshly lowers its Attack stat."
    },
    [205] = {
        name = "Rollout",
        type = "Rock",
        category = "Physical",
        power = 30,
        accuracy = 90,
        pp = 20,
        description = "The user continually rolls into the target over five turns. It becomes stronger each time it hits."
    },
    [206] = {
        name = "False Swipe",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 40,
        description = "A restrained attack that prevents the target from fainting. The target is left with at least 1 HP."
    },
    [207] = {
        name = "Swagger",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 85,
        pp = 15,
        description = "The user enrages and confuses the target. However, this also sharply raises the target's Attack stat."
    },
    [208] = {
        name = "Milk Drink",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user restores its own HP by up to half of its max HP. May also be used in the field to heal HP."
    },
    [209] = {
        name = "Spark",
        type = "Electric",
        category = "Physical",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "The user throws an electrically charged tackle at the target. This may also leave the target with paralysis."
    },
    [210] = {
        name = "Fury Cutter",
        type = "Bug",
        category = "Physical",
        power = 40,
        accuracy = 95,
        pp = 20,
        description = "The target is slashed with scythes or claws. This attack becomes more powerful if it hits in succession."
    },
    [211] = {
        name = "Steel Wing",
        type = "Steel",
        category = "Physical",
        power = 70,
        accuracy = 90,
        pp = 25,
        description = "The target is hit with wings of steel. This may also raise the user's Defense stat."
    },
    [212] = {
        name = "Mean Look",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user pins the target with a dark, arresting look. The target becomes unable to flee."
    },
    [213] = {
        name = "Attract",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "If it is the opposite gender of the user, the target becomes infatuated and less likely to attack."
    },
    [214] = {
        name = "Sleep Talk",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "While it is asleep, the user randomly uses one of the moves it knows."
    },
    [215] = {
        name = "Heal Bell",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user makes a soothing bell chime to heal the status conditions of all the party Pokémon."
    },
    [216] = {
        name = "Return",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A full-power attack that grows more powerful the more the user likes its Trainer."
    },
    [217] = {
        name = "Present",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 90,
        pp = 15,
        description = "The user attacks by giving the target a gift with a hidden trap. It restores HP sometimes, however."
    },
    [218] = {
        name = "Frustration",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A full-power attack that grows more powerful the less the user likes its Trainer."
    },
    [219] = {
        name = "Safeguard",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 25,
        description = "The user creates a protective field that prevents status conditions for five turns."
    },
    [220] = {
        name = "Pain Split",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user adds its HP to the target's HP, then equally shares the combined HP with the target."
    },
    [221] = {
        name = "Sacred Fire",
        type = "Fire",
        category = "Physical",
        power = 100,
        accuracy = 95,
        pp = 5,
        description = "The target is razed with a mystical fire of great intensity. This may also leave the target with a burn."
    },
    [222] = {
        name = "Magnitude",
        type = "Ground",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 30,
        description = "The user attacks everything around it with a ground-shaking quake. Its power varies."
    },
    [223] = {
        name = "Dynamic Punch",
        type = "Fighting",
        category = "Physical",
        power = 100,
        accuracy = 50,
        pp = 5,
        description = "The user punches the target with full, concentrated power. This confuses the target if it hits."
    },
    [224] = {
        name = "Megahorn",
        type = "Bug",
        category = "Physical",
        power = 120,
        accuracy = 85,
        pp = 10,
        description = "Using its tough and impressive horn, the user rams into the target with no letup."
    },
    [225] = {
        name = "Dragon Breath",
        type = "Dragon",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user exhales a mighty gust that inflicts damage. This may also leave the target with paralysis."
    },
    [226] = {
        name = "Baton Pass",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user switches places with a party Pokémon in waiting and passes along any stat changes."
    },
    [227] = {
        name = "Encore",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user compels the target to keep using only the move it last used for three turns."
    },
    [228] = {
        name = "Pursuit",
        type = "Dark",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 20,
        description = "An attack move that inflicts double damage if used on a target that is switching out of battle."
    },
    [229] = {
        name = "Rapid Spin",
        type = "Normal",
        category = "Physical",
        power = 50,
        accuracy = 100,
        pp = 40,
        description = "A spin attack that can also eliminate such moves as Bind, Wrap, Leech Seed, and Spikes."
    },
    [230] = {
        name = "Sweet Scent",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A sweet scent that lowers the opposing team's evasiveness. It also lures wild Pokémon if used in grass, etc."
    },
    [231] = {
        name = "Iron Tail",
        type = "Steel",
        category = "Physical",
        power = 100,
        accuracy = 75,
        pp = 15,
        description = "The target is slammed with a steel-hard tail. This may also lower the target's Defense stat."
    },
    [232] = {
        name = "Metal Claw",
        type = "Steel",
        category = "Physical",
        power = 50,
        accuracy = 95,
        pp = 35,
        description = "The target is raked with steel claws. This may also raise the user's Attack stat."
    },
    [233] = {
        name = "Vital Throw",
        type = "Fighting",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 10,
        description = "The user attacks last. In return, this throw move never misses."
    },
    [234] = {
        name = "Morning Sun",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user restores its own HP. The amount of HP regained varies with the weather."
    },
    [235] = {
        name = "Synthesis",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user restores its own HP. The amount of HP regained varies with the weather."
    },
    [236] = {
        name = "Moonlight",
        type = "Fairy",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user restores its own HP. The amount of HP regained varies with the weather."
    },
    [237] = {
        name = "Hidden Power",
        type = "Normal",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 15,
        description = "A unique attack that varies in type depending on the Pokémon using it."
    },
    [238] = {
        name = "Cross Chop",
        type = "Fighting",
        category = "Physical",
        power = 100,
        accuracy = 80,
        pp = 5,
        description = "The user delivers a double chop with its forearms crossed. Critical hits land more easily."
    },
    [239] = {
        name = "Twister",
        type = "Dragon",
        category = "Special",
        power = 40,
        accuracy = 100,
        pp = 20,
        description = "The user whips up a vicious tornado to tear at the opposing team. This may also make them flinch."
    },
    [240] = {
        name = "Rain Dance",
        type = "Water",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user summons a heavy rain that falls for five turns, powering up Water-type moves."
    },
    [241] = {
        name = "Sunny Day",
        type = "Fire",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user intensifies the sun for five turns, powering up Fire-type moves."
    },
    [242] = {
        name = "Crunch",
        type = "Dark",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 15,
        description = "The user crunches up the target with sharp fangs. This may also lower the target's Defense stat."
    },
    [243] = {
        name = "Mirror Coat",
        type = "Psychic",
        category = "Special",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "A retaliation move that counters any special attack, inflicting double the damage taken."
    },
    [244] = {
        name = "Psych Up",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user hypnotizes itself into copying any stat change made by the target."
    },
    [245] = {
        name = "Extreme Speed",
        type = "Normal",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 5,
        description = "The user charges the target at blinding speed. This move always goes first."
    },
    [246] = {
        name = "Ancient Power",
        type = "Rock",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 5,
        description = "The user attacks with a prehistoric power. This may also raise all the user's stats at once."
    },
    [247] = {
        name = "Shadow Ball",
        type = "Ghost",
        category = "Special",
        power = 80,
        accuracy = 100,
        pp = 15,
        description = "The user hurls a shadowy blob at the target. This may also lower the target's Sp. Def stat."
    },
    [248] = {
        name = "Future Sight",
        type = "Psychic",
        category = "Special",
        power = 120,
        accuracy = 100,
        pp = 10,
        description = "Two turns after this move is used, a hunk of psychic energy attacks the target."
    },
    [249] = {
        name = "Rock Smash",
        type = "Fighting",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 15,
        description = "The user attacks with a punch that can shatter a rock. This may also lower the target's Defense stat."
    },
    [250] = {
        name = "Whirlpool",
        type = "Water",
        category = "Special",
        power = 35,
        accuracy = 85,
        pp = 15,
        description = "The user traps the target in a violent swirling whirlpool for four to five turns."
    },
    [251] = {
        name = "Beat Up",
        type = "Dark",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user gets all party Pokémon to attack the target. The more party Pokémon, the greater the number of attacks."
    },
    [252] = {
        name = "Fake Out",
        type = "Normal",
        category = "Physical",
        power = 40,
        accuracy = 100,
        pp = 10,
        description = "An attack that hits first and makes the target flinch. It only works the first turn the user is in battle."
    },
    [253] = {
        name = "Uproar",
        type = "Normal",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 10,
        description = "The user attacks in an uproar for three turns. During that time, no one can fall asleep."
    },
    [254] = {
        name = "Stockpile",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user charges up power and raises both its Defense and Sp. Def stats. The move can be used three times."
    },
    [255] = {
        name = "Spit Up",
        type = "Normal",
        category = "Special",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The power stored using the move Stockpile is released at once in an attack. The more power is stored, the greater the damage."
    },
    [256] = {
        name = "Swallow",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The power stored using the move Stockpile is absorbed by the user to heal its HP. Storing more power heals more HP."
    },
    [257] = {
        name = "Heat Wave",
        type = "Fire",
        category = "Special",
        power = 95,
        accuracy = 90,
        pp = 10,
        description = "The user attacks by exhaling hot breath on the opposing team. This may also leave targets with a burn."
    },
    [258] = {
        name = "Hail",
        type = "Ice",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user summons a hailstorm lasting five turns. It damages all Pokémon except Ice types."
    },
    [259] = {
        name = "Torment",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user torments and enrages the target, making it incapable of using the same move twice in a row."
    },
    [260] = {
        name = "Flatter",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "Flattery is used to confuse the target. However, this also raises the target's Sp. Atk stat."
    },
    [261] = {
        name = "Will-O-Wisp",
        type = "Fire",
        category = "Status",
        power = 0,
        accuracy = 85,
        pp = 15,
        description = "The user shoots a sinister, bluish-white flame at the target to inflict a burn."
    },
    [262] = {
        name = "Memento",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user faints when using this move. In return, it harshly lowers the target's Attack and Sp. Atk stats."
    },
    [263] = {
        name = "Facade",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 20,
        description = "An attack move that doubles its power if the user is poisoned, burned, or paralyzed."
    },
    [264] = {
        name = "Focus Punch",
        type = "Fighting",
        category = "Physical",
        power = 150,
        accuracy = 100,
        pp = 20,
        description = "The user focuses its mind before launching a punch. This move fails if the user is hit before it is used."
    },
    [265] = {
        name = "Smelling Salts",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 10,
        description = "This attack inflicts double damage on a target with paralysis. It also cures the target's paralysis, however."
    },
    [266] = {
        name = "Follow Me",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user draws attention to itself, making all targets take aim only at the user."
    },
    [267] = {
        name = "Nature Power",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "An attack that makes use of nature's power. Its effects vary depending on the user's environment."
    },
    [268] = {
        name = "Charge",
        type = "Electric",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user boosts the power of the Electric move it uses next. It also raises the user's Sp. Def stat."
    },
    [269] = {
        name = "Taunt",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The target is taunted into a rage that allows it to use only attack moves for three turns."
    },
    [270] = {
        name = "Helping Hand",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user assists an ally by boosting the power of that ally's attack."
    },
    [271] = {
        name = "Trick",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user catches the target off guard and swaps its held item with its own."
    },
    [272] = {
        name = "Role Play",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user mimics the target completely, copying the target's Ability."
    },
    [273] = {
        name = "Wish",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "One turn after this move is used, the user's or its replacement's HP is restored by half the user's max HP."
    },
    [274] = {
        name = "Assist",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user hurriedly and randomly uses a move among those known by other Pokémon in the party."
    },
    [275] = {
        name = "Ingrain",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user lays roots that restore its HP on every turn. Because it is rooted, it can't switch out."
    },
    [276] = {
        name = "Superpower",
        type = "Fighting",
        category = "Physical",
        power = 120,
        accuracy = 100,
        pp = 5,
        description = "The user attacks the target with great power. However, this also lowers the user's Attack and Defense stats."
    },
    [277] = {
        name = "Magic Coat",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "A barrier reflects back to the target moves like Leech Seed and moves that damage status."
    },
    [278] = {
        name = "Recycle",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user recycles a held item that has been used in battle so it can be used again."
    },
    [279] = {
        name = "Revenge",
        type = "Fighting",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 10,
        description = "An attack move that inflicts double the damage if the user has been hurt by the opponent in the same turn."
    },
    [280] = {
        name = "Brick Break",
        type = "Fighting",
        category = "Physical",
        power = 75,
        accuracy = 100,
        pp = 15,
        description = "The user attacks with a swift chop. It can also break barriers, such as Light Screen and Reflect."
    },
    [281] = {
        name = "Yawn",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user lets loose a huge yawn that lulls the target into falling asleep on the next turn."
    },
    [282] = {
        name = "Knock Off",
        type = "Dark",
        category = "Physical",
        power = 65,
        accuracy = 100,
        pp = 20,
        description = "The user slaps down the target's held item, and that item can't be used in that battle. The move does more damage if the target has a held item."
    },
    [283] = {
        name = "Endeavor",
        type = "Normal",
        category = "Physical",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "An attack move that cuts down the target's HP to equal the user's HP."
    },
    [284] = {
        name = "Eruption",
        type = "Fire",
        category = "Special",
        power = 150,
        accuracy = 100,
        pp = 5,
        description = "The user attacks in an explosive fury. The lower the user's HP, the less powerful this attack becomes."
    },
    [285] = {
        name = "Skill Swap",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user employs its psychic power to exchange Abilities with the target."
    },
    [286] = {
        name = "Imprison",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "If opposing Pokémon know any move also known by the user, they are prevented from using it."
    },
    [287] = {
        name = "Refresh",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user rests to cure itself of a poisoning, burn, or paralysis."
    },
    [288] = {
        name = "Grudge",
        type = "Ghost",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "If the user faints, the user's grudge fully depletes the PP of the opponent's move that knocked it out."
    },
    [289] = {
        name = "Snatch",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user steals the effects of any healing or stat-changing move the opponent attempts to use."
    },
    [290] = {
        name = "Secret Power",
        type = "Normal",
        category = "Physical",
        power = 70,
        accuracy = 100,
        pp = 20,
        description = "The user attacks with a secret power. Its additional effects vary depending on the user's environment."
    },
    [291] = {
        name = "Dive",
        type = "Water",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 10,
        description = "The user dives underwater on the first turn and strikes on the next turn. It can also be used to dive deep in the ocean."
    },
    [292] = {
        name = "Arm Thrust",
        type = "Fighting",
        category = "Physical",
        power = 15,
        accuracy = 100,
        pp = 20,
        description = "The user attacks with open-palmed arm thrusts. This move hits two to five times in a row."
    },
    [293] = {
        name = "Camouflage",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user's type is changed depending on its environment, such as at water's edge, in grass, or in a cave."
    },
    [294] = {
        name = "Tail Glow",
        type = "Bug",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user stares at flashing lights to focus its mind, drastically raising its Sp. Atk stat."
    },
    [295] = {
        name = "Luster Purge",
        type = "Psychic",
        category = "Special",
        power = 70,
        accuracy = 100,
        pp = 5,
        description = "The user lets loose a damaging burst of light. This may also lower the target's Sp. Def stat."
    },
    [296] = {
        name = "Mist Ball",
        type = "Psychic",
        category = "Special",
        power = 70,
        accuracy = 100,
        pp = 5,
        description = "The user attacks with a flurry of down. This may also lower the target's Sp. Atk stat."
    },
    [297] = {
        name = "Feather Dance",
        type = "Flying",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user covers the target's body with a mass of down that harshly lowers its Attack stat."
    },
    [298] = {
        name = "Teeter Dance",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user performs a wobbly dance that confuses all Pokémon in battle."
    },
    [299] = {
        name = "Blaze Kick",
        type = "Fire",
        category = "Physical",
        power = 85,
        accuracy = 90,
        pp = 10,
        description = "The user launches a kick with a high critical-hit ratio. This may also leave the target with a burn."
    },
    [300] = {
        name = "Mud Sport",
        type = "Ground",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user covers itself with mud. This weakens Electric-type moves for five turns."
    },
    [301] = {
        name = "Ice Ball",
        type = "Ice",
        category = "Physical",
        power = 30,
        accuracy = 90,
        pp = 20,
        description = "The user attacks the target for five turns. The move's power increases each time it hits."
    },
    [302] = {
        name = "Needle Arm",
        type = "Grass",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 15,
        description = "The user attacks by wildly swinging its thorny arms. This may also make the target flinch."
    },
    [303] = {
        name = "Slack Off",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 10,
        description = "The user slacks off, restoring its own HP by up to half of its max HP."
    },
    [304] = {
        name = "Hyper Voice",
        type = "Normal",
        category = "Special",
        power = 90,
        accuracy = 100,
        pp = 10,
        description = "The user lets loose a horribly echoing shout with the power to inflict damage."
    },
    [305] = {
        name = "Poison Fang",
        type = "Poison",
        category = "Physical",
        power = 50,
        accuracy = 100,
        pp = 15,
        description = "The user bites the target with toxic fangs. This may also leave the target badly poisoned."
    },
    [306] = {
        name = "Crush Claw",
        type = "Normal",
        category = "Physical",
        power = 75,
        accuracy = 95,
        pp = 10,
        description = "The user slashes the target with hard and sharp claws. This may also lower the target's Defense stat."
    },
    [307] = {
        name = "Blast Burn",
        type = "Fire",
        category = "Special",
        power = 150,
        accuracy = 90,
        pp = 5,
        description = "The target is razed by a fiery explosion. The user must rest on the next turn."
    },
    [308] = {
        name = "Hydro Cannon",
        type = "Water",
        category = "Special",
        power = 150,
        accuracy = 90,
        pp = 5,
        description = "The target is hit with a watery blast. The user must rest on the next turn."
    },
    [309] = {
        name = "Meteor Mash",
        type = "Steel",
        category = "Physical",
        power = 90,
        accuracy = 90,
        pp = 10,
        description = "The target is hit with a hard punch fired like a meteor. This may also raise the user's Attack stat."
    },
    [310] = {
        name = "Astonish",
        type = "Ghost",
        category = "Physical",
        power = 30,
        accuracy = 100,
        pp = 15,
        description = "The user attacks the target while shouting in a startling fashion. This may also make the target flinch."
    },
    [311] = {
        name = "Weather Ball",
        type = "Normal",
        category = "Special",
        power = 50,
        accuracy = 100,
        pp = 10,
        description = "An attack move that varies in power and type depending on the weather."
    },
    [312] = {
        name = "Aromatherapy",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user releases a soothing scent that heals all status conditions affecting the user's party."
    },
    [313] = {
        name = "Fake Tears",
        type = "Dark",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user feigns crying to fluster the target, harshly lowering its Sp. Def stat."
    },
    [314] = {
        name = "Air Cutter",
        type = "Flying",
        category = "Special",
        power = 60,
        accuracy = 95,
        pp = 25,
        description = "The user launches razor-like wind to slash the opposing team. Critical hits land more easily."
    },
    [315] = {
        name = "Overheat",
        type = "Fire",
        category = "Special",
        power = 130,
        accuracy = 90,
        pp = 5,
        description = "The user attacks the target at full power. The attack's recoil harshly lowers the user's Sp. Atk stat."
    },
    [316] = {
        name = "Odor Sleuth",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "Enables a Ghost-type target to be hit by Normal- and Fighting-type attacks. It also enables an evasive target to be hit."
    },
    [317] = {
        name = "Rock Tomb",
        type = "Rock",
        category = "Physical",
        power = 60,
        accuracy = 95,
        pp = 15,
        description = "Boulders are hurled at the target. This also lowers the target's Speed stat by preventing its movement."
    },
    [318] = {
        name = "Silver Wind",
        type = "Bug",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 5,
        description = "The target is attacked with powdery scales blown by the wind. This may also raise all the user's stats."
    },
    [319] = {
        name = "Metal Sound",
        type = "Steel",
        category = "Status",
        power = 0,
        accuracy = 85,
        pp = 40,
        description = "A horrible sound like scraping metal is emitted to sharply reduce the target's Sp. Def stat."
    },
    [320] = {
        name = "Grass Whistle",
        type = "Grass",
        category = "Status",
        power = 0,
        accuracy = 55,
        pp = 15,
        description = "The user plays a pleasant melody that lulls the target into a deep sleep."
    },
    [321] = {
        name = "Tickle",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user tickles the target into laughing, reducing its Attack and Defense stats."
    },
    [322] = {
        name = "Cosmic Power",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user absorbs a mystical power from space to raise its Defense and Sp. Def stats."
    },
    [323] = {
        name = "Water Spout",
        type = "Water",
        category = "Special",
        power = 150,
        accuracy = 100,
        pp = 5,
        description = "The user spouts water to damage opposing Pokémon. The lower the user's HP, the lower the move's power."
    },
    [324] = {
        name = "Signal Beam",
        type = "Bug",
        category = "Special",
        power = 75,
        accuracy = 100,
        pp = 15,
        description = "The user attacks with a sinister beam of light. This may also confuse the target."
    },
    [325] = {
        name = "Shadow Punch",
        type = "Ghost",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user throws a punch from the shadows. This attack never misses."
    },
    [326] = {
        name = "Extrasensory",
        type = "Psychic",
        category = "Special",
        power = 80,
        accuracy = 100,
        pp = 30,
        description = "The user attacks with an odd, unseeable power. This may also make the target flinch."
    },
    [327] = {
        name = "Sky Uppercut",
        type = "Fighting",
        category = "Physical",
        power = 85,
        accuracy = 90,
        pp = 15,
        description = "The user attacks the target with an uppercut thrown skyward with force."
    },
    [328] = {
        name = "Sand Tomb",
        type = "Ground",
        category = "Physical",
        power = 35,
        accuracy = 85,
        pp = 15,
        description = "The user traps the target inside a harshly raging sandstorm for four to five turns."
    },
    [329] = {
        name = "Sheer Cold",
        type = "Ice",
        category = "Special",
        power = 0,
        accuracy = 30,
        pp = 5,
        description = "The target is attacked with a blast of absolute-zero cold. The target instantly faints if it hits."
    },
    [330] = {
        name = "Muddy Water",
        type = "Water",
        category = "Special",
        power = 90,
        accuracy = 85,
        pp = 10,
        description = "The user attacks by shooting muddy water at the opposing team. This may also lower their accuracy."
    },
    [331] = {
        name = "Bullet Seed",
        type = "Grass",
        category = "Physical",
        power = 25,
        accuracy = 100,
        pp = 30,
        description = "The user forcefully shoots seeds at the target. Two to five seeds are shot in rapid succession."
    },
    [332] = {
        name = "Aerial Ace",
        type = "Flying",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user confounds the target with speed, then slashes. This attack never misses."
    },
    [333] = {
        name = "Icicle Spear",
        type = "Ice",
        category = "Physical",
        power = 25,
        accuracy = 100,
        pp = 30,
        description = "The user launches sharp icicles at the target. Two to five icicles are launched in rapid succession."
    },
    [334] = {
        name = "Iron Defense",
        type = "Steel",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user hardens its body's surface like iron, sharply raising its Defense stat."
    },
    [335] = {
        name = "Block",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 5,
        description = "The user blocks the target's way with arms spread wide to prevent escape."
    },
    [336] = {
        name = "Howl",
        type = "Normal",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 40,
        description = "The user howls loudly to raise its spirit, which raises its Attack stat."
    },
    [337] = {
        name = "Dragon Claw",
        type = "Dragon",
        category = "Physical",
        power = 80,
        accuracy = 100,
        pp = 15,
        description = "The user slashes the target with huge, sharp claws."
    },
    [338] = {
        name = "Frenzy Plant",
        type = "Grass",
        category = "Special",
        power = 150,
        accuracy = 90,
        pp = 5,
        description = "The user slams the target with an enormous tree. The user can't move on the next turn."
    },
    [339] = {
        name = "Bulk Up",
        type = "Fighting",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user tenses its muscles to bulk up its body, raising both its Attack and Defense stats."
    },
    [340] = {
        name = "Bounce",
        type = "Flying",
        category = "Physical",
        power = 85,
        accuracy = 85,
        pp = 5,
        description = "The user bounces up high, then drops on the target on the second turn. This may also paralyze the target."
    },
    [341] = {
        name = "Mud Shot",
        type = "Ground",
        category = "Special",
        power = 55,
        accuracy = 95,
        pp = 15,
        description = "The user attacks by hurling a blob of mud at the target. This also lowers the target's Speed stat."
    },
    [342] = {
        name = "Poison Tail",
        type = "Poison",
        category = "Physical",
        power = 50,
        accuracy = 100,
        pp = 25,
        description = "The user hits the target with its tail. This may also poison the target. Critical hits land more easily."
    },
    [343] = {
        name = "Covet",
        type = "Normal",
        category = "Physical",
        power = 60,
        accuracy = 100,
        pp = 40,
        description = "The user endearingly approaches the target, then steals the target's held item."
    },
    [344] = {
        name = "Volt Tackle",
        type = "Electric",
        category = "Physical",
        power = 120,
        accuracy = 100,
        pp = 15,
        description = "The user electrifies itself, then charges at the target. This also damages the user quite a lot."
    },
    [345] = {
        name = "Magical Leaf",
        type = "Grass",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user scatters curious leaves that chase the target. This attack never misses."
    },
    [346] = {
        name = "Water Sport",
        type = "Water",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 15,
        description = "The user soaks itself with water. This weakens Fire-type moves for five turns."
    },
    [347] = {
        name = "Calm Mind",
        type = "Psychic",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user quietly focuses its mind and calms its spirit to raise its Sp. Atk and Sp. Def stats."
    },
    [348] = {
        name = "Leaf Blade",
        type = "Grass",
        category = "Physical",
        power = 90,
        accuracy = 100,
        pp = 15,
        description = "The user handles a sharp leaf like a sword and attacks by cutting its target. Critical hits land more easily."
    },
    [349] = {
        name = "Dragon Dance",
        type = "Dragon",
        category = "Status",
        power = 0,
        accuracy = 100,
        pp = 20,
        description = "The user vigorously performs a mystic, powerful dance that raises its Attack and Speed stats."
    },
    [350] = {
        name = "Rock Blast",
        type = "Rock",
        category = "Physical",
        power = 25,
        accuracy = 90,
        pp = 10,
        description = "The user hurls hard rocks at the target. Two to five rocks are launched in rapid succession."
    },
    [351] = {
        name = "Shock Wave",
        type = "Electric",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user strikes the target with a quick jolt of electricity. This attack never misses."
    },
    [352] = {
        name = "Water Pulse",
        type = "Water",
        category = "Special",
        power = 60,
        accuracy = 100,
        pp = 20,
        description = "The user attacks the target with a pulsing blast of water. This may also confuse the target."
    },
    [353] = {
        name = "Doom Desire",
        type = "Steel",
        category = "Special",
        power = 140,
        accuracy = 100,
        pp = 5,
        description = "Two turns after this move is used, the user blasts the target with a concentrated bundle of light."
    },
    [354] = {
        name = "Psycho Boost",
        type = "Psychic",
        category = "Special",
        power = 140,
        accuracy = 90,
        pp = 5,
        description = "The user attacks the target at full power. The attack's recoil harshly lowers the user's Sp. Atk stat."
    }
}

return Moves
