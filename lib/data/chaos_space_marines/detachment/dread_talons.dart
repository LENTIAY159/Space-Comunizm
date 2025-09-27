import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final dreadTalons = Detachment(
  name: "Dread Talons",
  additionalRules: [
    AdditionalRule(
      name: "Terror Descends (Aura)",
      description: "На шаге Battle-shock Command фазы вашего противника, если вражеский юнит, находящийся в состоянии Below Starting Strength, находится в пределах 12\" от одного или более HERETIC ASTARTES юнитов из вашей армии, этот вражеский юнит должен пройти Battle-shock тест. Каждый раз, когда вражеский юнит в пределах 12\" от одного или более HERETIC ASTARTES юнитов из вашей армии проходит Battle-shock тест, вычитайте 1 из результата. Вражеские юниты, на которые действует это правило Detachment, не обязаны проходить другие Battle-shock тесты в той же фазе.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Eater of Dread",
      description: "Только для HERETIC ASTARTES модели. В начале вашей Command фазы, если носитель находится на поле боя, бросьте один D6, добавив 1 к результату за каждый вражеский юнит в состоянии Battle-shock, находящийся на поле боя: при результате 5+ вы получаете 1CP.",
    ),
    Enhancement(
      name: "Night's Shroud",
      description: "Только для CHAOS LORD модели (кроме TERMINATOR моделей). Модели в юните носителя получают способность Stealth.",
    ),
    Enhancement(
      name: "Warp-fuelled Thrusters",
      description: "Только для JUMP PACK CHAOS LORD модели. В конце хода вашего противника, если юнит носителя не находится в Engagement Range с одним или более вражескими юнитами, вы можете убрать юнит носителя с поля боя и поместить его в Strategic Reserves.",
    ),
    Enhancement(
      name: "Willbreaker",
      description: "Только для HERETIC ASTARTES модели. В Fight фазе, после того как носитель выполнил свои атаки, выберите один вражеский юнит, по которому была нанесена одна или более атак. Этот юнит должен пройти Battle-shock тест.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "DEPTHLESS CRUELTY",
      cpCost: 1,
      when: "Fight фаза",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту, находящемуся в состоянии Battle-shock и/или Below Half-strength, улучшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "BLOODY EXAMPLE",
      cpCost: 1,
      when: "Fight фаза, сразу после того как HERETIC ASTARTES юнит из вашей армии уничтожил CHARACTER юнит.",
      target: "Этот HERETIC ASTARTES юнит.",
      effect: "Каждый вражеский юнит в пределах 12\" и в зоне видимости вашего юнита должен пройти Battle-shock тест.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PITILESS HUNTERS",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту, находящемуся в состоянии Battle-shock и/или Below Half-strength, вы можете перебросить бросок на попадание и бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "RELENTLESS TERROR",
      cpCost: 1,
      when: "Ваша Movement фаза, сразу после того как HERETIC ASTARTES INFANTRY юнит из вашей армии выполнил Fall Back.",
      target: "Этот HERETIC ASTARTES INFANTRY юнит.",
      effect: "До конца хода ваш юнит может объявлять charge в тот же ход, в который он сделал Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "SCREAMING DESCENT",
      cpCost: 1,
      when: "Шаг Reinforcements вашей Movement фазы, начиная со второго раунда.",
      target: "Один HERETIC ASTARTES JUMP PACK юнит из вашей армии, находящийся в Reserves.",
      effect: "Разместите ваш юнит в любом месте поля боя на расстоянии более 6\" по горизонтали от всех вражеских юнитов, но до конца хода он не может объявлять charge. Затем выберите один вражеский INFANTRY или MOUNTED юнит в пределах 9\" и в зоне видимости вашего юнита: этот юнит должен пройти Battle-shock тест.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "MERCILESS PURSUIT",
      cpCost: 1,
      when: "Конец Movement фазы вашего противника.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, который не находится в Engagement Range с одним или более вражескими юнитами.",
      effect: "Выберите один вражеский юнит, который сделал Fall Back в этом ходу и находится в пределах 6\" от вашего юнита. Ваш юнит может объявить charge, как если бы это была ваша Charge фаза. При этом вы можете выбрать целью только этот вражеский юнит (и только если он является допустимой целью). Даже если charge успешен, ваш юнит не получает бонуса Charge в этом ходу.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [],
);
