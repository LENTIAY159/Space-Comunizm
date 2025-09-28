import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../chaos_space_marines/army_rule/army_rule_csm.dart';


List<Unit> getCharactersCSM() {
  return [
    Unit(
      id: 'CSM_CHAR_01',
      name: 'Abaddon the Despoiler',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '9',
      leadership: '5+',
      objectiveControl: '4',
      invulnerableSave: '4+',
      baseSize: '60mm',
      rangedWeapons: [
        talonOfHorus1,
      ],
      meleeWeapons: [
        drachNyen,
        talonOfHorus2,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'The Warmaster: В вашу Command phase выберите одну способность Warmaster (см. слева). До начала вашей следующей Command phase эта модель имеет эту способность.',
        'Dark Destiny: Каждый раз, когда отряд этой модели делает Dark Pact и не проваливает результирующий Leadership test, если результат этого теста был 7+, вы получаете 1CP.',
      ],
      specialName: 'WARMASTER',
      specialText: '''
Paragon of Hatred (Aura): Пока дружественный HERETIC ASTARTES отряд находится в пределах 6" (исключая DAMNED отряды) от этой модели, каждый раз, когда модель в этом отряде совершает атаку, вы можете перебросить Hit roll.

Mark of Chaos Ascendant (Aura): Пока дружественный HERETIC ASTARTES INFANTRY или HERETIC ASTARTES MOUNTED отряд (исключая DAMNED отряды) находится в пределах 6" от этой модели, модели в этом отряде имеют 4+ invulnerable save.

Lord of the Traitor Legions (Aura): Пока дружественный HERETIC ASTARTES отряд (исключая DAMNED отряды) находится в пределах 6" от этой модели, вы можете перебрасывать Leadership и Battle-shock tests для этого отряда.
''',
      leader: [
        Keyword.chaosTerminatorSquad,
        Keyword.chosen,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Chaos Terminator Squad, Chosen.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 270),
      ],
      unitCompositionDescription: '1 Abaddon the Despoiler – EPIC HERO\nЭта модель экипирована: Talon of Horus; Drachʼnyen.',
      keywords: [
      Keyword.infantry,
      Keyword.character,
      Keyword.epicHero,
      Keyword.terminator,
      Keyword.chaosUndivided,
      Keyword.chaos,
      Keyword.abaddonTheDespoiler,
      ],
    factionKeywords: [
    FactionKeyword.hereticAstartes,
    ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'CSM_CHAR_02',
      name: 'Chaos Lord',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        plasmaPistol.copyWithModifiedAllProfiles(hit: '2+')

      ],
      meleeWeapons: [
        daemonHammer,
        accursedWeapon,
        astartesChainblade,
        powerFist.copyWithModifiedProfile(attacks: '5', hit: '2+'),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Lord of Chaos: Один раз за battle round, один отряд из вашей армии с этой способностью может использовать её, когда его отряд становится целью Stratagem. Если он это делает, уменьшите CP стоимость этого использования этой Stratagem на 1CP.',
        'Chance for Glory: Один раз за сражение, в начале Fight phase, эта модель может использовать эту способность. Если она это делает, до конца фазы улучшите характеристики Strength, Attacks, Armour Penetration и Damage melee weapons, экипированных этой моделью, на 1.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.chosen,
        Keyword.legionaries,
        Keyword.nemesisClaw,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Chosen, Legionaries, Nemesis Claw.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 90),
      ],
      unitCompositionDescription: 'Эта модель экипирована: plasma pistol; daemon hammer.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.chaosLord,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '''
• Daemon hammer этой модели может быть заменен на одно из следующего:
  ◦ 1 accursed weapon
  ◦ 1 Astartes chainsword
• Plasma pistol этой модели может быть заменен на 1 power fist.
''',
      damaged: {},
    ),
    Unit(
      id: 'CSM_CHAR_03',
      name: 'Master of Possession',
      move: '8"',
      toughness: '4',
      save: '3+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '5+',
      baseSize: '40mm',
      rangedWeapons: [
        boltPistol,
        riteOfPossession,
      ],
      meleeWeapons: [
        staffOfPossession,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Daemonkin (Psychic): Пока эта модель ведет отряд, добавьте 1 к Advance и Charge rolls для этого отряда.',
        'Sacrificial Dagger: Один раз за фазу, когда эта модель выбрана для стрельбы или боя, она может использовать эту способность. Если она это делает, отряд этой модели получает 1 mortal wound и, до конца фазы, каждый раз, когда эта модель совершает Psychic Attack, добавьте 1 к Hit roll и добавьте 1 к Wound roll.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.chosen,
        Keyword.legionaries,
        Keyword.possessed,
        Keyword.nemesisClaw,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Chosen, Legionaries, Possessed, Nemesis Claw.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 60),
      ],
      unitCompositionDescription: 'Эта модель экипирована: bolt pistol; Rite of Possession; staff of possession.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.psyker,
        Keyword.chaos,
        Keyword.masterOfPossession,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'CSM_CHAR_04',
      name: 'Vashtorr the Arkifane',
      move: '12"',
      toughness: '10',
      save: '2+',
      wounds: '14',
      leadership: '6+',
      objectiveControl: '3',
      invulnerableSave: '4+',
      baseSize: '80mm',
      rangedWeapons: [
        vashtorrsClaw,
      ],
      meleeWeapons: [
        vashtorrsHammer,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.deepStrike,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: { 'value': 'D3' },
      },
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Unholy Mechanisms (Aura): Пока дружественный DAEMON VEHICLE отряд находится в пределах 6" от этой модели, добавьте 2 к Strength characteristic weapons, экипированных моделями в этом отряде.',
        'Reorder Reality: Каждый раз, когда вражеский отряд в пределах 18" от этой модели целится в эту модель, вычтите 1 из Hit roll и, до конца фазы, ranged weapons этого вражеского отряда имеют способность [HAZARDOUS].',
        'Indentured Daemon Engines: Пока эта модель находится в пределах 3" от одного или более дружественных DAEMON VEHICLE отрядов, эта модель имеет способность Lone Operative.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 175),
      ],
      unitCompositionDescription: '1 Vashtorr the Arkifane – EPIC HERO\nЭта модель экипирована: Vashtorrs claw; Vashtorrs hammer.',
      keywords: [
        Keyword.monster,
        Keyword.character,
        Keyword.epicHero,
        Keyword.fly,
        Keyword.chaos,
        Keyword.daemon,
        Keyword.vashtorrTheArkifane,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {
        '1-4': 'Пока у этой модели остается 1–4 wounds, каждый раз, когда эта модель совершает атаку, вычтите 1 из Hit roll.',
      },
    ),
    Unit(
      id: 'CSM_CHAR_05',
      name: 'Warpsmith',
      move: '6"',
      toughness: '4',
      save: '2+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '60 x 35mm',
      rangedWeapons: [
        flamerTendril,
        meltaTendril,
        plasmaPistol.copyWithModifiedAllProfiles(hit: '2+'),
      ],
      meleeWeapons: [
        forgeWeapon,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Warpsmith: Пока эта модель находится в пределах 3" от одного или более дружественных HERETIC ASTARTES VEHICLE отрядов, эта модель имеет способность Lone Operative.',
        'Master of Mechanisms: В вашу Command phase выберите одну дружественную HERETIC ASTARTES VEHICLE модель в пределах 3" от этой модели. Эта VEHICLE модель восстанавливает до D3 потерянных wounds и, до начала вашей следующей Command phase, каждый раз, когда эта VEHICLE совершает атаку, добавьте 1 к Hit roll. Каждая модель может быть выбрана для этой способности только один раз за Command phase.',
        'Enrage Machine Spirits: В конце вашей Movement phase выберите один вражеский VEHICLE отряд в пределах 12" от этой модели. Этот отряд должен пройти Battle-shock test.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.chosen,
        Keyword.havocs,
        Keyword.legionaries,
        Keyword.nemesisClaw,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Chosen, Havocs, Legionaries, Nemesis Claw.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 70),
      ],
      unitCompositionDescription: 'Эта модель экипирована: flamer tendril; melta tendril; plasma pistol; forge weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.warpsmith,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
  ];
}