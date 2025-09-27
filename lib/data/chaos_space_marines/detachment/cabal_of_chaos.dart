import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final cabalOfChaos = Detachment(
  name: "Cabal of Chaos",
  additionalRules: [
    AdditionalRule(
      name: "Empyric Wellspring",
      description: "Каждый раз, когда юнит из вашей армии заключает Dark Pact, выберите одну из следующих способностей. Ваш юнит получает эту способность до конца фазы. Leaping Warpflame: пока этот юнит находится в пределах 9\" от одной или более дружественных HERETIC ASTARTES PSYKER моделей, улучшите характеристику Strength дальнобойного оружия, которым оснащены модели в этом юните, на 1. Monstrous Manifestation: пока этот юнит находится в пределах 9\" от одной или более дружественных HERETIC ASTARTES DAEMON PRINCE или HERETIC ASTARTES DAEMON PRINCE WITH WINGS моделей, улучшите характеристику Armour Penetration оружия ближнего боя, которым оснащены модели в этом юните, на 1.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Touched by the Warp",
      description: "Только для HERETIC ASTARTES модели (кроме KHORNE моделей). Носитель получает ключевое слово PSYKER.",
    ),
    Enhancement(
      name: "Eyes of Z'desh",
      description: "Только для HERETIC ASTARTES модели. Модели в юните носителя получают способность Scouts 6\".",
    ),
    Enhancement(
      name: "Mind Blade",
      description: "Только для PSYKER модели. Оружие ближнего боя, которым оснащены модели в юните носителя, получает способность [LANCE].",
    ),
    Enhancement(
      name: "Infernal Avatar",
      description: "Только для HERETIC ASTARTES DAEMON PRINCE или HERETIC ASTARTES DAEMON PRINCE WITH WINGS модели. Улучшите характеристику Strength оружия ближнего боя носителя на 2 и Armour Penetration этих оружий на 1.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "BALEFUL BLESSING",
      cpCost: 1,
      when: "Любая фаза, сразу после того как HERETIC ASTARTES юнит из вашей армии получил mortal wound.",
      target: "Этот HERETIC ASTARTES юнит.",
      effect: "До конца фазы модели в вашем юните получают способность Feel No Pain 5+ против mortal wounds.",
      restrictions: null,
      categories: [StratagemCategory.command, StratagemCategory.move, StratagemCategory.shooting, StratagemCategory.charge, StratagemCategory.fight],
    ),
    Stratagem(
      name: "NO REST IN DEATH",
      cpCost: 1,
      when: "Ваша Movement phase.",
      target: "Один HERETIC ASTARTES юнит из вашей армии в пределах 9\" от HERETIC ASTARTES PSYKER, HERETIC ASTARTES DAEMON PRINCE или HERETIC ASTARTES DAEMON PRINCE WITH WINGS юнита из вашей армии.",
      effect: "Одна модель в вашем юните восстанавливает до D3+1 потерянных ран. Если у вашего юнита есть ключевое слово BATTLELINE, вы можете вместо этого вернуть до D3 уничтоженных моделей (кроме CHARACTER моделей) в ваш юнит с полным количеством ран.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "MUTATION'S CURSE",
      cpCost: 1,
      when: "Ваша Shooting phase.",
      target: "Один HERETIC ASTARTES PSYKER юнит из вашей армии.",
      effect: "Выберите один видимый вражеский юнит в пределах 12\" от вашего юнита. Бросьте один D6: при результате 1 этот вражеский юнит получает 1 mortal wound; при 2-4 — D3 mortal wounds; при 5-6 — 2D3 mortal wounds.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "SOULSEEKERS",
      cpCost: 1,
      when: "Ваша Shooting phase.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы дальнобойное оружие, которым оснащены модели в вашем юните, получает способность [IGNORES COVER].",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "UNHOLY HASTE",
      cpCost: 1,
      when: "Ваша Charge phase.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, который ещё не был выбран для charge в этой фазе.",
      effect: "До конца фазы ваш юнит может объявить charge в тот ход, в который он сделал Advance.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "SHROUD OF CHAOS",
      cpCost: 1,
      when: "Начало Shooting phase вашего противника.",
      target: "Один HERETIC ASTARTES PSYKER, HERETIC ASTARTES DAEMON PRINCE или HERETIC ASTARTES DAEMON PRINCE WITH WINGS юнит из вашей армии.",
      effect: "До конца фазы ваш юнит получает следующую способность: Shroud of Chaos (Аура): модели дружественных HERETIC ASTARTES юнитов в пределах 6\" от этого юнита получают способность Stealth.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
  restrictions: [],
);
