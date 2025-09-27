import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final wrathOfTheRock = Detachment(
  name: "Wrath of the Rock",
  additionalRules: [
    AdditionalRule(
      name: "Dutiful Tenacity",
      description: "Каждый раз, когда атака нацелена на ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED юнит из вашей армии, если характеристика Strength этой атаки больше, чем характеристика Toughness этого юнита, вычитайте 1 из броска на ранение.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Tempered in Battle (Aura)",
      description: "Только для ADEPTUS ASTARTES модели. Пока дружественный ADEPTUS ASTARTES юнит находится в пределах 6\" от этой модели, вы можете перебрасывать Battle-shock и Leadership тесты для этого юнита.",
    ),
    Enhancement(
      name: "Ancient Weapons",
      description: "Только для ADEPTUS ASTARTES модели. Улучшите характеристику Strength оружия ближнего боя, которым оснащён носитель, на 2, а также улучшите Armour Penetration и Damage этих оружий на 1.",
    ),
    Enhancement(
      name: "Deathwing Assault",
      description: "Только для DEATHWING модели со способностью Deep Strike. Юнит носителя может быть выставлен с использованием способности Deep Strike на шаге Reinforcements вашей первой, второй или третьей Movement фазы, независимо от правил миссии.",
    ),
    Enhancement(
      name: "Lord of the Ravenwing",
      description: "Только для RAVENWING модели. Вы можете перебросить броски Advance и Charge, сделанные для юнита носителя.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Inescapable Justice",
      cpCost: 2,
      when: "Любая фаза, сразу после того как ваша цель Oath of Moment уничтожена.",
      target: "Один ADEPTUS ASTARTES CHARACTER юнит, находящийся на поле боя.",
      effect: "Выберите один вражеский юнит в пределах 12\" и в зоне видимости вашего юнита. Этот вражеский юнит становится вашей целью Oath of Moment до начала вашей следующей Command фазы.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Lion’s Will",
      cpCost: 1,
      when: "Command фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, находящийся в Engagement Range с одним или более вражескими юнитами.",
      effect: "До начала вашей следующей Command фазы добавьте 1 к характеристике Objective Control моделей в вашем юните. Кроме того, до конца хода, если ваш юнит не имеет ключевых слов DEATHWING, RAVENWING или VEHICLE, каждый раз, когда модель в этом юните совершает атаку, добавляйте 1 к броску на попадание.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Armour of Contempt",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Tactical Mastery",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии.",
      effect: "Ваш юнит может стрелять и объявлять charge в тот ход, в который он сделал Advance. Если ваш юнит имеет ключевое слово RAVENWING, он также может стрелять и объявлять charge в ход, когда сделал Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "Relics of the Dark Age",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы добавляйте 2 к характеристике Strength дальнобойного оружия, которым оснащены модели в вашем юните.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Leonine Aggression",
      cpCost: 1,
      when: "Конец Charge фазы вашего противника.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии в пределах 3\" от одного или более вражеских юнитов, или один DEATHWING юнит из вашей армии в пределах 6\" от одного или более вражеских юнитов.",
      effect: "Ваш юнит объявляет charge, целью которого могут быть только один или более этих вражеских юнитов, и выполняет этот charge.",
      restrictions: "Даже если этот charge успешен, ваш юнит не получает бонуса Charge в этом ходу.",
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [],
);

