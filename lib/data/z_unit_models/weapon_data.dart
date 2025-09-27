import 'weapon_model.dart';
import 'core_abilities.dart';

// Оружие с одним профилем (без имени профиля)
final boltRifle = Weapon(
  name: 'Bolt Rifle',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.assault, WeaponAbility.heavy],
    ),
  ],
);

final pistol = Weapon(
  name: 'Bolt Pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final powerSword = Weapon(
  name: 'Power Sword',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '1',
    ),
  ],
);

// Оружие с несколькими профилями (с именами профилей)
final plasmaPistol = Weapon(
  name: 'Plasma Pistol',
  profiles: [
    WeaponProfile(
      name: 'Standard',
      range: '18"',
      attacks: '1',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
    WeaponProfile(
      name: 'Supercharge',
      range: '18"',
      attacks: '1',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [WeaponAbility.hazardous, WeaponAbility.pistol],
    ),
  ],
);

// Пример оружия с одним именованным профилем
final flamer = Weapon(
  name: 'Flamer',
  profiles: [
    WeaponProfile(
      name: 'Torrent',
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.ignoresCover, WeaponAbility.torrent],
    ),
  ],
);


final powerFist = Weapon(
  name: 'Power Fist',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '2',
    ),
  ],
);

// Дополнительные примеры с различными правилами
final heavyBolter = Weapon(
  name: 'Heavy Bolter',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '3',
      hit: '4+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [WeaponAbility.heavy, WeaponAbility.sustainedHits],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final meltaGun = Weapon(
  name: 'Meltagun',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '9',
      ap: '-4',
      damage: 'D6',
      specialRules: [WeaponAbility.melta],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
  ],
);

final stormBolter = Weapon(
  name: 'Storm Bolter',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.rapidFire],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 2},
      },
    ),
  ],
);

final absolvorBoltPistol = Weapon(
  name: 'Absolvor Bolt Pistol',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '1',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final closeCombatWeapon = Weapon(
  name: 'Close Combat Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
    ),
  ],
);

final boltPistol = Weapon(
  name: 'Bolt Pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final heavyBoltPistol = Weapon(
  name: 'Heavy Bolt Pistol',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '1',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final masterCraftedBoltgun = Weapon(
  name: 'Master-crafted Boltgun',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final neoVolkitePistol = Weapon(
  name: 'Neo-volkite Pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '2+',
      strength: '5',
      ap: '0',
      damage: '2',
      specialRules: [WeaponAbility.devastatingWounds, WeaponAbility.pistol],
    ),
  ],
);

final masterCraftedPowerWeapon = Weapon(
  name: 'Master-crafted Power Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final boltstormGauntlet = Weapon(
  name: 'Boltstorm Gauntlet',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '3',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final masterCraftedHeavyBoltRifle = Weapon(
  name: 'Master-crafted Heavy Bolt Rifle',
  profiles: [
    WeaponProfile(
      range: '30"',
      attacks: '2',
      hit: '2+',
      strength: '5',
      ap: '-1',
      damage: '3',
      specialRules: [WeaponAbility.assault, WeaponAbility.heavy],
    ),
  ],
);

final relicBlade = Weapon(
  name: 'Relic Blade',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '2',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.extraAttacks],
    ),
  ],
);

final relicChainsword = Weapon(
  name: 'Relic Chainsword',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '2',
      specialRules: [WeaponAbility.extraAttacks],
    ),
  ],
);

final relicFist = Weapon(
  name: 'Relic Fist',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '8',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final combiWeapon = Weapon(
  name: 'Combi-weapon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '1',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.devastatingWounds,
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '4+'},
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
  ],
);

final relicWeapon = Weapon(
  name: 'Relic Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final croziusArcanum = Weapon(
  name: 'Crozius Arcanum',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '6',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final smite = Weapon(
  name: 'Smite',
  profiles: [
    WeaponProfile(
      name: 'Witchfire',
      range: '24"',
      attacks: 'D6',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: 'D3',
      specialRules: [WeaponAbility.psychic],
    ),
    WeaponProfile(
      name: 'Focused Witchfire',
      range: '24"',
      attacks: 'D6',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: 'D3',
      specialRules: [
        WeaponAbility.devastatingWounds,
        WeaponAbility.hazardous,
        WeaponAbility.psychic,
      ],
    ),
  ],
);

final forceWeapon = Weapon(
  name: 'Force Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: 'D3',
      specialRules: [WeaponAbility.psychic],
    ),
  ],
);

final forgeBolter = Weapon(
  name: 'Forge Bolter',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '3',
      hit: '2+',
      strength: '5',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final gravPistol = Weapon(
  name: 'Grav-pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '2',
      specialRules: [WeaponAbility.anti, WeaponAbility.pistol],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '2+'},
      },
    ),
  ],
);

final omnissianPowerAxe = Weapon(
  name: 'Omnissian Power Axe',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final servoArm = Weapon(
  name: 'Servo-arm',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '1',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '3',
      specialRules: [WeaponAbility.extraAttacks],
    ),
  ],
);

final astartesGrenadeLauncher = Weapon(
  name: 'Astartes Grenade Launcher – Frag',
  profiles: [
    WeaponProfile(
      name: 'Frag',
      range: '24"',
      attacks: 'D3',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.blast],
    ),
    WeaponProfile(
      name: 'Krak',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '9',
      ap: '-2',
      damage: 'D3',
    ),
  ],
);



final handFlamer = Weapon(
  name: 'Hand Flamer',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.ignoresCover, WeaponAbility.pistol, WeaponAbility.torrent],
    ),
  ],
);

final astartesChainsword = Weapon(
  name: 'Astartes Chainsword',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final powerWeapon = Weapon(
  name: 'Power Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '1',
    ),
  ],
);

final thunderHammer = Weapon(
  name: 'Thunder Hammer',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '4+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.devastatingWounds],
    ),
  ],
);

final autoBoltstormGauntlets = Weapon(
  name: 'Auto Boltstorm Gauntlets',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.twinLinked],
    ),
  ],
);

final flamestormGauntlets = Weapon(
  name: 'Flamestorm Gauntlets',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6+1',
      hit: 'N/A',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final fragstormGrenadeLauncher = Weapon(
  name: 'Fragstorm Grenade Launcher',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D6',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.blast],
    ),
  ],
);

final twinPowerFists = Weapon(
  name: 'Twin Power Fists',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.twinLinked],
    ),
  ],
);

final ballistusMissileLauncher = Weapon(
  name: 'Ballistus Missile Launcher – Frag',
  profiles: [
    WeaponProfile(
      name: 'Frag',
      range: '48"',
      attacks: '2D6',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.blast],
    ),
    WeaponProfile(
      name: 'Krak',
      range: '48"',
      attacks: '2',
      hit: '3+',
      strength: '10',
      ap: '-2',
      damage: 'D6',
    ),
  ],
);



final ballistusLascannon = Weapon(
  name: 'Ballistus Lascannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '2',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: 'D6+1',
    ),
  ],
);

final twinStormBolter = Weapon(
  name: 'Twin Storm Bolter',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.rapidFire, WeaponAbility.twinLinked],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 2},
      },
    ),
  ],
);

final armouredFeet = Weapon(
  name: 'Armoured Feet',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '7',
      ap: '0',
      damage: '1',
    ),
  ],
);

final meltaRifle = Weapon(
  name: 'Melta Rifle',
  profiles: [
    WeaponProfile(
      name: 'Heavy',
      range: '18"',
      attacks: '1',
      hit: '3+',
      strength: '9',
      ap: '-4',
      damage: 'D6',
      specialRules: [WeaponAbility.heavy, WeaponAbility.melta],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
  ],
);

final multiMelta = Weapon(
  name: 'Multi-melta',
  profiles: [
    WeaponProfile(
      name: 'Heavy',
      range: '18"',
      attacks: '2',
      hit: '4+',
      strength: '9',
      ap: '-4',
      damage: 'D6',
      specialRules: [WeaponAbility.heavy, WeaponAbility.melta],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
  ],
);

final assaultBolters = Weapon(
  name: 'Assault Bolters',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.pistol,
        WeaponAbility.sustainedHits,
        WeaponAbility.twinLinked,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 2},
      },
    ),
  ],
);

final plasmaExterminators = Weapon(
  name: 'Plasma Exterminators',
  profiles: [
    WeaponProfile(
      name: 'Standard',
      range: '18"',
      attacks: '2',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.pistol,
        WeaponAbility.twinLinked,
      ],
    ),
    WeaponProfile(
      name: 'Supercharge',
      range: '18"',
      attacks: '2',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.pistol,
        WeaponAbility.hazardous,
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final pyreblaster = Weapon(
  name: 'Pyreblaster',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final heavyFlamer = Weapon(
  name: 'Heavy Flamer',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final heavyOnslaughtGatlingCannon = Weapon(
  name: 'Heavy Onslaught Gatling Cannon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '12',
      hit: '3+',
      strength: '6',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.devastatingWounds],
    ),
  ],
);

final icarusRocketPod = Weapon(
  name: 'Icarus Rocket Pod',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: 'D3',
      hit: '3+',
      strength: '8',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'fly', 'value': '2+'},
      },
    ),
  ],
);

final macroPlasmaIncinerator = Weapon(
  name: 'Macro Plasma Incinerator',
  profiles: [
    WeaponProfile(
      name: 'Standard',
      range: '36"',
      attacks: 'D6+1',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [WeaponAbility.blast],
    ),
    WeaponProfile(
      name: 'Supercharge',
      range: '36"',
      attacks: 'D6+1',
      hit: '3+',
      strength: '9',
      ap: '-4',
      damage: '3',
      specialRules: [WeaponAbility.blast, WeaponAbility.hazardous],
    ),
  ],
);



final onslaughtGatlingCannon = Weapon(
  name: 'Onslaught Gatling Cannon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '8',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.devastatingWounds],
    ),
  ],
);

final twinFragstormGrenadeLauncher = Weapon(
  name: 'Twin Fragstorm Grenade Launcher',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D6',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.blast, WeaponAbility.twinLinked],
    ),
  ],
);



final redemptorFist = Weapon(
  name: 'Redemptor Fist',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '12',
      ap: '-2',
      damage: '3',
    ),
  ],
);

final boltgun = Weapon(
  name: 'Boltgun',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
    ),
  ],
);

final astartesShotgun = Weapon(
  name: 'Astartes Shotgun',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.assault],
    ),
  ],
);

final scoutSniperRifle = Weapon(
  name: 'Scout Sniper Rifle',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '1',
      hit: '3+',
      strength: '4',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.heavy, WeaponAbility.precision],
    ),
  ],
);

final combatKnife = Weapon(
  name: 'Combat Knife',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
    ),
  ],
);


final sternguardBoltPistol = Weapon(
  name: 'Sternguard Bolt Pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.devastatingWounds, WeaponAbility.pistol],
    ),
  ],
);

final sternguardBoltRifle = Weapon(
  name: 'Sternguard Bolt Rifle',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.devastatingWounds,
        WeaponAbility.heavy,
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
  ],
);

final pyrecannon = Weapon(
  name: 'Pyrecannon',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6+1',
      hit: 'N/A',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.ignoresCover, WeaponAbility.torrent],
    ),
  ],
);

final sternguardHeavyBolter = Weapon(
  name: 'Sternguard Heavy Bolter',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '3',
      hit: '4+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.devastatingWounds,
        WeaponAbility.heavy,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);


final assaultCannon = Weapon(
  name: 'Assault Cannon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '6',
      hit: '3+',
      strength: '6',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.devastatingWounds],
    ),
  ],
);

final cycloneMissileLauncher = Weapon(
  name: 'Cyclone Missile Launcher',
  profiles: [
    WeaponProfile(
      name: 'Frag',
      range: '36"',
      attacks: '2D6',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [WeaponAbility.blast],
    ),
    WeaponProfile(
      name: 'Krak',
      range: '36"',
      attacks: '2',
      hit: '3+',
      strength: '9',
      ap: '-2',
      damage: 'D6',
    ),
  ],
);

final chainfist = Weapon(
  name: 'Chainfist',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '4+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '3+'},
      },
    ),
  ],
);

final missileLauncher = Weapon(
  name: 'Missible Launcher',
  profiles: [
    WeaponProfile(
      name: 'Frag',
      range: '48',
      attacks: 'D6',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.blast, WeaponAbility.heavy,
      ],

    ),
    WeaponProfile(
      name: 'Krak',
      range: '48',
      attacks: '1',
      hit: '4+',
      strength: '9',
      ap: '-2',
      damage: 'D6',
      specialRules: [
        WeaponAbility.heavy,
      ],
    ),
  ],
);


final talonOfHorus1 = Weapon(
  name: 'Talon of Horus',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '4',
      hit: '2+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final drachNyen = Weapon(
  name: 'Drach’nyen',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '8',
      hit: '2+',
      strength: '14',
      ap: '-4',
      damage: '3',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);

final talonOfHorus2 = Weapon(
  name: 'Talon of Horus',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '14',
      hit: '2+',
      strength: '7',
      ap: '-3',
      damage: '1',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);






final accursedWeapon = Weapon(
  name: 'Accursed Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '1',
    ),
  ],
);

final astartesChainblade = Weapon(
  name: 'Astartes Chainblade',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '7',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final daemonHammer = Weapon(
  name: 'Daemon Hammer',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);



final riteOfPossession = Weapon(
  name: 'Rite of Possession',
  profiles: [
    WeaponProfile(
      name: 'Witchfire',
      range: '18"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.pistol,
        WeaponAbility.precision,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'psyker', 'value': '2+'},
      },
    ),
    WeaponProfile(
      name: 'Focused Witchfire',
      range: '18"',
      attacks: '2',
      hit: '3+',
      strength: '6',
      ap: '-3',
      damage: '3',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.hazardous,
        WeaponAbility.pistol,
        WeaponAbility.precision,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'psyker', 'value': '2+'},
      },
    ),
  ],
);



final staffOfPossession = Weapon(
  name: 'Staff of Possession',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: 'D3',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'psyker', 'value': '2+'},
      },
    ),
  ],
);


final vashtorrsClaw = Weapon(
  name: 'Vashtorr’s Claw',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '5',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '4+'},
      },
    ),
  ],
);

final vashtorrsHammer = Weapon(
  name: 'Vashtorr’s Hammer – Strike',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '14',
      ap: '-3',
      damage: '3',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.devastatingWounds,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '4+'},
      },
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '12',
      hit: '2+',
      strength: '8',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.devastatingWounds,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '4+'},
      },
    ),
  ],
);




final flamerTendril = Weapon(
  name: 'Flamer Tendril',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.pistol,
        WeaponAbility.torrent,
        WeaponAbility.ignoresCover,
      ],
    ),
  ],
);

final meltaTendril = Weapon(
  name: 'Melta Tendril',
  profiles: [
    WeaponProfile(
      range: '6"',
      attacks: '1',
      hit: '2+',
      strength: '8',
      ap: '-4',
      damage: 'D3',
      specialRules: [
        WeaponAbility.pistol,
        WeaponAbility.melta,
      ],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
  ],
);



final forgeWeapon = Weapon(
  name: 'Forge Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '4+'},
      },
    ),
  ],
);


final autopistol = Weapon(
  name: 'Autopistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '4+',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.pistol,
      ],
    ),
  ],
);


final brutalAssaultWeapon = Weapon(
  name: 'Brutal Assault Weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '2',
      hit: '4+',
      strength: '3',
      ap: '0',
      damage: '1',
    ),
  ],
);



final balefireTome = Weapon(
  name: 'Balefire Tome',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.psychic,
      ],
    ),
  ],
);



final havocAutocannon = Weapon(
  name: 'Havoc Autocannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '2',
      hit: '3+',
      strength: '9',
      ap: '-1',
      damage: '3',
    ),
  ],
);



final meltagun = Weapon(
  name: 'Meltagun',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '9',
      ap: '-4',
      damage: 'D6',
      specialRules: [
        WeaponAbility.melta,
      ],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
  ],
);

final lascannon = Weapon(
  name: 'Lascannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '1',
      hit: '4+',
      strength: '12',
      ap: '-3',
      damage: 'D6+1',
      specialRules: [
        WeaponAbility.heavy,
      ],
    ),
  ],
);




final plasmaGun = Weapon(
  name: 'Plasma Gun',
  profiles: [
    WeaponProfile(
      name: 'Standard',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
    WeaponProfile(
      name: 'Supercharge',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.hazardous,
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
  ],
);


final reaperChaincannon = Weapon(
  name: 'Reaper Chaincannon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '8',
      hit: '4+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.heavy,
      ],
    ),
  ],
);


final heavyMeleeWeapon = Weapon(
  name: 'Heavy Melee Weapon',
  profiles: [
      WeaponProfile(
          range: 'Melee',
          attacks: '3',
          hit: '3+',
          strength: '8',
          ap: '-2',
          damage: '2'
      ),
    ]
);

final chainblade = Weapon(
  name: 'Chainblade',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final khornateEviscerator = Weapon(
  name: 'Khornate Eviscerator',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final plagueSpewer = Weapon(
  name: 'Plague spewer',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '2+'},
      },
    ),
  ],
);

final plagueBelcher = Weapon(
  name: 'Plague belcher',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '4+'},
      },
    ),
  ],
);

final buboticWeapons = Weapon(
  name: 'Bubotic weapons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final heavyPlagueWeapon = Weapon(
  name: 'Heavy plague weapon',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '4+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final plagueKnives = Weapon(
  name: 'Plague knives',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [],
    ),
  ],
);

final blightLauncher = Weapon(
  name: 'Blight launcher',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: 'D3',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);


final infernoBoltPistol = Weapon(
  name: 'Inferno bolt pistol',
  profiles: [
    WeaponProfile(
      range: '12\"',
      attacks: '1',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.pistol],
    ),
  ],
);

final infernoBoltgun = Weapon(
  name: 'Inferno boltgun',
  profiles: [
    WeaponProfile(
      range: '24\"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '-2',
      damage: '1',
    ),
  ],
);

final maleficCurse = Weapon(
  name: 'Malefic Curse',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '-3',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.devastatingWounds,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '4+'},
      },
    ),
  ],
);

final soulreaperCannon = Weapon(
  name: 'Soulreaper cannon',
  profiles: [
    WeaponProfile(
      range: '24\"',
      attacks: '6',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);

final warpflamePistol = Weapon(
  name: 'Warpflame pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '3',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.pistol,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final warpflamer = Weapon(
  name: 'Warpflamer',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
    ),
  ],
);


final combiBolter = Weapon(
  name: 'Combi-bolter',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 2},
      },
    ),
  ],
);

final havocLauncher = Weapon(
  name: 'Havoc launcher',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: 'D6',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
  ],
);

final armouredTracks = Weapon(
  name: 'Armoured tracks',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '4+',
      strength: '6',
      ap: '0',
      damage: '1',
    ),
  ],
);

final pairedAccursedWeapons = Weapon(
  name: 'Paired accursed weapons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final reaperAutocannon = Weapon(
  name: 'Reaper autocannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '4',
      hit: '3+',
      strength: '7',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.devastatingWounds,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final havocHeavyBolter = Weapon(
  name: 'Havoc heavy bolter',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.sustainedHits
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1}
      },
    ),
  ],
);

final havocLascannon = Weapon(
  name: 'Havoc lascannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '1',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: 'D6+1',
    ),
  ],
);

final havocMissileLauncher = Weapon(
  name: 'Havoc missile launcher',
  profiles: [
    WeaponProfile(
      name: 'frag',
      range: '48"',
      attacks: 'D6',
      hit: '3+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.blast
      ],
    ),
    WeaponProfile(
      name: 'krak',
      range: '48"',
      attacks: '1',
      hit: '3+',
      strength: '9',
      ap: '-2',
      damage: 'D6',
    ),
  ],
);

final havocReaperChaincannon = Weapon(
  name: 'Havoc reaper chaincannon',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '8',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
    ),
  ],
);

final helbrutePlasmaCannon = Weapon(
  name: 'Helbrute plasma cannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D3',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '3',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.hazardous,
      ],
    ),
  ],
);


final twinAutocannon = Weapon(
  name: 'Twin autocannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '6',
      hit: '3+',
      strength: '7',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final twinHeavyBolter = Weapon(
  name: 'Twin heavy bolter',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '6',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.sustainedHits,
        WeaponAbility.twinLinked,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final twinLascannon = Weapon(
  name: 'Twin lascannon',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '1',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: 'D6+1',
      specialRules: [
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final helbruteFist = Weapon(
  name: 'Helbrute fist',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '12',
      ap: '-2',
      damage: '3',
    ),
  ],
);

final helbruteHammer = Weapon(
  name: 'Helbrute hammer',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '4+',
      strength: '14',
      ap: '-3',
      damage: 'D6+1',
    ),
  ],
);

final powerScourge = Weapon(
  name: 'Power scourge',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '8',
      hit: '3+',
      strength: '7',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final fleshmetalGuns = Weapon(
  name: 'Fleshmetal guns',
  profiles: [
    WeaponProfile(
      name: 'Focused Malice',
      range: '18"',
      attacks: 'D3',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: '4',
      specialRules: [
        WeaponAbility.melta,
      ],
      specialRuleDetails: {
        WeaponAbility.melta: {'value': 2},
      },
    ),
    WeaponProfile(
      name: 'Ruinous Salvo',
      range: '24"',
      attacks: 'D6',
      hit: '3+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
    WeaponProfile(
      name: 'Warp Hail',
      range: '24"',
      attacks: 'D6+3',
      hit: '3+',
      strength: '5',
      ap: '1',
      damage: '1',
      specialRules: [
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final crushingFists = Weapon(
  name: 'Crushing fists',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '9',
      ap: '-2',
      damage: '2',
    ),
  ],
);

final hideousMutations = Weapon(
  name: 'Hideous mutations',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final pairedCombatBlades = Weapon(
  name: 'Paired combat blades',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '4+'},
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final gazeOfDeath = Weapon(
  name: 'Gaze of death',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D3',
      hit: '2+',
      strength: '12',
      ap: '-2',
      damage: 'D6+3',
    ),
  ],
);

final scytheOfTheNightbringer = Weapon(
  name: 'Scythe of the Nightbringer',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '14',
      ap: '-4',
      damage: 'D6+2',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '14',
      hit: '2+',
      strength: '8',
      ap: '-2',
      damage: '2',
    ),
  ],
);


final spearOfTheVoidDragonRanged = Weapon(
  name: 'Spear of the Void Dragon',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '1',
      hit: '2+',
      strength: '4',
      ap: '-3',
      damage: 'D6+2',
      specialRules: [
        WeaponAbility.anti,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '2+'},
      },
    ),
  ],
);

final voltaicStorm = Weapon(
  name: 'Voltaic storm',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D6+3',
      hit: '2+',
      strength: '7',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 2},
      },
    ),
  ],
);

final spearOfTheVoidDragon = Weapon(
  name: 'Spear of the Void Dragon – strike',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '12',
      ap: '-3',
      damage: 'D6+2',
      specialRules: [
        WeaponAbility.anti,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'vehicle', 'value': '2+'},
      },
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '10',
      hit: '2+',
      strength: '8',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final canoptekTailBlades = Weapon(
  name: 'Canoptek tail blades',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.extraAttacks,
      ],
    ),
  ],
);

final enmiticDisintegratorPistols = Weapon(
  name: 'Enmitic disintegrator pistols',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '6',
      hit: '2+',
      strength: '6',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.pistol,
        WeaponAbility.ignoresCover,
      ],
    ),
  ],
);



final eldritchLanceRanged = Weapon(
  name: 'Eldritch lance',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '3',
      hit: '3+',
      strength: '9',
      ap: '-3',
      damage: '3',
    ),
  ],
);

final eldritchLanceMelee = Weapon(
  name: 'Eldritch lance',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '9',
      ap: '-3',
      damage: '3',
    ),
  ],
);

final impalingLegs = Weapon(
  name: 'Impaling legs',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.extraAttacks,
      ],
    ),
  ],
);

final staffOfLightRanged = Weapon(
  name: 'Staff of light',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '3',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '1',
    ),
  ],
);

final tachyonArrow = Weapon(
  name: 'Tachyon arrow',
  profiles: [
    WeaponProfile(
      range: '72"',
      attacks: '1',
      hit: '2+',
      strength: '16',
      ap: '-5',
      damage: 'D6+2',
      specialRules: [
        WeaponAbility.oneShot,
      ],
    ),
  ],
);

final overlordsBlade = Weapon(
  name: 'Overlord’s blade',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '2+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);

final staffOfLightMelee = Weapon(
  name: 'Staff of light',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '1',
    ),
  ],
);

final voidscythe = Weapon(
  name: 'Voidscythe',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: '3',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);


final gaussBlaster = Weapon(
  name: 'Gauss blaster',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final teslaCarbine = Weapon(
  name: 'Tesla carbine',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '2',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 2},
      },
    ),
  ],
);

final gaussFlayer = Weapon(
  name: 'Gauss flayer',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '1',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
  ],
);

final gaussReaper = Weapon(
  name: 'Gauss reaper',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '2',
      hit: '4+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final enmiticExterminator = Weapon(
  name: 'Enmitic exterminator',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: '6',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.heavy,
        WeaponAbility.rapidFire,
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 6},
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final gaussDestructor = Weapon(
  name: 'Gauss destructor',
  profiles: [
    WeaponProfile(
      range: '48"',
      attacks: '1',
      hit: '3+',
      strength: '14',
      ap: '-4',
      damage: '6',
      specialRules: [
        WeaponAbility.heavy,
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final skorpekhHyperphaseWeapons = Weapon(
  name: 'Skorpekh hyperphase weapons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '2',
    ),
  ],
);


final heavyVenomCannon = Weapon(
  name: 'Heavy venom cannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D3',
      hit: '2+',
      strength: '9',
      ap: '-2',
      damage: '3',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
  ],
);

final stranglethornCannon = Weapon(
  name: 'Stranglethorn cannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D6+1',
      hit: '2+',
      strength: '7',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
  ],
);

final monstrousBoneswordAndLashWhip = Weapon(
  name: 'Monstrous bonesword and lash whip',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '9',
      ap: '-2',
      damage: '3',
      specialRules: [
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final monstrousScythingTalons = Weapon(
  name: 'Monstrous scything talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '2+',
      strength: '7',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.extraAttacks,
      ],
    ),
  ],
);

final psychicScream = Weapon(
  name: 'Psychic scream',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '2D6',
      hit: 'N/A',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.psychic,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final neurotyrantClawsAndLashes = Weapon(
  name: 'Neurotyrant claws and lashes',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
    ),
  ],
);

final primeTalons = Weapon(
  name: 'Prime talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '6',
      ap: '-1',
      damage: '2',
    ),
  ],
);

final venomBolt = Weapon(
  name: 'Venom bolt',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6+3',
      hit: 'N/A',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final primeClawsAndTalons = Weapon(
  name: 'Prime claws and talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'vehicle'),
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'monster'),
        WeaponAbility.twinLinked,
      ],
        specialRuleDetails: {
          // Ключи должны точно соответствовать тем, что в specialRules
          WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'vehicle'): {'type': 'vehicle', 'value': '5+',},
          WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'monster'): {'type': 'Monster', 'value': '5+',},
      },
    ),
  ],
);

final ravenerHeavyClawsAndTalons = Weapon(
  name: 'Ravener heavy claws and talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'vehicle'),
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'monster'),
        WeaponAbility.twinLinked,
      ],
      specialRuleDetails: {
        // Ключи должны точно соответствовать тем, что в specialRules
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'vehicle'): {'type': 'vehicle', 'value': '5+',},
        WeaponAbilityKeys.createWithId(WeaponAbility.anti, 'monster'): {'type': 'monster', 'value': '5+',},
      },
    ),
  ],
);

final hormagauntTalons = Weapon(
  name: 'Hormagaunt talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '4+',
      strength: '3',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final fleshborer = Weapon(
  name: 'Fleshborer',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '1',
      hit: '4+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
      ],
    ),
  ],
);

final shardlauncher = Weapon(
  name: 'Shardlauncher',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D3',
      hit: '4+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.heavy,
      ],
    ),
  ],
);

final spikeRifle = Weapon(
  name: 'Spike rifle',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '1',
      hit: '4+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.heavy,
      ],
    ),
  ],
);

final strangleweb = Weapon(
  name: 'Strangleweb',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '2',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.devastatingWounds,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final termagantDevourer = Weapon(
  name: 'Termagant devourer',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '2',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
    ),
  ],
);

final termagantSpinefists = Weapon(
  name: 'Termagant spinefists',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '2',
      hit: '4+',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.pistol,
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final chitinousClawsAndTeeth = Weapon(
  name: 'Chitinous claws and teeth',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '1',
      hit: '4+',
      strength: '3',
      ap: '0',
      damage: '1',
    ),
  ],
);

final barblauncher = Weapon(
  name: 'Barblauncher',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: 'D6',
      hit: '4+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.heavy,
      ],
    ),
  ],
);

final piercingClawsAndTalons = Weapon(
  name: 'Piercing claws and talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '6',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.precision,
      ],
    ),
  ],
);

final psychoclasticTorrent = Weapon(
  name: 'Psychoclastic torrent',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
      ],
    ),
  ],
);

final talonsAndBetentacledMaw = Weapon(
  name: 'Talons and betentacled maw',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.devastatingWounds,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'psyker', 'value': '4+'},
      },
    ),
  ],
);

final spinemaws = Weapon(
  name: 'Spinemaws',
  profiles: [
    WeaponProfile(
      range: '6"',
      attacks: '4',
      hit: '5+',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.pistol,
      ],
    ),
  ],
);

final bioPlasmicScream = Weapon(
  name: 'Bio-plasmic scream',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: 'D6+3',
      hit: '4+',
      strength: '8',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.blast,
      ],
    ),
  ],
);

final screamerKillerTalons = Weapon(
  name: 'Screamer-Killer talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '10',
      hit: '3+',
      strength: '10',
      ap: '-2',
      damage: '3',
    ),
  ],
);

final barbedStrangler = Weapon(
  name: 'Barbed strangler',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D6+1',
      hit: '4+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
  ],
);

final deathspitter = Weapon(
  name: 'Deathspitter',
  profiles: [
    WeaponProfile(
      range: '24"',
      attacks: '3',
      hit: '4+',
      strength: '5',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final devourer = Weapon(
  name: 'Devourer',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '5',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
    ),
  ],
);

final spinefists = Weapon(
  name: 'Spinefists',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '2',
      hit: '4+',
      strength: '4',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.assault,
        WeaponAbility.pistol,
        WeaponAbility.twinLinked,
      ],
    ),
  ],
);

final venomCannon = Weapon(
  name: 'Venom cannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D3',
      hit: '4+',
      strength: '9',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.blast,
      ],
    ),
  ],
);

final tyranidWarriorClawsAndTalons = Weapon(
  name: 'Tyranid Warrior claws and talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final leapersTalons = Weapon(
  name: 'Leaper’s talons',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '1',
    ),
  ],
);

final warpBlast = Weapon(
  name: 'Warp Blast',
  profiles: [
    WeaponProfile(
      name: 'witchfire',
      range: '24"',
      attacks: 'D3',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: 'D3',
      specialRules: [
        WeaponAbility.blast,
        WeaponAbility.psychic,
      ],
    ),
    WeaponProfile(
      name: 'focused witchfire',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '12',
      ap: '-3',
      damage: 'D6+1',
      specialRules: [
        WeaponAbility.lethalHits,
        WeaponAbility.psychic,
      ],
    ),
  ],
);

final handOfDominion1 = Weapon(
  name: 'Hand of Dominion',
  profiles: [
    WeaponProfile(
      range: '30"',
      attacks: '2',
      hit: '2+',
      strength: '6',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.rapidFire,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 2},
      },
    ),
  ],
);

final emperorsSword = Weapon(
  name: 'Emperor’s Sword',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '14',
      hit: '2+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
    ),
  ],
);

final handOfDominion2 = Weapon(
  name: 'Hand of Dominion',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '7',
      hit: '2+',
      strength: '14',
      ap: '-4',
      damage: '4',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);


final helfrostCannon = Weapon(
  name: 'Helfrost cannon',
  profiles: [
    WeaponProfile(
      name: 'Dispersed',
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '6',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.torrent,
      ],
    ),
    WeaponProfile(
      name: 'Focused',
      range: '36"',
      attacks: '1',
      hit: '2+',
      strength: '10',
      ap: '-3',
      damage: '5',
    ),
  ],
);


final trueclaw = Weapon(
  name: 'Trueclaw',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '12',
      ap: '-2',
      damage: '3',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
  ],
);

final armaLuminis = Weapon(
  name: 'Arma Luminis',
  profiles: [
    WeaponProfile(
      name: 'Bolt',
      range: '12"',
      attacks: '4',
      hit: '2+',
      strength: '4',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.pistol,
      ],
    ),
    WeaponProfile(
      name: 'Plasma',
      range: '12"',
      attacks: '2',
      hit: '2+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.pistol,
      ],
    ),
  ],
);

final fealty = Weapon(
  name: 'Fealty',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '8',
      hit: '2+',
      strength: '12',
      ap: '-4',
      damage: '4',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '16',
      hit: '2+',
      strength: '6',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.sustainedHits,
      ],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final twinPlagueSpewer = Weapon(
  name: 'Twin plague spewer',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '5',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.ignoresCover,
        WeaponAbility.torrent,
        WeaponAbility.twinLinked,
      ],
      specialRuleDetails: {
        WeaponAbility.anti: {'type': 'infantry', 'value': '2+'},
      },
    ),
  ],
);

final plagueWind = Weapon(
  name: 'Plague Wind',
  profiles: [
    WeaponProfile(
      name: 'Witchfire',
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '4',
      ap: '-1',
      damage: 'D3',
      specialRules: [
        WeaponAbility.psychic,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'Focused witchfire',
      range: '12"',
      attacks: 'D6+3',
      hit: 'N/A',
      strength: '6',
      ap: '-2',
      damage: 'D3',
      specialRules: [
        WeaponAbility.hazardous,
        WeaponAbility.psychic,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final corruptedStaff = Weapon(
  name: 'Corrupted staff',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '6',
      ap: '-1',
      damage: 'D3',
      specialRules: [
        WeaponAbility.lethalHits,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final lakrimae = Weapon(
  name: 'Lakrimae',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '9',
      ap: '-2',
      damage: '3',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '12',
      hit: '2+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
      specialRuleDetails: {},
    ),
  ],
);


final buboticBlade = Weapon(
  name: 'Bubotic blade',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.lethalHits],
      specialRuleDetails: {},
    ),
  ],
);

final flailOfCorruption = Weapon(
  name: 'Flail of corruption',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [WeaponAbility.lethalHits],
      specialRuleDetails: {},
    ),
  ],
);

final plaguespurtGauntlet = Weapon(
  name: 'Plaguespurt gauntlet',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: 'D6',
      hit: 'N/A',
      strength: '3',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.anti,
        WeaponAbility.ignoresCover,
        WeaponAbility.pistol,
        WeaponAbility.torrent,
      ],
      specialRuleDetails: {WeaponAbility.anti: {'type': 'infantry', 'value': '4+'},},
    ),
  ],
);

final manreaper = Weapon(
  name: 'Manreaper',
  profiles: [
    WeaponProfile(
      name: 'Strike',
      range: 'Melee',
      attacks: '4',
      hit: '2+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'Sweep',
      range: 'Melee',
      attacks: '8',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.lethalHits,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final plasmaCannon = Weapon(
  name: 'Plasma cannon',
  profiles: [
    WeaponProfile(
      range: '36"',
      attacks: 'D3',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [WeaponAbility.blast, WeaponAbility.hazardous, WeaponAbility.lethalHits],
      specialRuleDetails: {},
    ),
  ],
);

final screamerPistol = Weapon(
  name: 'Screamer pistol',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: '2',
      specialRules: [
        WeaponAbility.ignoresCover,
        WeaponAbility.pistol,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final phoenixPowerSpear = Weapon(
  name: 'Phoenix power spear',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '7',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.lance,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final raptureLash = Weapon(
  name: 'Rapture lash',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.precision,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final masterCraftedPowerSword = Weapon(
  name: 'Master-crafted power sword',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '5',
      hit: '2+',
      strength: '5',
      ap: '-2',
      damage: '2',
      specialRules: [
        WeaponAbility.precision,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final agonisingEnergies = Weapon(
  name: 'Agonising Energies',
  profiles: [
    WeaponProfile(
      name: 'witchfire',
      range: '18"',
      attacks: 'D6',
      hit: '3+',
      strength: '5',
      ap: '-1',
      damage: 'D3',
      specialRules: [
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'focused witchfire',
      range: '18"',
      attacks: 'D3',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: 'D3',
      specialRules: [
        WeaponAbility.devastatingWounds,
        WeaponAbility.hazardous,
        WeaponAbility.psychic,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final slashingClaws = Weapon(
  name: 'Slashing claws',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '3',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.devastatingWounds,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final duellingSabre = Weapon(
  name: 'Duelling sabre',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '4',
      hit: '3+',
      strength: '4',
      ap: '-1',
      damage: '1',
      specialRules: [
        WeaponAbility.precision,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final tormentorsPlasmaGun = Weapon(
  name: 'Plasma gun',
  profiles: [
    WeaponProfile(
      name: 'standard',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.rapidFire,
        WeaponAbility.precision,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
    WeaponProfile(
      name: 'supercharge',
      range: '24"',
      attacks: '1',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.hazardous,
        WeaponAbility.rapidFire,
        WeaponAbility.precision,
      ],
      specialRuleDetails: {
        WeaponAbility.rapidFire: {'value': 1},
      },
    ),
  ],
);

final tormentorsPlasmaPistol = Weapon(
  name: 'Plasma pistol',
  profiles: [
    WeaponProfile(
      name: 'standard',
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '7',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.pistol,
        WeaponAbility.precision,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'supercharge',
      range: '12"',
      attacks: '1',
      hit: '3+',
      strength: '8',
      ap: '-3',
      damage: '2',
      specialRules: [
        WeaponAbility.hazardous,
        WeaponAbility.pistol,
        WeaponAbility.precision,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final blastmaster = Weapon(
  name: 'Blastmaster',
  profiles: [
    WeaponProfile(
      name: 'single frequency',
      range: '18',
      attacks: '3',
      hit: '3+',
      strength: '10',
      ap: '-2',
      damage: '3',
      specialRules: [
        WeaponAbility.ignoresCover,
      ],
      specialRuleDetails: {},
    ),
    WeaponProfile(
      name: 'varied frequency',
      range: '18',
      attacks: '6',
      hit: '3+',
      strength: '6',
      ap: '-2',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
      ],
      specialRuleDetails: {},
    ),
  ],
);

final sonicBlaster = Weapon(
  name: 'Sonic blaster',
  profiles: [
    WeaponProfile(
      range: '18"',
      attacks: '3',
      hit: '3+',
      strength: '5',
      ap: '0',
      damage: '1',
      specialRules: [
        WeaponAbility.ignoresCover,
      ],
      specialRuleDetails: {},
    ),
  ],
);


final maleficLash = Weapon(
  name: 'Malefic lash',
  profiles: [
    WeaponProfile(
      range: '12"',
      attacks: '6',
      hit: '2+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.sustainedHits],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final daemonicBlades = Weapon(
  name: 'Daemonic blades',
  profiles: [
    WeaponProfile(
      name: 'strike',
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '14',
      ap: '-3',
      damage: 'D6+1',
      specialRules: [WeaponAbility.sustainedHits],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
    WeaponProfile(
      name: 'sweep',
      range: 'Melee',
      attacks: '12',
      hit: '2+',
      strength: '8',
      ap: '-2',
      damage: '2',
      specialRules: [WeaponAbility.sustainedHits],
      specialRuleDetails: {
        WeaponAbility.sustainedHits: {'value': 1},
      },
    ),
  ],
);

final serpentineTail = Weapon(
  name: 'Serpentine tail',
  profiles: [
    WeaponProfile(
      range: 'Melee',
      attacks: '6',
      hit: '2+',
      strength: '6',
      ap: '-1',
      damage: '1',
      specialRules: [WeaponAbility.extraAttacks],
    ),
  ],
);