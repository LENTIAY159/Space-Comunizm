import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_necrons.dart';

List<Unit> getCharactersNecrons() {
  return [
    Unit(
      id: 'NEC_CHAR_01',
      name: 'Cʼtan Shard of the Nightbringer',
    move: '6"',
      toughness: '11',
      save: '4+',
      wounds: '12',
      leadership: '6+',
      objectiveControl: '4',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        gazeOfDeath,
      ],
      meleeWeapons: [
        scytheOfTheNightbringer
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.feelNoPain,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': 'D6'},
        CoreAbility.feelNoPain: {'value': '5+'},
      },
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Drain Life: В конце Fight фазы бросьте один D6 за каждый вражеский юнит в пределах 6" от этой модели: при результате 4+ этот вражеский юнит получает D3 смертельных ран.',
        'Necrodermis: Каждый раз, когда атака назначается этой модели, уменьшите вдвое характеристику Урона этой атаки.',
      ],
      commander: ['ENSLAVED STAR GOD', false],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 305),
      ],
      unitCompositionDescription: 'Эта модель оснащена: gaze of death; Scythe of the Nightbringer.',
      keywords: [
        Keyword.monster,
        Keyword.character,
        Keyword.epicHero,
        Keyword.fly,
        'Cʼtan Shard of the Nightbringer',
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'NEC_CHAR_02',
      name: 'Cʼtan Shard of the Void Dragon',
    move: '6"',
      toughness: '11',
      save: '4+',
      wounds: '12',
      leadership: '6+',
      objectiveControl: '4',
      invulnerableSave: '4+',
      baseSize: '80mm',
      rangedWeapons: [
        spearOfTheVoidDragonRanged,
        voltaicStorm,
      ],
      meleeWeapons: [
        spearOfTheVoidDragon,
        canoptekTailBlades,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.feelNoPain,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': 'D6'},
        CoreAbility.feelNoPain: {'value': '5+'},
      },
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Matter Absorption: В начале вашей Shooting фазы выберите один вражеский VEHICLE юнит в пределах 12" от этой модели и бросьте один D6: при результате 2+ этот вражеский юнит получает D3 смертельных ран, а эта модель восстанавливает до такого же количества потерянных ран.',
        'Necrodermis: Каждый раз, когда атака назначается этой модели, уменьшите вдвое характеристику Урона этой атаки.',
      ],
      commander: ['ENSLAVED STAR GOD', false],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 300),
      ],
      unitCompositionDescription: ' 1 Cʼtan Shard of the Void Dragon – EPIC HERO\nЭта модель оснащена: Spear of the Void Dragon; voltaic storm; Canoptek tail blades.',
      keywords: [
      Keyword.monster,
      Keyword.character,
      Keyword.fly,
      Keyword.epicHero,
      Keyword.ctanShardOfTheVoidDragon,
      ],
    factionKeywords: [
    FactionKeyword.necrons,
    ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'NEC_CHAR_03',
      name: 'Hexmark Destroyer',
      move: '8"',
      toughness: '5',
      save: '3+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '50mm',
      rangedWeapons: [
        enmiticDisintegratorPistols,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '4', strength: '5',),
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.loneOperative,
      ],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Inescapable Death: Один раз за ход один юнит из вашей армии с этой способностью может быть выбран целью для стратагемы Fire Overwatch за 0CP, даже если вы уже использовали эту стратагему на другом юните в этой фазе. Кроме того, каждый раз, когда вы выбираете этот юнит целью для стратагемы Fire Overwatch, при разрешении этой стратагемы попадания засчитываются при немодифицированных бросках Попадания 2+.',
        'Multi-threat Eliminator: Один раз за ход, в Shooting фазу вашего противника, когда вражеский юнит совершает дальнобойную атаку, нацеленную на дружественный NECRONS юнит в пределах 3" от модели с этой способностью, после того как этот вражеский юнит выстрелил, одна модель с этой способностью, находящаяся в пределах 3" от этой цели, может стрелять так, как если бы это была ваша Shooting фаза, но она должна нацеливаться только на этот вражеский юнит при этом, и может делать это только если этот вражеский юнит является подходящей целью.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 75),
      ],
      unitCompositionDescription: 'Каждая модель оснащена: enmitic disintegrator pistols; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.destroyerCult,
        Keyword.hexmarkDestroyer,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'NEC_CHAR_04',
      name: 'Illuminor Szeras',
      move: '8"',
      toughness: '8',
      save: '2+',
      wounds: '9',
      leadership: '6+',
      objectiveControl: '3',
      invulnerableSave: '4+',
      baseSize: '80mm',
      rangedWeapons: [
        eldritchLanceRanged,
      ],
      meleeWeapons: [
        eldritchLanceMelee,
        impalingLegs,
      ],
      coreAbilities: [
        CoreAbility.feelNoPain,
      ],
      coreRuleDetails: {
        CoreAbility.feelNoPain: {'value': '4+'},
      },
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Illuminor: Пока эта модель находится в пределах 3" от одного или нескольких других дружественных NECRONS юнитов, эта модель имеет способность Lone Operative.',
        'Mechanical Augmentation (Aura): Пока дружественный NECRONS BATTLELINE юнит находится в пределах 3" от этой модели, каждый раз, когда модель в этом юните совершает атаку, улучшите характеристику Пробития Брони этой атаки на 1, и каждый раз, когда атака нацелена на этот юнит, ухудшите характеристику Пробития Брони этой атаки на 1.',
        'Atomic Energy Manipulator: В конце Fight фазы, если эта модель уничтожила одну или более моделей в этой фазе, до конца битвы добавьте 3" к дальности действия ее способности Mechanical Augmentation до максимума 12".',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 165),
      ],
      unitCompositionDescription: '1 Illuminor Szeras – EPIC HERO\nЭта модель оснащена: eldritch lance; impaling legs.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.epicHero,
        Keyword.cryptek,
        Keyword.illuminorSzeras,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'NEC_CHAR_05',
      name: 'Overlord',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        staffOfLightRanged,
        tachyonArrow,
      ],
      meleeWeapons: [
        overlordsBlade,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'My Will Be Done: Один раз за боевой раунд один юнит из вашей армии с этой способностью может использовать ее, когда его юнит выбирается целью для стратагемы. Если он это делает, уменьшите стоимость CP этого использования этой стратагемы на 1CP.',
        'Implacable Resilience: Каждый раз, когда атака назначается этой модели, вычтите 1 из характеристики Урона этой атаки.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.immortals,
        Keyword.lychguard,
        Keyword.necronWarriors,
      ],
      leaderDescription: 'Эта модель может быть прикреплена к следующим юнитам: Immortals, Lychguard, Necron Warriors',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 85),
      ],
      unitCompositionDescription: 'Эта модель оснащена: tachyon arrow; Overlordʼs blade.',
    keywords: [
    Keyword.infantry,
      Keyword.character,
      Keyword.noble,
      Keyword.overlord,
      ],
    factionKeywords: [
    FactionKeyword.necrons,
    ],
      wargearAbilities: 'Resurrection Orb: Один раз за битву, пока носитель ведет юнит, в конце любой фазы он может воскресить этот юнит, если он находится на поле боя. Когда вы это делаете, Reanimation Protocols этого юнита активируются, воскрешая D6 ран вместо D3 при этом. Вы не можете воскресить более одного юнита за ход.',
      wargearOptions: '''
Tachyon arrow и Overlord's blade этой модели могут быть заменены на одно из следующего:
• 1 staff of light
• 1 voidscythe

Если эта модель не оснащена tachyon arrow, она может быть оснащена 1 resurrection orb.
''',
    damaged: {},
    ),
    Unit(
      id: 'NEC_CHAR_06',
      name: 'Technomancer',
      move: '10"',
      toughness: '4',
      save: '4+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '50mm',
      rangedWeapons: [
        staffOfLightRanged.copyWithModifiedProfile(hit: '4+',),
      ],
      meleeWeapons: [
        staffOfLightMelee.copyWithModifiedProfile(attacks: '2', hit: '4+',),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Rites of Reanimation: Пока эта модель ведет юнит, модели в этом юните имеют способность Feel No Pain 5+.',
        'Technomancer: В конце вашей Movement фазы вы можете выбрать одну дружественную NECRONS модель в пределах 6" от носителя. Эта модель восстанавливает до D3 потерянных ран. Каждая модель может быть выбрана для этой способности только один раз за ход.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.canoptekWraiths,
        Keyword.immortals,
        Keyword.necronWarriors,
      ],
      leaderDescription: '''Эта модель может быть прикреплена к следующим юнитам:
Canoptek Wraiths
Immortals
Necron Warriors

Вы можете прикрепить эту модель к одному из вышеуказанных юнитов, даже если одна модель ROYAL WARDEN или NOBLE уже была к нему прикреплена. Если вы это делаете, и этот Bodyguard юнит уничтожен, прикрепленные к нему Leader юниты становятся отдельными юнитами со своими первоначальными Starting Strengths.''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 80),
      ],
      unitCompositionDescription: 'Эта модель оснащена: staff of light; Canoptek cloak.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.cryptek,
        Keyword.fly,
        Keyword.technomancer,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    )

  ];
}