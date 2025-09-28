import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_sm.dart';

List<Unit> getOtherDatasheetsSM() {
  return [
    Unit(
      id: 'SM_OTH_01',
      name: 'Aggressor Squad',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        autoBoltstormGauntlets,
        flamestormGauntlets,
        fragstormGrenadeLauncher,
      ],
      meleeWeapons: [
        twinPowerFists,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Close-quarters Firepower: Каждый раз, когда модель в этом отряде совершает дальнобойную атаку, нацеленную на ближайшую подходящую цель, улучшите характеристику Armour Penetration этой атаки на 1.',
      ],
      wargearOptions: '''
Все модели в этом отряде могут заменить свои flamestorm gauntlets на 1 auto boltstorm gauntlets и 1 fragstorm grenade launcher.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 100),
        UnitCompositionOption(id: '2', modelCount: 6, points: 200),
      ],
      unitCompositionDescription: '1 Aggressor Sergeant, 2–5 Aggressors. Каждая модель экипирована: flamestorm gauntlets; twin power fist.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.imperium,
        Keyword.gravis,
        Keyword.aggressorSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_OTH_02',
      name: 'Ballistus Dreadnought',
      move: '8"',
      toughness: '10',
      save: '2+',
      wounds: '12',
      leadership: '6+',
      objectiveControl: '4',
      invulnerableSave: null,
      rangedWeapons: [
        ballistusMissileLauncher,
        ballistusLascannon,
        twinStormBolter,
      ],
      meleeWeapons: [
        armouredFeet,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: { 'value': 'D3' },
      },
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Ballistus Strike: Каждый раз, когда эта модель совершает дальнобойную атаку, нацеленную на отряд, который не Below Half-strength, вы можете перебросить бросок на попадание.',
      ],
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 150),
      ],
      unitCompositionDescription: 'Эта модель экипирована: Ballistus missile launcher; Ballistus lascannon; twin storm bolter; armoured feet.',
      leader: [],
      keywords: [
        Keyword.vehicle,
        Keyword.walker,
        Keyword.imperium,
        Keyword.dreadnought,
        Keyword.ballistusDreadnought,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {
        '1-4': 'Пока у этой модели остается 1–4 раны, каждый раз, когда эта модель совершает атаку, вычтите 1 из броска на попадание.',
      },
    ),
    Unit(
      id: 'SM_OTH_3',
      name: 'Eradicator Squad',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        meltaRifle,
        multiMelta,
      ],
      meleeWeapons: [
        closeCombatWeapon,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Total Obliteration: Каждый раз, когда дальнобойная атака, совершенная моделью в этом отряде, нацелена на модель MONSTER или VEHICLE, вы можете перебросить бросок на попадание, вы можете перебросить бросок на ранение и вы можете перебросить бросок урона.',
      ],
      wargearOptions: '''
За каждые 3 модели в этом отряде, 1 Eradicator может заменить melta rifle на 1 multi-melta.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 100),
        UnitCompositionOption(id: '2', modelCount: 6, points: 200),
      ],
      unitCompositionDescription: '1 Eradicator Sergeant, 2–5 Eradicators. Каждая модель экипирована: bolt pistol; melta rifle; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.gravis,
        Keyword.eradicatorSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_OTH_4',
      name: 'Inceptor Squad',
      move: '10"',
      toughness: '6',
      save: '3+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        assaultBolters,
        plasmaExterminators,
      ],
      meleeWeapons: [
        closeCombatWeapon,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Meteoric Descent: В вашей Movement фазе, когда этот отряд размещается на поле боя, используя способность Deep Strike, он может совершить meteoric descent. Если да, этот отряд может быть размещен в любом месте поля боя, находящемся более чем в 6" по горизонтали от всех вражеских отрядов, но до конца хода он не имеет права объявить атаку.',
      ],
      wargearOptions: '''
Все модели в этом отряде могут заменить свои assault bolters на 1 plasma exterminators.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 120),
        UnitCompositionOption(id: '2', modelCount: 6, points: 240),
      ],
      unitCompositionDescription: '1 Inceptor Sergeant, 2–5 Inceptors. Каждая модель экипирована: assault bolters; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.jumpPack,
        Keyword.fly,
        Keyword.imperium,
        Keyword.gravis,
        Keyword.inceptorSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_OTH_5',
      name: 'Infernus Squad',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        pyreblaster,
      ],
      meleeWeapons: [
        closeCombatWeapon,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Incendiary Terror: В вашей Shooting фазе, после того как этот отряд выстрелил, вы можете выбрать один вражеский отряд INFANTRY, попавший под одну или более из этих атак, совершенных с помощью pyreblaster. Этот вражеский отряд должен пройти тест Battle-shock, вычтя 1 из этого теста.',
      ],
      wargearOptions: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 90),
        UnitCompositionOption(id: '2', modelCount: 10, points: 180),
      ],
      unitCompositionDescription: '1 Infernus Sergeant, 4–9 Infernus Marines. Каждая модель экипирована: bolt pistol; pyreblaster; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.infernusSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_OTH_06',
      name: 'Redemptor Dreadnought',
      move: '8"',
      toughness: '10',
      save: '2+',
      wounds: '12',
      leadership: '6+',
      objectiveControl: '4',
      invulnerableSave: null,
      rangedWeapons: [
        heavyFlamer,
        heavyOnslaughtGatlingCannon,
        icarusRocketPod,
        macroPlasmaIncinerator,
        onslaughtGatlingCannon,
        twinFragstormGrenadeLauncher,
        twinStormBolter,
      ],
      meleeWeapons: [
        redemptorFist,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': 'D3'},
      },
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Duty Eternal: Каждый раз, когда атака распределяется на эту модель, вычтите 1 из характеристики Damage этой атаки.',
      ],
      wargearOptions: '''
Эта модель может быть экипирована 1 Icarus rocket pod.
Heavy flamer этой модели может быть заменен на 1 onslaught gatling cannon.
Heavy onslaught gatling cannon этой модели может быть заменен на 1 macro plasma incinerator.
Twin fragstorm grenade launcher этой модели может быть заменен на 1 twin storm bolter.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 195),
      ],
      unitCompositionDescription: 'Эта модель экипирована: Twin fragstorm grenade launcher; heavy flamer; heavy onslaught gatling cannon; Redemptor fist.',
      leader: [],
      keywords: [
        Keyword.vehicle,
        Keyword.walker,
        Keyword.imperium,
        Keyword.dreadnought,
        Keyword.redemptorDreadnought,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {
        '1-4': 'Пока у этой модели остается 1–4 раны, каждый раз, когда эта модель совершает атаку, вычтите 1 из броска на попадание.',
      },
    ),
    Unit(
      id: 'SM_BTL_07',
      name: 'Scout Squad',
      move: '6"',
      toughness: '4',
      save: '4+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        boltgun,
        astartesShotgun,
        heavyBolter,
        missileLauncher,
        scoutSniperRifle,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '2+'),
        astartesChainsword.copyWithModifiedProfile(attacks: '4+'),
        combatKnife,
      ],
      coreAbilities: [
        CoreAbility.infiltrators,
        CoreAbility.scouts,
      ],
      coreRuleDetails: {
        CoreAbility.scouts: {'value': '6"'},
      },
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Guerrilla Tactics: В конце хода вашего противника, если этот отряд находится более чем в 6" от всех вражеских моделей, вы можете убрать этот отряд с поля боя и поместить его в Strategic Reserves.',
      ],
      wargearOptions: '''
Boltgun Scout Sergeant может быть заменен на 1 Astartes chainsword.
Любое количество моделей могут заменить свой boltgun на одно из следующего:
  • 1 Astartes shotgun
  • 1 combat knife
За каждые 5 моделей в этом отряде, boltgun 1 Scout может быть заменен на 1 Scout sniper rifle.
За каждые 5 моделей в этом отряде, boltgun 1 Scout может быть заменен на одно из следующего:
  • 1 heavy bolter
  • 1 missile launcher
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 70),
        UnitCompositionOption(id: '2', modelCount: 10, points: 140),
      ],
      unitCompositionDescription: '1 Scout Sergeant, 4–9 Scouts. Каждая модель экипирована: bolt pistol; boltgun; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.grenades,
        Keyword.smoke,
        Keyword.imperium,
        Keyword.scoutSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_BTL_08',
      name: 'Sternguard Veteran Squad',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        sternguardBoltPistol,
        sternguardBoltRifle,
        pyrecannon,
        combiWeapon.copyWithModifiedProfile(hit: '4+'),
        sternguardHeavyBolter,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '4+'),
        powerFist.copyWithModifiedProfile(attacks: '4'),
        astartesChainsword.copyWithModifiedProfile(attacks: '6+'),
      ],
      coreAbilities: [],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Sternguard Focus: Каждый раз, когда модель в этом отряде совершает атаку, нацеленную на вашу цель Oath of Moment, вы можете перебросить бросок на ранение.',
      ],
      wargearOptions: '''
Sternguard bolt rifle Sternguard Veteran Sergeant может быть заменен на одно из следующего:
  • 1 Astartes chainsword
  • 1 combi-weapon
  • 1 power weapon
  • 1 power fist
  • 1 Astartes chainsword и 1 Sternguard bolt rifle*
  • 1 power weapon и 1 Sternguard bolt rifle*
  • 1 power fist и 1 Sternguard bolt rifle*
*Sternguard bolt rifle этой модели не может быть заменен.

Любое количество Sternguard Veterans могут заменить свой Sternguard bolt rifle на 1 combi-weapon.

За каждые 5 моделей в этом отряде, Sternguard bolt rifle 1 Sternguard Veteran может быть заменен на одно из следующего:
  • 1 pyrecannon
  • 1 Sternguard heavy bolter
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 100),
        UnitCompositionOption(id: '2', modelCount: 10, points: 200),
      ],
      unitCompositionDescription: '1 Sternguard Veteran Sergeant, 4–9 Sternguard Veterans. Каждая модель экипирована: Sternguard bolt pistol; Sternguard bolt rifle; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.sternGuardVeteranSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
    Unit(
      id: 'SM_ELI_09',
      name: 'Terminator Squad',
      move: '5"',
      toughness: '5',
      save: '2+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        stormBolter,
        heavyFlamer,
        cycloneMissileLauncher,
        assaultCannon,
      ],
      meleeWeapons: [
        powerFist,
        chainfist,
        powerWeapon,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Teleport Homer: В начале битвы вы можете установить один маркер Teleport Homer для этого отряда в любом месте поля боя, не находящемся в зоне развертывания вашего противника. Если вы это сделали, один раз за битву вы можете применить к этому отряду стратагему Rapid Ingress за 0CP, но при разрешении этой стратагемы вы должны установить этот отряд в пределах 3" от этого маркера и не ближе 9" от любых вражеских моделей. После этого маркер убирается.',
        'Fury of the First: Каждый раз, когда модель в этом отряде совершает атаку, нацеленную на вашу цель Oath of Moment, добавьте 1 к броску на попадание.',
      ],
      wargearOptions: '''
За каждые 5 моделей в этом отряде, storm bolter 1 Terminator может быть заменен на одно из следующего:
  • 1 assault cannon
  • 1 heavy flamer
  • 1 cyclone missile launcher и 1 storm bolter.*

Любое количество моделей могут заменить свой power fist на 1 chainfist.

Power fist Terminator Sergeant может быть заменен на 1 power weapon.

*Storm bolter этой модели не может быть заменен.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 170),
        UnitCompositionOption(id: '2', modelCount: 10, points: 340),
      ],
      unitCompositionDescription: '1 Terminator Sergeant, 4–9 Terminators. Каждая модель экипирована: storm bolter; power fist.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.imperium,
        Keyword.terminator,
        Keyword.terminatorSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),

  ];
}