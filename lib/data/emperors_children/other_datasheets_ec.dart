import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_ec.dart';


List<Unit> getOtherDatasheetsEC(){
  return[
    Unit(
      id: 'EC_ELI_01',
      name: 'Chaos Terminators',
      move: '6',
      toughness: '5',
      save: '2+',
      wounds: '3',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      rangedWeapons: [
        combiBolter,
        combiWeapon,
        heavyFlamer,
        reaperAutocannon,
      ],
      meleeWeapons: [
        accursedWeapon,
        pairedAccursedWeapons,
        chainfist,
        powerFist,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Lethal Obsession: В вашу Shooting phase каждый раз когда этот отряд выбран для стрельбы, если он совершает одну или более дальних атак и все эти атаки нацелены на один и тот же вражеский отряд, до конца хода каждый раз когда этот отряд объявляет charge, если этот вражеский отряд является целью этого charge, вы можете переброситьброс Charge roll.',
      ],
      wargearOptions: '''
Combi-bolter 1 Chaos Terminator может быть заменён одним из следующего:
  • 1 heavy flamer
  • 1 reaper autocannon
Любое количество моделей может заменить свой combi-bolter на 1 combi-weapon.
Combi-bolter и accursed weapon 1 модели могут быть заменены на 1 paired accursed weapons.
До 3 моделей могут заменить своё accursed weapon на 1 power fist.
Accursed weapon 1 модели может быть заменено на 1 chainfist.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 170),
      ],
      unitCompositionDescription: '1 Terminator Champion, 4 Chaos Terminators. Каждая модель вооружена: combi-bolter; accursed weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.terminator,
        Keyword.terminatorSquad,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
    Unit(
      id: 'EC_ELI_02',
      name: 'Noise Marines',
      move: '6',
      toughness: '5',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '1',
      invulnerableSave: null,
      rangedWeapons: [
        blastmaster,
        screamerPistol,
        sonicBlaster,
      ],
      meleeWeapons: [
        closeCombatWeapon,
        powerSword,
      ],
      coreAbilities: [],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Terrifying Crescendo: В вашу Shooting phase после того как этот отряд выстрелил, выберите один вражеский отряд, поражённый одной или более из этих атак. До начала вашей следующей фазы Shooting phase каждый раз когда для этого вражеского отряда проходится тест Battle-shock или Leadership, вычтите 1 из этого теста.',
      ],
      wargearOptions: '''
Sonic blaster Disharmonist может быть заменён 1 screamer pistol и 1 power sword.
До 2 Noise Marines могут заменить свой sonic blaster на 1 blastmaster.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 6, points: 145),
      ],
      unitCompositionDescription: '1 Disharmonist, 5 Noise Marines. Каждая модель вооружена: sonic blaster; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.noiseMarines,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
  ];
}