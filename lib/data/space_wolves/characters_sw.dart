import '../space_marines/army_rule/army_rule_sm.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';


List<Unit> getCharactersSW() {
  return [
    Unit(
      id: 'SW_CHAR_1',
      name: 'Bjorn the Fell-Handed',
      move: '9"',
      toughness: '9',
      save: '2+',
      wounds: '8',
      leadership: '6+',
      objectiveControl: '3',
      invulnerableSave: '5+',
      baseSize: '60mm',
      rangedWeapons: [
        assaultCannon.copyWithModifiedProfile(hit: '2+'),
        heavyFlamer,
        helfrostCannon,
        multiMelta.copyWithModifiedProfile(hit: '2+'),
      ],
      meleeWeapons: [
        trueclaw,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.feelNoPain,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': '1'},
        CoreAbility.feelNoPain: {'value': '5+'},
      },
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Legendary Tenacity: Каждый раз, когда атака нацеливается на эту модель, если характеристика Strength этой атаки больше характеристики Toughness этой модели, вычтите 1 из броска на ранение.',
        'Ancient Tactician: В начале вашей Command фазы, если эта модель находится на поле боя, вы получаете 1CP.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 170),
      ],
      unitCompositionDescription: 'Эта модель экипирована: assault cannon; heavy flamer; Trueclaw.',
      keywords: [
        Keyword.vehicle,
        Keyword.walker,
        Keyword.character,
        Keyword.epicHero,
        Keyword.smoke,
        Keyword.imperium,
        Keyword.dreadnought,
        Keyword.bjornTheFellHanded,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
        FactionKeyword.spaceWolves,
      ],
      wargearAbilities: '',
      wargearOptions: 'Assault cannon этой модели может быть заменен одним из следующего:\n- 1 Helfrost cannon\n- 1 Multi-melta',
      damaged: {},
    ),

  ];
}