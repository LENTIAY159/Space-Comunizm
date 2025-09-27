import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_ec.dart';

List<Unit> getCharactersEC() {
  return[
    Unit(
      id: 'EC_CHAR_01',
      name: 'Lord Exultant',
      move: '7"',
      toughness: '4',
      save: '3+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        boltPistol.copyWithModifiedProfile(hit: '2+', ),
        plasmaPistol.copyWithModifiedAllProfiles(hit: '2+'),
        screamerPistol.copyWithModifiedProfile(hit: '2+',),
      ],
      meleeWeapons: [
        phoenixPowerSpear,
        masterCraftedPowerSword,
        powerFist.copyWithModifiedProfile(attacks: '5+', hit: '2+', ),
        raptureLash.copyWithModifiedProfile(attacks: '4', hit: '2+', specialRules: [WeaponAbility.extraAttacks,]),
        closeCombatWeapon.copyWithModifiedProfile(attacks: '6', hit: '2+', ),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Perfectionists: Пока эта модель возглавляет отряд, оружие, которым вооружены модели в этом отряде, обладает способностью [LETHAL HITS].',
        'Euphoric Strikes: Один раз за битву, в начале фазы Fight phase, эта модель может использовать эту способность. Если она это делает, до конца фазы добавьте 3 к характеристике Attacks оружия ближнего боя, которым вооружена эта модель, и улучшите характеристику Armour Penetration этого оружия на 1.',
      ],
      wargearOptions: '''
Plasma pistol этой модели может быть заменён одним из следующего:
  • 1 power fist
  • 1 rapture lash
Phoenix power spear этой модели может быть заменён одним из следующего:
  • 1 master-crafted power sword
  • 1 screamer pistol
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 80),
      ],
      unitCompositionDescription: 'Эта модель вооружена: bolt pistol; plasma pistol; Phoenix power spear; close combat weapon.',
      leader: [
        Keyword.infractors,
        Keyword.tormentors,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.lordExultant,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
    Unit(
      id: 'EC_CHAR_02',
      name: 'Lord Kakophonist',
      move: '6"',
      toughness: '5',
      save: '2+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        screamerPistol.copyWithModifiedProfile(hit: '2+'),
      ],
      meleeWeapons: [
        powerSword.copyWithModifiedProfile(attacks: '6', hit: '2+', ),
        closeCombatWeapon.copyWithModifiedProfile(attacks: '6', hit: '2+', ),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Obsessive Annunciation: Пока эта модель возглавляет отряд, оружие дальнего боя, которым вооружены модели в этом отряде, обладает способностью [SUSTAINED HITS 1].',
        'Doom Siren: В вашу фазу Shooting phase, после того как отряд этой модели выстрелил, выберите один вражеский отряд INFANTRY, который был поражён одной или более из этих атак, и бросьте три D6: на каждый результат 4+ этот вражеский отряд получает 1 mortal wound. Если вражеский отряд получает одну или более mortal wounds в результате этой способности, он должен пройти тест Battle-shock.',
      ],
      wargearOptions: '''
Power sword этой модели может быть заменён 1 screamer pistol и 1 close combat weapon.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 60),
      ],
      unitCompositionDescription: 'Эта модель вооружена: screamer pistol; power sword.',
      leader: [
        Keyword.chaosTerminators,
        Keyword.noiseMarines,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.lordKakophonist,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
    Unit(
      id: 'EC_CHAR_03',
      name: 'Sorcerer',
      move: '7"',
      toughness: '4',
      save: '3+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        agonisingEnergies,
        boltPistol,
      ],
      meleeWeapons: [
        forceWeapon.copyWithModifiedProfile(ap: '-2',),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Warped Interference (Psychic): Пока эта модель возглавляет отряд, каждый раз когда дальняя атака нацелена на этот отряд, модели в нём получают Benefit of Cover против этой атаки.',
        'Wracking Agonies (Psychic): В вашу фазу Shooting phase, после того как эта модель выстрелила, выберите один отряд INFANTRY, поражённый одной или более атаками, сделанными её Agonising Energies. До начала вашего следующего хода этот отряд охвачен агониями. Пока отряд охвачен агониями, вычтите 2" из его характеристики Move и вычтите 2 из бросков Charge, сделанных для него.',
      ],
      wargearOptions: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 60),
      ],
      unitCompositionDescription: 'Эта модель вооружена: Agonising Energies; bolt pistol; force weapon.',
      leader: [
        Keyword.infractors,
        Keyword.noiseMarines,
        Keyword.tormentors,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.psyker,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.sorcerer,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
    Unit(
  id: 'EC_CHAR_04',
  name: 'Fulgrim',
  move: '16"',
  toughness: '11',
  save: '2+',
  wounds: '16',
  leadership: '5+',
  objectiveControl: '6',
  invulnerableSave: '4+',
  baseSize: '130mm',
  rangedWeapons: [
  maleficLash,
  ],
  meleeWeapons: [
  daemonicBlades,
  serpentineTail,
  ],

  coreAbilities: [
  CoreAbility.deadlyDemise,
  CoreAbility.deepStrike,
  ],
  coreRuleDetails: {
  CoreAbility.deadlyDemise: {'value': 'D6'},
  },
  factionAbilities: [
  thrillSeekers,
  ],

  abilities: [
  'Daemonic Poisons: В вашу Shooting phase и Fight phase, после того как эта модель завершила свои атаки, выберите один вражеский отряд, поражённый одной или более из этих атак. До конца битвы этот отряд считается отравленным. В начале каждой Command phase каждого игрока бросьте один D6 за каждый отравленный вражеский отряд на поле: на 4+ этот отряд получает D3 mortal wounds.',
  'Daemon Primarch of Slaanesh: В начале Command phase вашего оппонента выберите одну из способностей в разделе Daemon Primarch of Slaanesh. До начала вашей следующей Command phase эта модель обладает этой способностью.',
  'Serpentine: Каждый раз, когда эта модель совершает Normal, Advance или Fall Back перемещение, она может перемещаться через участки terrain features высотой до 4" включительно.',
  ],

  specialName: 'Daemon Primarch of Slaanesh',
  specialText: '''
Beguiling Form: Каждый раз, когда по этой модели совершается атака, вычтите 1 из броска Hit.
Daemonic Speed: Эта модель имеет способность [Fights First].
Enthralling Hypnosis (Aura): Пока вражеский отряд находится в пределах 6" от этой модели, каждый раз, когда этот отряд выбирается для Fall Back, он должен пройти Leadership тест. Если тест провален, этот отряд считается Remain Stationary в этом ходу.
''',

  commander: ['SUPREME COMMANDER', true],

  unitComposition: [
  UnitCompositionOption(id: '1', modelCount: 1, points: 340),
  ],
  unitCompositionDescription: 'Эта модель вооружена: malefic lash; daemonic blades; serpentine tail.',

  keywords: [
  Keyword.monster,
  Keyword.fly,
  Keyword.character,
  Keyword.epicHero,
  Keyword.daemon,
  Keyword.chaos,
  Keyword.slaanesh,
  Keyword.primarch,
  Keyword.fulgrim,
  ],
  factionKeywords: [
  FactionKeyword.emperorsChildren,
  ],

  damaged: {
  '1-6 Wounds Remaining': 'Пока у этой модели остаётся 1-6 Wounds, каждый раз, когда она совершает атаку, вычтите 1 из броска Hit.',
  },
  ),

  ];
}