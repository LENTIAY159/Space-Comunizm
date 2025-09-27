import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import '../space_marines/army_rule/army_rule_sm.dart';

List<Unit> getCharactersSM() {
  return [
    Unit(
      id: 'SM_CHAR_01',
      name: 'Apothecary Biologis',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '3',
      rangedWeapons: [
        absolvorBoltPistol,
      ],
      meleeWeapons: [
        closeCombatWeapon,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Surgical Precision: Пока эта модель ведет юнит, оружие, которым экипированы модели в этом юните, имеет способность [LETHAL HITS].',
        'Vivispectrum: Если юнит этой модели уничтожает вражеский юнит в результате рукопашной атаки, до конца битвы эта модель имеет характеристику Objective Control равную 9.',
      ],
      leader: [
        Keyword.aggressorSquad,
        Keyword.eradicatorSquad,
        Keyword.heavyIntercessorSquad,
      ],
      leaderDescription: 'Вы можете прикрепить эту модель к одному из вышеуказанных юнитов, даже если одна модель CAPTAIN или CHAPTER MASTER уже была к нему прикреплена. Если вы это делаете, и этот Bodyguard юнит уничтожен, прикрепленные к нему LEADER юниты становятся отдельными юнитами со своими первоначальными Starting Strengths.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 70),
      ],
      unitCompositionDescription: 'Эта модель оснащена: absolvor bolt pistol; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.imperium,
        Keyword.gravis,
        Keyword.apothecary,
        Keyword.biologis,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_02',
      name: 'Captain',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        boltPistol.copyWithModifiedProfile(hit: '2+'),
        heavyBoltPistol,
        masterCraftedBoltgun,
        neoVolkitePistol,
        plasmaPistol.copyWithModifiedAllProfiles(hit: '2+'),
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '6', hit: '2+'),
        masterCraftedPowerWeapon,
        powerFist.copyWithModifiedProfile(attacks: '5', hit: '2+'),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Rites of Battle: Один раз за боевой раунд один юнит из вашей армии с этой способностью может использовать ее, когда его юнит выбирается целью для стратагемы. Если он это делает, уменьшите стоимость CP этого использования этой стратагемы на 1CP.',
        'Finest Hour: Один раз за битву, в начале Fight фазы эта модель может использовать эту способность. Если она это делает, до конца фазы добавьте 3 к характеристике Атак рукопашного оружия, которым экипирована эта модель, и это оружие получает способность [DEVASTATING WOUNDS].',
      ],
      wargearAbilities: 'Relic Shield: Носитель имеет характеристику Wounds равную 6.',
      wargearOptions: '''
Bolt pistol, master-crafted bolter и close combat weapon этой модели могут быть заменены на одно из следующего:
- 1 heavy bolt pistol и 1 power fist
- 1 heavy bolt pistol и 1 master-crafted power weapon
- 1 neo-volkite pistol и 1 power fist
- 1 neo-volkite pistol и 1 master-crafted power weapon
- 1 plasma pistol и 1 power fist
- 1 plasma pistol и 1 master-crafted power weapon
- 1 heavy bolt pistol, 1 master-crafted power weapon и 1 relic shield

Close combat weapon этой модели может быть заменено на одно из следующего:
- 1 master-crafted power weapon
- 1 power fist
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 80),
      ],
      unitCompositionDescription: 'Эта модель оснащена: bolt pistol; master-crafted bolter; close combat weapon.',
      leader: [
        Keyword.assaultIntercessorSquad,
        Keyword.bladeguardVeteranSquad,
        Keyword.companyHeroes,
        Keyword.hellblasterSquad,
        Keyword.infernusSquad,
        Keyword.intercessorSquad,
        Keyword.sternGuardVeteranSquad,
        Keyword.tacticalSquad,
      ],
      leaderDescription: 'Эта модель не может быть прикреплена к BLADEGUARD VETERAN SQUAD, если эта модель не экипирована relic shield, и не может быть прикреплена к HELLBLASTER SQUAD, если эта модель не экипирована plasma pistol.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.captain,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_03',
      name: 'Captain in Gravis Armour',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        boltstormGauntlet,
        masterCraftedHeavyBoltRifle,
      ],
      meleeWeapons: [
        masterCraftedPowerWeapon.copyWithModifiedProfile(attacks: '6', hit: '2+', ap: '-2', damage: '2'),
        powerFist.copyWithModifiedProfile(attacks: '5', hit: '2+',),
        relicBlade,
        relicChainsword,
        relicFist.copyWithModifiedProfile(attacks: '1', specialRules: [WeaponAbility.extraAttacks],),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Rites of Battle: Один раз за боевой раунд один юнит из вашей армии с этой способностью может использовать ее, когда его юнит выбирается целью для стратагемы. Если он это делает, уменьшите стоимость CP этого использования этой стратагемы на 1CP.',
        'Refuse to Yield: Каждый раз, когда атака назначается этой модели, уменьшите вдвое характеристику Урона этой атаки.',
      ],
      wargearOptions: '''
Master-crafted heavy bolt rifle и master-crafted power weapon этой модели могут быть заменены на:
- 1 boltstorm gauntlet, 1 power fist и 1 relic chainsword
- 1 boltstorm gauntlet, 1 power fist и 1 relic blade
- 1 boltstorm gauntlet, 1 power fist и 1 relic fist
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 80),
      ],
      unitCompositionDescription: 'Эта модель оснащена: master-crafted heavy bolt rifle; master-crafted power weapon.',
      leader: [
        Keyword.aggressorSquad,
        Keyword.eradicatorSquad,
        Keyword.heavyIntercessorSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.gravis,
        Keyword.captain,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_04',
      name: 'Captain in Terminator Armour',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        stormBolter.copyWithModifiedProfile(hit: '2+'),
        combiWeapon.copyWithModifiedProfile(hit: '3+'),
      ],
      meleeWeapons: [
        relicFist,
        relicWeapon,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Rites of Battle: Один раз за боевой раунд один юнит из вашей армии с этой способностью может использовать ее, когда его юнит выбирается целью для стратагемы. Если он это делает, уменьшите стоимость CP этого использования этой стратагемы на 1CP.',
        'The Imperium\'s Sword: Вы можете перебрасывать броски на Charge для юнита этой модели.',
      ],
      wargearOptions: '''
Storm bolter этой модели может быть заменен на 1 combi-weapon
Relic weapon этой модели может быть заменено на 1 relic fist
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 95),
      ],
      unitCompositionDescription: 'Эта модель оснащена: storm bolter; relic weapon.',
      leader: [
        Keyword.terminatorAssaultSquad,
        Keyword.terminatorSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.imperium,
        Keyword.terminator,
        Keyword.captain,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_05',
      name: 'Chaplain',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '5',
      leadership: '5+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        absolvorBoltPistol,
      ],
      meleeWeapons: [
        croziusArcanum,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Litany of Hate: Пока эта модель ведет юнит, каждый раз, когда модель в этом юните совершает рукопашную атаку, добавьте 1 к броску на Ранение.',
        'Spiritual Leader: Один раз за битву, в начале любой фазы вы можете выбрать один дружественный ADEPTUS ASTARTES юнит, который находится в состоянии Battle-shocked и в пределах 12" от этой модели. Этот юнит больше не находится в состоянии Battle-shocked.',
      ],
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 60),
      ],
      unitCompositionDescription: 'Эта модель оснащена: absolvor bolt pistol; crozius arcanum.',
      leader: [
        Keyword.assaultIntercessorSquad,
        Keyword.bladeguardVeteranSquad,
        Keyword.hellblasterSquad,
        Keyword.infernusSquad,
        Keyword.intercessorSquad,
        Keyword.sternGuardVeteranSquad,
        Keyword.tacticalSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.captain,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_06',
      name: 'Chaplain in Terminator Armour',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '5',
      leadership: '5+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        stormBolter,
      ],
      meleeWeapons: [
        croziusArcanum,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Litany of Hate: Пока эта модель ведет юнит, каждый раз, когда модель в этом юните совершает рукопашную атаку, добавьте 1 к броску на Ранение.',
        'Recitation of Faith: Пока эта модель ведет юнит, модели в этом юните имеют способность Feel No Pain 4+ против смертельных ран.',
      ],
      wargearAbilities: 'Relic Shield: Носитель имеет характеристику Wounds равную 6.',
      wargearOptions: '''
Storm bolter этой модели может быть заменен на 1 relic shield.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 75),
      ],
      unitCompositionDescription: 'Эта модель оснащена: storm bolter; crozius arcanum.',
      leader: [
        Keyword.terminatorAssaultSquad,
        Keyword.terminatorSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.imperium,
        Keyword.terminator,
        Keyword.chaplain,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_07',
      name: 'Librarian in Terminator Armour',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '5',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        combiWeapon,
        smite,
        stormBolter,
      ],
      meleeWeapons: [
        forceWeapon,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Psychic Hood: Пока эта модель ведет юнит, модели в этом юните имеют способность Feel No Pain 4+ против Psychic Attacks.',
        'Veil of Time (Psychic): Пока эта модель ведет юнит, оружие, которым экипированы модели в этом юните, имеет способность [SUSTAINED HITS 1].',
      ],
      wargearOptions: '''
Эта модель может быть экипирована одним из следующего:
- 1 combi-weapon
- 1 storm bolter
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 75),
      ],
      unitCompositionDescription: 'Эта модель оснащена: Smite; force weapon.',
      leader: [
        Keyword.terminatorAssaultSquad,
        Keyword.terminatorSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.psyker,
        Keyword.imperium,
        Keyword.terminator,
        Keyword.librarian,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_08',
      name: 'Techmarine',
      move: '6"',
      toughness: '4',
      save: '2+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        forgeBolter,
        gravPistol,
      ],
      meleeWeapons: [
        omnissianPowerAxe,
        servoArm,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Techmarine: Пока эта модель находится в пределах 3" от одного или нескольких дружественных ADEPTUS ASTARTES VEHICLE юнитов, эта модель имеет способность Lone Operative.',
        'Blessing of the Omnissiah: В вашу Command фазу вы можете выбрать одну дружественную ADEPTUS ASTARTES VEHICLE модель в пределах 3" от этой модели. Эта модель восстанавливает до D3 потерянных ран и до начала вашей следующей Command фазы каждый раз, когда эта Vehicle модель совершает атаку, добавьте 1 к броску на Попадание. Каждая модель может быть выбрана для этой способности только один раз за ход.',
        'Vengeance of the Omnissiah: Если дружественная ADEPTUS ASTARTES VEHICLE модель уничтожена в пределах 12" от этой модели, до конца битвы Omnissian power axe этой модели имеет характеристику Атак равную 7.',
      ],
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 55),
      ],
      unitCompositionDescription: 'Эта модель оснащена: forge bolter; grav-pistol; Omnissian power axe; servo-arm.',
      leader: [
        Keyword.assaultIntercessorSquad,
        Keyword.desolationSquad,
        Keyword.devastatorSquad,
        Keyword.intercessorSquad,
        Keyword.tacticalSquad,
      ],
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.techmarine,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_CHAR_01',
      name: 'Lieutenant with Combi-weapon',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '40mm',
      rangedWeapons: [
        combiWeapon.copyWithModifiedProfile(hit: '3+'),
      ],
      meleeWeapons: [
        pairedCombatBlades,
      ],
      coreAbilities: [
        CoreAbility.feelNoPain,
        CoreAbility.infiltrators,
        CoreAbility.loneOperative,
        CoreAbility.stealth,
      ],
      coreRuleDetails: {
        CoreAbility.feelNoPain: {
          'value': '5+',
        },
      },
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Priority Objective Identified: В начале первого боевого раунда, если ваша армия включает одну или более моделей с этой способностью, вы можете выбрать один objective marker на поле боя. До конца битвы, пока одна или более моделей с этой способностью находятся на поле боя, каждый раз, когда дружественная ADEPTUS ASTARTES модель совершает атаку, нацеленную на вражеский юнит, который находится в дальности действия этого objective marker, перебросьте бросок на Ранение равный 1.',
        'Evade and Survive: Один раз за ход, когда вражеский юнит заканчивает Normal, Advance или Fall Back движение в пределах 9" от этого юнита, если этот юнит не находится в Engagement Range от одного или нескольких вражеских юнитов, он может совершить Normal движение.',
      ],
      specialName: 'LAST SURVIVOR',
      specialText: 'Эта модель не может быть выбрана вашим Warlord.',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 70),
      ],
      unitCompositionDescription: 'Эта модель оснащена: combi-weapon; paired combat blades.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.phobos,
        Keyword.lieutenant,
        Keyword.lieutenantWithCombiWeapon,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    )

  ];
}