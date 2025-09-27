import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';




final anvilSiegeForce = Detachment(
  name: "Anvil Siege Force",
  additionalRules: [
    AdditionalRule(
      name: "Shield of the Imperium",
      description: "Дальнобойное оружие, которым оснащены ADEPTUS ASTARTES модели из вашей армии, получает способность [HEAVY]. Если такое оружие уже обладает этой способностью, каждый раз при атаке им, если юнит атакующей модели оставался неподвижным в этот ход, добавляйте 1 к броску на Wound.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Indomitable Fury",
      description: "Только для GRAVIS модели. Первый раз, когда носитель уничтожается, в конце фазы бросьте один D6: при результате 2+ верните носителя на поле боя как можно ближе к месту его уничтожения, но не в Engagement Range с вражескими юнитами, с полным запасом ран.",
    ),
    Enhancement(
      name: "Fleet Commander",
      description: "Только для CAPTAIN модели. Один раз за битву, в начале вашей Shooting фазы, выберите точку на поле боя и поместите там маркер. В начале следующей вашей Shooting фазы разместите второй маркер в пределах 12\" от центра первого, затем проведите прямую линию между их центрами. За каждый юнит, через который проходит линия, бросьте D6: при результате 3+ этот юнит получает D3 mortal wounds. После этого оба маркера удаляются.",
    ),
    Enhancement(
      name: "Stoic Defender",
      description: "Только для ADEPTUS ASTARTES модели. Пока носитель возглавляет юнит, модели в нём имеют способность Feel No Pain 6+, если они находятся в пределах контролируемого вами маркера цели, а если этот юнит находится в состоянии Battle-shock, половина характеристики Objective Control моделей в нём применяется вместо её обнуления.",
    ),
    Enhancement(
      name: "Architect of War",
      description: "Только для ADEPTUS ASTARTES модели. Пока носитель возглавляет юнит, дальнобойное оружие моделей в нём получает способность [IGNORES COVER].",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный как цель одной или более атак вражеского юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит все свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "RIGID DISCIPLINE",
      cpCost: 1,
      when: "Конец Fight фазы.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, находящийся в Engagement Range с одним или более вражескими юнитами.",
      effect: "Ваш юнит может сразу выполнить Fall Back до 6\".",
      restrictions: "При выполнении этого движения ваш юнит должен закончить его либо полностью в вашей зоне развёртывания, либо в пределах досягаемости маркера цели.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "NOT ONE BACKWARDS STEP",
      cpCost: 1,
      when: "Ваша Command фаза.",
      target: "Один ADEPTUS ASTARTES INFANTRY юнит из вашей армии в пределах досягаемости маркера цели.",
      effect: "До конца хода удвойте характеристику Objective Control моделей в этом юните, но он должен остаться неподвижным в этот ход.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "NO THREAT TOO GREAT",
      cpCost: 2,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, не выбранный для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает дальнюю атаку по MONSTER или VEHICLE юниту, вы можете перебросить бросок на Wound.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "BATTLE DRILL RECALL",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, не выбранный для стрельбы в этой фазе.",
      effect: "До конца фазы дальнобойное оружие моделей в вашем юните получает способность [SUSTAINED HITS 1]. Если ваш юнит оставался неподвижным в этот ход, то до конца фазы каждый раз, когда модель в вашем юните совершает дальнюю атаку, неизменённый результат Hit roll 5+ считается Critical Hit.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "HAIL OF VENGEANCE",
      cpCost: 2,
      when: "Shooting фаза противника, сразу после того как вражеский юнит завершил свои атаки.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, у которого одна или более моделей были уничтожены в результате атак этого вражеского юнита.",
      effect: "Ваш юнит может стрелять так, как если бы это была ваша Shooting фаза, но при этом он должен целиться только в этот вражеский юнит и только если он является допустимой целью.",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
