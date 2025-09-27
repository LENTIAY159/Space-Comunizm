import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final stormlanceTaskForce = Detachment(
  name: "Stormlance Task Force",
  additionalRules: [
    AdditionalRule(
    name: "Lightning Assault",
    description: "ADEPTUS ASTARTES юниты из вашей армии могут объявлять charge в ход, в котором они сделали Advance или Fell Back.",
),
],
  enhancements: [
    Enhancement(
      name: "Fury of the Storm",
      description: "Только для ADEPTUS ASTARTES MOUNTED моделей. Улучшите характеристики Strength и Armour Penetration ближнего оружия носителя на 1. Каждый раз, когда носитель завершает Charge move, до конца хода улучшите Strength и Armour Penetration его ближнего оружия на 2.",
    ),
    Enhancement(
      name: "Portents of Wisdom",
      description: "Только для ADEPTUS ASTARTES моделей. Пока носитель возглавляет юнит, вы можете перебрасывать Advance rolls, сделанные для этого юнита.",
    ),
    Enhancement(
      name: "Feinting Withdrawal",
      description: "Только для ADEPTUS ASTARTES моделей. Пока носитель возглавляет юнит, этот юнит может стрелять в ходу, в котором он Fell Back.",
    ),
    Enhancement(
      name: "Hunter’s Instincts",
      description: "Только для ADEPTUS ASTARTES MOUNTED моделей. Если юнит носителя находится в Strategic Reserves, при выставлении этого юнита на поле боя считайте номер текущего раунда на единицу выше фактического.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того, как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До завершения всех атак вражеского юнита каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "BLITZING FUSILLADE",
      cpCost: 1,
      when: "Your Shooting phase",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ещё не стрелял в этой фазе.",
      effect: "До конца фазы дальнобойное оружие моделей в вашем юните получает способность [ASSAULT]. Если такое оружие уже обладает этой способностью, до конца фазы оно также получает способность [SUSTAINED HITS 1].",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "FULL THROTTLE",
      cpCost: 2,
      when: "Your Movement phase",
      target: "Один ADEPTUS ASTARTES MOUNTED или ADEPTUS ASTARTES VEHICLE юнит (кроме WALKERS) из вашей армии.",
      effect: "До конца фазы, если ваш юнит Advances, не бросайте кубик для Advance. Вместо этого до конца фазы добавьте 6\" к характеристике Move моделей в вашем юните, или 9\" вместо этого, если ваш юнит является MOUNTED.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "SHOCK ASSAULT",
      cpCost: 1,
      when: "Your Charge phase",
      target: "Один ADEPTUS ASTARTES MOUNTED юнит из вашей армии, который не объявлял charge в этой фазе.",
      effect: "До конца хода вы можете перебрасывать Charge rolls, сделанные для вашего юнита, а ближнее оружие моделей в этом юните получает способность [LANCE].",
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "RIDE HARD, RIDE FAST",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того, как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES MOUNTED или ADEPTUS ASTARTES FLY VEHICLE юнит из вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из броска на Hit и вычитайте 1 из броска на Wound.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "WIND-SWIFT EVASION",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того, как вражеский юнит завершил Normal, Advance или Fall Back move.",
      target: "Один ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED юнит из вашей армии, находящийся в пределах 9\" от этого вражеского юнита.",
      effect: "Ваш юнит может выполнить Normal move до 6\".",
      restrictions: "Нельзя выбрать юнит, находящийся в Engagement Range с одним или несколькими вражескими юнитами.",
      categories: [StratagemCategory.move],
    ),
  ],
);


