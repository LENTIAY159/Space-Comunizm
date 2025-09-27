import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final renegadeRaiders = Detachment(
  name: "Renegade Raiders",
  additionalRules: [
    AdditionalRule(
      name: "Raiders and Reavers",
      description: "Дальнобойное оружие, которым оснащены HERETIC ASTARTES модели из вашей армии, получает способность [ASSAULT], и каждый раз, когда HERETIC ASTARTES модель из вашей армии совершает атаку по юниту в пределах досягаемости маркера цели, улучшайте характеристику Armour Penetration этой атаки на 1.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Despot's Claim",
      description: "Только для HERETIC ASTARTES модели. В начале вашей Command фазы, если носитель находится на поле боя, бросьте один D6, добавив 1 к результату, если носитель полностью находится в пределах 12\" от зоны развёртывания противника: при результате 5+ вы получаете 1CP.",
    ),
    Enhancement(
      name: "Dread Reaver",
      description: "Только для HERETIC ASTARTES модели. Каждый раз, когда носитель совершает атаку в ближнем бою, если он полностью находится в пределах 12\" от зоны развёртывания противника, вы можете перебросить бросок на попадание и бросок на ранение.",
    ),
    Enhancement(
      name: "Mark of the Hound",
      description: "Только для HERETIC ASTARTES модели. Модели в юните носителя получают способность Scouts 6\".",
    ),
    Enhancement(
      name: "Tyrant's Lash",
      description: "Только для HERETIC ASTARTES модели. Вы можете перебросить броски Advance для юнита носителя, и этот юнит может стрелять в ход, когда он сделал Fall Back.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "UNFAILINGLY OBDURATE",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии (кроме DAMNED юнитов), выбранный как цель одной или более атак атакующего юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SCOUR AND SEIZE",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту в пределах досягаемости маркера цели, эта атака получает способность [PRECISION].",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "OPPORTUNISTIC RAIDERS",
      cpCost: 1,
      when: "Конец Fight фазы",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который был допущен к бою в этой фазе.",
      effect: "Если ваш юнит не находится в Engagement Range с одним или более вражескими юнитами, он может выполнить Normal move на расстояние до 6\", или до 12\", если это MOUNTED юнит. В противном случае ваш юнит может выполнить Fall Back. Он не может погрузиться в TRANSPORT в конце этого движения, если в этом ходу он высадился из TRANSPORT.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "WARPCHARGED ENGINES",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один HERETIC ASTARTES TRANSPORT или HERETIC ASTARTES MOUNTED юнит из вашей армии, который ещё не был выбран для перемещения в этой фазе.",
      effect: "До конца фазы, если ваш юнит выполняет Advance, не бросайте куб для Advance. Вместо этого до конца фазы добавляйте 6\" к характеристике Move моделей в вашем юните.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "RUINOUS RAID",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который высадился из TRANSPORT в этом ходу и ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, если цель этой атаки находится в пределах досягаемости маркера цели, вы можете перебросить бросок на попадание и бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "REAVERS' HASTE",
      cpCost: 1,
      when: "Ваша Charge фаза.",
      target: "Один HERETIC ASTARTES INFANTRY или HERETIC ASTARTES MOUNTED юнит из вашей армии.",
      effect: "До конца фазы ваш юнит может объявлять charge в ход, когда он сделал Advance. Если целью charge является один или более юнитов в пределах досягаемости маркера цели, добавляйте 1 к броску charge.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
);
