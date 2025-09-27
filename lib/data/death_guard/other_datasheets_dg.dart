import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_dg.dart';

List<Unit> getOtherDatasheetsDG (){
  return[
    Unit(
      id: 'DG_TER_1',
      name: 'Blightlord Terminators',
      move: '5"',
      toughness: '7',
      save: '2+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        blightLauncher,
        combiBolter.copyWithModifiedProfile(specialRules: [WeaponAbility.blast, WeaponAbility.lethalHits],),
        combiWeapon,
        plagueSpewer,
        reaperAutocannon,
      ],
      meleeWeapons: [
        buboticBlade,
        closeCombatWeapon,
        flailOfCorruption,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Blistering Fusillade: Если этот юнит имеет Starting Strength 5 или больше, или если CHARACTER возглавляет этот юнит, то каждый раз, когда модель в этом юните совершает дальнюю атаку, нацеленную на юнит под воздействием Afflicted, улучшите характеристики Strength и Armour Penetration этой атаки на 1.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 115),
        UnitCompositionOption(id: '2', modelCount: 5, points: 185),
        UnitCompositionOption(id: '3', modelCount: 10, points: 370),
      ],
      unitCompositionDescription: '1 Blightlord Champion и 2-9 Blightlord Terminators. Каждая модель экипирована: combi-bolter; bubotic blade.',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.terminator,
        Keyword.blightlordTerminators,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '''
На каждые 5 моделей в этом юните combi-bolter до 3 моделей могут каждый быть заменены на 1 combi-weapon.
На каждые 5 моделей в этом юните combi-bolter и bubotic blade одного Blightlord Terminator могут быть заменены на 1 flail of corruption.
На каждые 5 моделей в этом юните combi-bolter одного Blightlord Terminator может быть заменен на 1 blight launcher.
На каждые 5 моделей в этом юните combi-bolter одного Blightlord Terminator может быть заменен на 1 reaper autocannon.
На каждые 5 моделей в этом юните combi-bolter одного Blightlord Terminator может быть заменен на 1 plague spewer.
Если этот юнит содержит только 3 модели, combi-bolter и bubotic blade одного Blightlord Terminator могут быть заменены на 1 plague spewer и 1 close combat weapon.
''',
      damaged: {},
    ),
    Unit(
      id: 'DG_TER_2',
      name: 'Deathshroud Terminators',
      move: '5"',
      toughness: '7',
      save: '2+',
      wounds: '4',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        plaguespurtGauntlet,
      ],
      meleeWeapons: [
        manreaper,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Silent Bodyguard: Пока модель CHARACTER возглавляет этот юнит, эта модель CHARACTER имеет способность Feel No Pain 4+.',
        'Death Approaches: В вашей Movement phase, когда этот юнит размещается на поле боя с использованием способности Deep Strike, он может быть размещен где угодно на поле боя на расстоянии более 6" по горизонтали от всех вражеских юнитов под воздействием Afflicted и более 9" по горизонтали от всех других вражеских юнитов.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 140),
        UnitCompositionOption(id: '2', modelCount: 6, points: 300),
      ],
      unitCompositionDescription: '1 Deathshroud Champion и 2-5 Deathshroud Terminators. Каждая модель экипирована: plaguespurt gauntlet; manreaper.',
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.terminator,
        Keyword.deathshroudTerminators,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: 'Icon of Despair (Aura): Пока вражеский юнит находится в пределах 6" от носителя, ухудшите характеристику Leadership моделей в этом юните на 1.',
      wargearOptions: '''
Deathshroud Champion может быть экипирован 1 дополнительным plaguespurt gauntlet.
Deathshroud Champion может быть экипирован 1 icon of despair.
''',
      damaged: {},
    ),
    Unit(
      id: 'DG_VHC_1',
      name: 'Helbrute',
      move: '7"',
      toughness: '9',
      save: '2+',
      wounds: '8',
      leadership: '6+',
      objectiveControl: '3',
      invulnerableSave: '',
      baseSize: '60mm',
      rangedWeapons: [
        combiBolter.copyWithModifiedProfile(
            specialRules: [WeaponAbility.rapidFire, WeaponAbility.lethalHits],
            specialRuleDetails: {WeaponAbility.rapidFire: {'value': '2'}}
        ),
        heavyFlamer,
        missileLauncher.copyWithModifiedProfile(hit: '3+',),
        multiMelta.copyWithModifiedProfile(hit: '3+',
            specialRules: [WeaponAbility.melta, WeaponAbility.lethalHits],
            specialRuleDetails: {WeaponAbility.melta: {'value': '2'}}
        ),
        plasmaCannon,
        twinAutocannon.copyWithModifiedProfile(attacks: '2', strength: '10', damage: '3',
          specialRules: [WeaponAbility.twinLinked, WeaponAbility.lethalHits],),
        twinHeavyBolter.copyWithModifiedProfile(attacks: '3', specialRules: [
          WeaponAbility.sustainedHits,
          WeaponAbility.twinLinked,
          WeaponAbility.lethalHits,
        ],
          specialRuleDetails: {
            WeaponAbility.sustainedHits: {'value': 1},
          },),
        twinLascannon,
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
      coreRuleDetails: {CoreAbility.deadlyDemise: {'value': '1'}},
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Diseased Malice: Каждый раз, когда эта модель совершает атаку, нацеленную на юнит под воздействием Afflicted, добавьте 1 к броску на Ранение.',
        'Froth-spattered Frenzy: Если эта модель экипирована двумя видами оружия ближнего боя в дополнение к своему close combat weapon, добавьте 2 к характеристике Attacks этих двух видов оружия.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 115),
      ],
      unitCompositionDescription: 'Эта модель экипирована: multi-melta; Helbrute fist; close combat weapon.',
      keywords: [
        Keyword.vehicle,
        Keyword.walker,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.helbrute,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '''
Multi-melta этой модели может быть заменен на один из следующих вариантов: 1 plasma cannon; 1 twin autocannon; 1 twin lascannon; 1 twin heavy bolter; 1 дополнительный Helbrute fist.
Один из Helbrute fist этой модели может быть заменен на 1 missile launcher.
Один из Helbrute fist этой модели может быть заменен на один из следующих вариантов: 1 Helbrute hammer; 1 power scourge.
За каждый Helbrute fist, которым экипирована эта модель, она может быть экипирована одним из следующих вариантов: 1 combi-bolter; 1 heavy flamer.
''',
      damaged: {},
    ),
  ];
}