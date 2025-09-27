import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_dg.dart';

List<Unit> getCharactersDG() {
  return [
    Unit(
      id: 'DG_CHAR_1',
      name: 'Lord of Virulence',
      move: '5"',
      toughness: '7',
      save: '2+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '50mm',
      rangedWeapons: [
        twinPlagueSpewer,
      ],
      meleeWeapons: [
        powerFist,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Virulent Aura: Пока эта модель возглавляет юнит, каждый раз, когда модель в этом юните совершает дальнюю атаку, вы можете перебросить бросок на Ранение.',
        'Blight Bombardment: В начале вашей Shooting phase выберите один вражеский юнит в пределах 30" от этой модели и видимый ей. До конца фазы каждый раз, когда дружественная модель DEATH GUARD совершает дальнюю атаку, нацеленную на этот юнит, перебросьте результат попадания 1 (если эта атака совершается оружием с Blast, вы можете вместо этого перебросить бросок на Попадание).',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [
        Keyword.blightlordTerminators,
        Keyword.deathshroudTerminators,
      ],
      leaderDescription: 'Эта модель может быть прикреплена к следующим юнитам: Blightlord Terminators, Deathshroud Terminators.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 90),
      ],
      unitCompositionDescription: 'Эта модель экипирована: twin plague spewer; power fist.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.terminator,
        Keyword.lordOfVirulence,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'DG_CHAR_2',
      name: 'Malignant Plaguecaster',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        boltPistol.copyWithModifiedProfile(specialRules: [WeaponAbility.lethalHits]),
        plagueWind,
      ],
      meleeWeapons: [
        corruptedStaff,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Gift of Contagion (Psychic): Пока эта модель возглавляет юнит, каждый раз, когда модель в этом юните совершает атаку, нацеленную на юнит под воздействием Afflicted, эта атака получает способность [Sustained Hits 1].',
        'Pestilent Fallout (Psychic): В вашей Shooting phase, после того как эта модель выстрелила, выберите один вражеский INFANTRY юнит, пораженный одной или несколькими атаками с её Plague Wind. До конца следующего хода вашего противника этот юнит ослаблен. Пока юнит ослаблен, вычтите 2" из характеристики Move моделей в этом юните.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [
        Keyword.plagueMarines,
        Keyword.poxwalkers,
      ],
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 60),
      ],
      unitCompositionDescription: 'Эта модель экипирована: bolt pistol; Plague Wind; corrupted staff.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.psyker,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.malignantPlaguecaster,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'DG_CHAR_3',
      name: 'Tallyman',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '40mm',
      rangedWeapons: [
        plasmaPistol,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '4', ),
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Malicious Calculations: Пока эта модель возглавляет юнит, каждый раз, когда модель в этом юните совершает атаку, вы можете игнорировать любые или все модификаторы к характеристикам Ballistic Skill или Weapon Skill этой атаки и/или любые или все модификаторы к броску на Попадание.',
        'Sevenfold Chant: В вашей Command phase, если эта модель находится на поле боя, бросьте 2D6: при 7+, вы получаете 1CP.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [
        Keyword.plagueMarines,
      ],
      leaderDescription: 'Вы можете прикрепить эту модель к юниту PLAGUE MARINES, даже если к нему уже прикреплен один другой Leader юнит (вы не можете прикрепить более одного одинакового лидера к одному юниту). Если вы это сделаете, и этот Bodyguard юнит будет уничтожен, прикрепленные к нему Leader юниты становятся отдельными юнитами со своей изначальной Starting Strength.',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 40),
      ],
      unitCompositionDescription: 'Эта модель экипирована: plasma pistol; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.tallyman,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'DG_CHAR_4',
      name: 'Typhus',
      move: '5"',
      toughness: '7',
      save: '2+',
      wounds: '6',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '50mm',
      rangedWeapons: [],
      meleeWeapons: [
        lakrimae,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'The Destroyer Hive: Пока эта модель возглавляет юнит, каждый раз, когда ближняя атака нацелена на этот юнит, вычтите 1 из броска на Попадание.',
        'Eater Plague (Psychic): В вашей Shooting phase вы можете выбрать один вражеский юнит в пределах 18" от этого PSYKER и видимый ему (исключая юниты с способностью Lone Operative, которые не являются частью Attached юнита и находятся не в пределах 12" от этого PSYKER) и бросить один D6: при 1, юнит этого PSYKER получает D3 смертельных ран; при 2-5, этот вражеский юнит получает D6 смертельных ран; при 6, этот вражеский юнит получает D3+3 смертельных ран.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.blightlordTerminators,
        Keyword.deathshroudTerminators,
        Keyword.poxwalkers,
      ],
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 90),
      ],
      unitCompositionDescription: '1 Typhus — EPIC HERO\n Эта модель экипирована: Lakrimae.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.psyker,
        Keyword.epicHero,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.terminator,
        Keyword.typhus,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
  ];
}