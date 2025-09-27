import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final annihilationLegion = Detachment(
  name: "Annihilation Legion",
  additionalRules: [
    AdditionalRule(
      name: "Annihilation Protocol",
      description: "Каждый раз, когда DESTROYER CULT или FLAYED ONES юнит из вашей армии объявляет charge, вы можете перебросить бросок charge. Если одна или более целей этого charge находятся в состоянии Below Half-strength, добавьте 1 к броску charge. Каждый раз, когда DESTROYER CULT юнит из вашей армии совершает дальнюю атаку по ближайшей допустимой цели, улучшайте характеристику Armour Penetration этой атаки на 1.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Eternal Madness",
      description: "Только для NECRONS модели. В Fight фазе, каждый раз, когда модель в юните носителя уничтожается, если эта модель ещё не сражалась в этой фазе, бросьте один D6: при результате 4+ не удаляйте уничтоженную модель с поля боя; она может сражаться после того, как атакующий юнит завершит свои атаки, а затем будет удалена.",
    ),
    Enhancement(
      name: "Ingrained Superiority",
      description: "Только для NECRONS модели. Каждый раз, когда модель в юните носителя совершает атаку, при Critical Wound улучшайте характеристику Armour Penetration этой атаки на 1.",
    ),
    Enhancement(
      name: "Soulless Reaper",
      description: "Только для DESTROYER CULT модели. Каждый раз, когда вражеский юнит в Engagement Range с юнитом носителя выбирается для Fall Back, бросьте один D6: при результате 3+ этот юнит не может сделать Fall Back в этой фазе и должен Remain Stationary.",
    ),
    Enhancement(
      name: "Eldritch Nightmare",
      description: "Только для DESTROYER CULT модели. В начале Fight фазы каждый вражеский юнит в Engagement Range с носителем должен пройти Battle-shock тест.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "MASKS OF DEATH",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из броска на попадание.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "THE SPOOR OF FRAILTY",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту в состоянии Below Starting Strength, добавляйте 1 к броску на попадание. Если цель находится в состоянии Below Half-strength, добавляйте 1 к броску на ранение.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "MURDEROUS REANIMATION",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, который только что уничтожил вражеский юнит или довёл вражеский юнит, не находившийся в состоянии Below Half-strength, до состояния Below Half-strength.",
      effect: "Активация Reanimation Protocols для вашего юнита.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PITILESS HUNTERS",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните выполняет Pile-in или Consolidation, она может переместиться до 6\" вместо 3\".",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "BLOOD-FUELLED CRUELTY",
      cpCost: 1,
      when: "Movement фаза противника, сразу после того как вражеский юнит завершил Fall Back.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, который начал фазу в Engagement Range с этим вражеским юнитом.",
      effect: "Бросьте один D6: при результате 2-5 этот вражеский юнит получает D3 mortal wounds; при 6 — 3 mortal wounds. Затем ваш юнит может выполнить Normal move, но должен закончить перемещение как можно ближе к этому вражескому юниту.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "INSANITY'S IRE",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит произвёл стрельбу.",
      target: "Один DESTROYER CULT или FLAYED ONES юнит из вашей армии, в котором в результате атак атакующего юнита была уничтожена одна или более моделей.",
      effect: "Ваш юнит может выполнить Normal move, но должен закончить перемещение как можно ближе к этому вражескому юниту.",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
