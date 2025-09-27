import '../space_marines/army_rule/army_rule_sm.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';

List<Unit> getCharactersDA() {
  return [
    Unit(
        id: 'DA_CHAR_1',
        name: 'Lion ElʼJonson',
        move: '8"',
        toughness: '9',
        save: '2+',
        wounds: '10',
        leadership: '5+',
        objectiveControl: '4',
        invulnerableSave: '3+',
        baseSize: '60mm',
        rangedWeapons: [
          armaLuminis,
        ],
        meleeWeapons: [
          fealty
        ],
        coreAbilities: [
          CoreAbility.deepStrike,
          CoreAbility.fightsFirst,
        ],
        factionAbilities: [
          oathOfMoment,
        ],
        abilities: [
        'Primarch of the First Legion: В вашу Command фазу выберите одну способность Primarch of the First Legion. До начала вашей следующей Command фазы эта модель имеет эту способность.',
        'The Emperorʼs Shield: Каждый раз, когда атака назначается этой модели, если характеристика Strength этой атаки больше характеристики Toughness этой модели, вычтите 1 из броска на ранение.',
    'Dark Angels Bodyguard: Пока эта модель находится в пределах 3" от одного или более дружественных отрядов ADEPTUS ASTARTES INFANTRY, эта модель имеет способность Lone Operative.',
    ],
    specialName: 'Primarch of the First Legion',
    specialText: '''
        Mist-wreathed Shadow Realms: В вашу Command фазу, если этот отряд не находится в пределах Engagement Range от одного или более вражеских отрядов, вы можете убрать его с поля боя и поместить в Strategic Reserves.
        Martial Exemplar (Аура): Пока дружественный отряд ADEPTUS ASTARTES находится в пределах 6" от этой модели, каждый раз, когда модель в этом отряду совершает атаку в ближнем бою, перебросьте бросок на попадание 1 и перебросьте бросок на ранение 1.
        No Hiding From the Watchers (Аура): Пока дружественный отряд ADEPTUS ASTARTES находится в пределах 6" от этой модели, модели в этом отряду имеют способность Feel No Pain 4+ против смертельных ран.
      ''',
      commander: ['SUPREME COMMANDER', true],
      leader: [],
    leaderDescription: '',
    unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 315),
  ],
  unitCompositionDescription: 'Эта модель экипирована: Arma Luminis; Fealty.',
  keywords: [
  Keyword.monster,
  Keyword.character,
  Keyword.epicHero,
  Keyword.imperium,
  Keyword.primarch,
  Keyword.lionElJonson,
  ],
  factionKeywords: [
  FactionKeyword.adeptusAstartes,
  FactionKeyword.darkAngels,
  ],
  wargearAbilities: '',
  wargearOptions: '',
  damaged: {},
  )

  ];
}