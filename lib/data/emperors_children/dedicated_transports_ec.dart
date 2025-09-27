import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_ec.dart';


List<Unit> getDedicatedTransportsEC(){
  return[
  Unit(
      id: 'EC_TRP_01',
      name: 'Chaos Rhino',
      move: '12',
      toughness: '9',
      save: '3+',
      wounds: '10',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
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
        CoreAbility.firingDeck: {'value': '2'},
      },
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Assault Vehicle: Отряды могут высадиться из этого TRANSPORT после того, как он совершил Advanced. Отряды, которые делают это, считаются совершившими Normal move в эту фазу, и не могут объявить charge в том же ходу, но могут действовать нормально в остальном.',
      ],
      wargearOptions: '''
Эта модель может быть оснащена одним из следующего:
  • 1 combi-bolter
  • 1 combi-weapon
Эта модель может быть оснащена 1 havoc launcher или может заменить 1 combi-bolter на 1 havoc launcher.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 80),
      ],
      unitCompositionDescription: 'Эта модель вооружена: combi-bolter; armoured tracks.',
      leader: [],
      keywords: [
        Keyword.vehicle,
        Keyword.transport,
        Keyword.dedicatedTransport,
        Keyword.smoke,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.rhino,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      transport: 'Эта модель имеет транспортную вместимость 12 моделей EMPERORS CHILDREN INFANTRY (исключая модели TERMINATOR и FLAWLESS BLADE).',
  damaged: {},
  )

  ];
}