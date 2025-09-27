import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../chaos_space_marines/army_rule/army_rule_csm.dart';

List<Unit> getOtherDatasheetsCSM() {
  return [
    Unit(
      id: 'CSM_OTH_1',
      name: 'Chaos Terminator Squad',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        combiBolter,
        combiWeapon,
        heavyFlamer,
        reaperAutocannon,
      ],
      meleeWeapons: [
        accursedWeapon,
        chainfist,
        pairedAccursedWeapons,
        powerFist,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        darkPacts,
      ],
      coreRuleDetails: {
        CoreAbility.deepStrike: {},
      },
      abilities: [
        'Despoilers: Каждый раз, когда этот отряд совершает Dark Pact, до конца фазы, каждый раз, когда модель в этом отряду совершает атаку, вы можете перебросить бросок на попадание.',
      ],
      specialName: null,
      specialText: null,
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 180),
        UnitCompositionOption(id: '2', modelCount: 10, points: 360),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: combi-bolter; accursed weapon.',
      damaged: {},
      transport: '',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.terminator,
        Keyword.chaosTerminatorSquad,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '''
- На каждые 5 моделей в этом отряду, combi-bolter 1 Terminator может быть заменен одним из следующего:
  ◦ 1 heavy flamer
  ◦ 1 reaper autocannon
- Любое количество моделей может заменить свой combi-bolter на 1 combi-weapon.
- На каждые 5 моделей в этом отряду, combi-bolter и accursed weapon 1 модели могут быть заменены на 1 paired accursed weapons.
- На каждые 5 моделей в этом отряду, до 3 моделей могут заменить свое accursed weapon на 1 power fist.
- На каждые 5 моделей в этом отряду, accursed weapon 1 модели может быть заменено на 1 chainfist.
''',
    ),
    Unit(
      id: 'CSM_OTH_2',
      name: 'Havocs',
      move: '5"',
      toughness: '5',
      save: '3+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        boltgun,
        flamer,
        havocAutocannon,
        havocHeavyBolter,
        havocLascannon,
        havocMissileLauncher,
        havocReaperChaincannon,
        meltagun,
        plasmaGun,
        plasmaPistol,
      ],
      meleeWeapons: [
        accursedWeapon,
        astartesChainsword,
        closeCombatWeapon,
        powerFist,
      ],
      coreAbilities: [],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Stabilisation Talons: Каждый раз, когда модель в этом отряду совершает атаку дальнобойным оружием, вы можете игнорировать любые или все модификаторы к броску на попадание и любые или все модификаторы к характеристике Ballistic Skill этого оружия.',
      ],
      coreRuleDetails: {},
      specialName: null,
      specialText: null,
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 125),
      ],
      unitCompositionDescription: 'Havoc Champion экипирован: flamer; Astartes chainsword.\n2 Havocs экипированы: Havoc autocannon; close combat weapon.\n2 Havocs экипированы: Havoc lascannon; close combat weapon.',
      damaged: {},
      transport: '',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.havocs,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '''
- Astartes chainsword Havoc Champion может быть заменен одним из следующего:
  ◦ 1 accursed weapon
  ◦ 1 power fist
- Flamer Havoc Champion может быть заменен одним из следующего:
  ◦ 1 boltgun
  ◦ 1 meltagun
  ◦ 1 plasma gun
  ◦ 1 plasma pistol
  ◦ 1 accursed weapon
  ◦ 1 power fist
- Любое количество Havocs может заменить свои Havoc autocannon или Havoc lascannon одним из следующего:
  ◦ 1 Havoc autocannon
  ◦ 1 Havoc heavy bolter
  ◦ 1 Havoc lascannon
  ◦ 1 Havoc missile launcher
  ◦ 1 Havoc reaper chaincannon
''',
    ),
    Unit(
      id: 'CSM_OTH_3',
      name: 'Helbrute',
      move: '6"',
      toughness: '9',
      save: '2+',
      wounds: '8',
      leadership: '6+',
      objectiveControl: '3',
      invulnerableSave: null,
      baseSize: '60mm',
      rangedWeapons: [
        combiBolter,
        heavyFlamer,
        missileLauncher,
        multiMelta,
        twinAutocannon,
        twinHeavyBolter,
        twinLascannon,
        helbrutePlasmaCannon
      ],
      meleeWeapons: [
        closeCombatWeapon,
        helbruteFist,
        helbruteHammer,
        powerScourge,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: { 'value': 'D3' },
      },
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Dark Ascension (Аура): Пока дружественный отряд HERETIC ASTARTES находится в пределах 6" от этой модели, каждый раз, когда этот отряд совершает Dark Pact, до конца фазы оружие, которым экипированы модели в этом отряду, получает обе способности, предоставляемые этим договором (вместо только одной).',
        'Devoted to Destruction: Если эта модель экипирована двумя оружиями ближнего боя в дополнение к своему close combat weapon, добавьте 2 к характеристике Attacks этих двух видов оружия.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 130),
      ],
      unitCompositionDescription: 'Эта модель экипирована: missile launcher; multi-melta; close combat weapon.',
      keywords: [
        Keyword.vehicle,
        Keyword.walker,
        Keyword.chaos,
        Keyword.helbrute,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: 'Multi-melta этой модели может быть заменен одним из следующего:\n- 1 Helbrute plasma cannon\n- 1 twin autocannon\n- 1 twin heavy bolter\n- 1 twin lascannon\n- 1 Helbrute fist\n\nMissile launcher этой модели может быть заменен одним из следующего:\n- 1 Helbrute fist\n- 1 Helbrute hammer\n- 1 power scourge\n\nЗа каждый Helbrute fist, которым экипирована эта модель, она может быть экипирована одним из следующего:\n- 1 combi-bolter\n- 1 heavy flamer',
      damaged: {},
    ),
    Unit(
      id: 'CSM_OTH_4',
      name: 'Obliterators',
      move: '4"',
      toughness: '7',
      save: '2+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: '5+',
      baseSize: '50mm',
      rangedWeapons: [
        fleshmetalGuns,
      ],
      meleeWeapons: [
        crushingFists,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Warp Rift Firepower: Один раз за битву, когда этот отряд совершает Dark Pact, он может использовать эту способность. Если да, то до конца фазы дальнобойное оружие, которым экипированы модели в этом отряду, получает способность [INDIRECT FIRE].',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 2, points: 160),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: fleshmetal guns; crushing fists.',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.daemon,
        Keyword.obliterators,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'CSM_OTH_5',
      name: 'Possessed',
      move: '9"',
      toughness: '6',
      save: '3+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '5+',
      baseSize: '40mm',
      rangedWeapons: [],
      meleeWeapons: [
        hideousMutations,
      ],
      coreAbilities: [],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Unholy Bloodshed: Один раз за битву, когда этот отряд совершает Dark Pact, до конца фазы оружие, которым экипированы модели в этом отряду, получает способность [DEVASTATING WOUNDS].',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 120),
        UnitCompositionOption(id: '2', modelCount: 10, points: 240),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: hideous mutations.',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.daemon,
        Keyword.possessed,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: 'Chaos Icon: Каждый раз, когда отряд носителя проходит тест на Leadership для способности Dark Pacts, вы можете перебросить этот тест.',
      wargearOptions: '1 модель может быть экипирована 1 Chaos icon.',
      damaged: {},
    )

  ];
}