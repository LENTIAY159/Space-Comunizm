// Файл: lib/data/ultramarines/characters_um.dart
import '../space_marines/army_rule/army_rule_sm.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';

List<Unit> getCharactersUM() {
  return [
    Unit(
      id: 'UM_CHAR_1',
      name: 'Roboute Guilliman',
      move: '8"',
      toughness: '9',
      save: '2+',
      wounds: '10',
      leadership: '5+',
      objectiveControl: '4',
      invulnerableSave: '4+',
      baseSize: '60mm',
      rangedWeapons: [
        handOfDominion1,
      ],
      meleeWeapons: [
        emperorsSword,
        handOfDominion2,
      ],
      coreAbilities: [],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Author of the Codex: В начале вашей фазы Command выберите две способности Author of the Codex (см. в Author of the Codex). До начала вашей следующей фазы Command эта модель имеет эти способности.',
        'Ultramarines Bodyguard: Пока эта модель находится в пределах 3" от одного или более дружественных отрядов ADEPTUS ASTARTES INFANTRY, она имеет способность Lone Operative.',
        'Armour of Fate: Когда эта модель впервые уничтожена, в конце фазы бросьте D6: при результате 3+ разместите эту модель обратно на поле боя как можно ближе к месту её уничтожения и не в Engagement Range с вражескими моделями, с 6 оставшимися ранами.',
      ],
      specialName: 'Author of the Codex',
      specialText: '''
          Primarch of the XIII (Aura): Пока дружественный отряд ADEPTUS ASTARTES находится в пределах 6" от этой модели, добавляйте 1 к характеристике Objective Control моделей в этом отряде, и вы можете перебрасывать тесты Battle-shock и Leadership, проводимые для этого отряда.
          Master of Battle: В начале вашей фазы Command, после выбора цели для Oath of Moment, выберите второй вражеский отряд. До начала вашей следующей фазы Command, если ваша цель Oath of Moment уничтожена, этот второй вражеский отряд становится новой целью Oath of Moment, пока вы не выберете другую.
          Supreme Strategist: Один раз за раунд битвы один отряд из вашей армии с этой способностью может использовать её, когда дружественный отряд ADEPTUS ASTARTES в пределах 12" от этой модели становится целью Stratagem. Если он это делает, уменьшите стоимость CP для применения этой Stratagem на 1 CP.
          ''',
      commander: ['SUPREME COMMANDER', true],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 320),
      ],
      unitCompositionDescription: 'This model is equipped with: Hand of Dominion; Emperor’s Sword.',
      keywords: [
        Keyword.monster,
        Keyword.character,
        Keyword.epicHero,
        Keyword.imperium,
        Keyword.primarch,
        Keyword.robouteGuilliman,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
        FactionKeyword.ultramarines,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    )

  ];
}