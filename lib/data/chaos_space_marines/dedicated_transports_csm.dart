import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../chaos_space_marines/army_rule/army_rule_csm.dart';

List<Unit> getDedicatedTransportsCSM() {
  return [
    Unit(
      id: 'CSM_TRP_01',
      name: 'Chaos Rhino',
      move: '12"',
      toughness: '9',
      save: '3+',
      wounds: '10',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: 'Используйте модель',
      rangedWeapons: [
        combiBolter,
        combiWeapon,
        havocLauncher,
      ],
      meleeWeapons: [
        armouredTracks,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.firingDeck,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': 'D3'},
        CoreAbility.firingDeck: {'value': 2},
      },
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Self Repair: В начале вашей Command фазы эта модель восстанавливает 1 потерянную рану.',
      ],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 75),
      ],
      unitCompositionDescription: 'Эта модель экипирована: combi-bolter; armoured tracks.',
      keywords: [
        Keyword.vehicle,
        Keyword.transport,
        Keyword.dedicatedTransport,
        Keyword.smoke,
        Keyword.chaos,
        Keyword.rhino,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '''
- Эта модель может быть экипирована одним из следующего:
  - 1 combi-bolter
  - 1 combi-weapon
- Эта модель может быть экипирована 1 havoc launcher или может заменить 1 combi-bolter на 1 havoc launcher.
''',
      damaged: {},
      transport: 'Эта модель имеет транспортную вместимость 12 моделей HERETIC ASTARTES INFANTRY. Она не может перевозить модели TERMINATOR, JUMP PACK, OBLITERATOR или POSSESSED.',
      modelProfiles: [],
    )

  ];
}