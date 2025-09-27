import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final canoptekCourt = Detachment(
  name: "Canoptek Court",
  additionalRules: [
    AdditionalRule(
      name: "Power Matrix",
      description: "Ваша зона развёртывания всегда находится в пределах Power Matrix вашей армии. В начале любой фазы, если вы контролируете не менее половины маркеров целей в No Man's Land, до конца этой фазы No Man's Land находится в пределах Power Matrix вашей армии. В начале любой фазы, если вы контролируете не менее половины маркеров целей в зоне развёртывания противника, до конца этой фазы зона развёртывания противника находится в пределах Power Matrix вашей армии. Каждый раз, когда модель в CRYPTEK или CANOPTEK юните из вашей армии совершает атаку, перебрасывайте броски на попадание 1. Если такой юнит полностью находится в пределах Power Matrix вашей армии, можно перебросить весь бросок на попадание вместо этого.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Dimensional Sanctum",
      description: "Только для CRYPTEK модели. Модели в юните носителя получают способность Infiltrators.",
    ),
    Enhancement(
      name: "Hyperphasic Fulcrum",
      description: "Только для CRYPTEK модели. Пока носитель возглавляет юнит и этот юнит полностью находится в пределах Power Matrix вашей армии, каждый раз, когда модель в этом юните совершает атаку, перебрасывайте броски на ранение 1.",
    ),
    Enhancement(
      name: "Autodivinator",
      description: "Только для CRYPTEK модели. Каждый раз, когда ваш противник получает CP в результате способности, бросайте один D6: при 2+ вы также получаете 1CP.",
    ),
    Enhancement(
      name: "Metalodermal Tesla Weave",
      description: "Только для CRYPTEK модели. Один раз за фазу, когда вражеский юнит выбирает юнит носителя целью charge, бросайте один D6: при 2-5 этот вражеский юнит получает D3 mortal wounds; при 6 — 3 mortal wounds.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "CURSE OF THE CRYPTEK",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит произвёл стрельбу или бой.",
      target: "Одна CRYPTEK модель из вашей армии, уничтоженная в результате атаки атакующего юнита.",
      effect: "До конца сражения каждый раз, когда дружественная CANOPTEK модель совершает атаку по атакующему юниту, добавляйте 1 к броску на попадание и 1 к броску на ранение.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "CYNOSURE OF ERADICATION",
      cpCost: 2,
      when: "Начало вашей Shooting фазы или начало Fight фазы.",
      target: "Один CRYPTEK или CANOPTEK юнит из вашей армии, полностью находящийся в пределах Power Matrix вашей армии.",
      effect: "До конца фазы оружие, которым оснащены модели CRYPTEK или CANOPTEK в вашем юните, получает способность [DEVASTATING WOUNDS].",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SOLAR PULSE",
      cpCost: 1,
      when: "Начало вашей Shooting фазы.",
      target: "Одна CRYPTEK модель из вашей армии.",
      effect: "Выберите один маркер цели в пределах 18\" от вашей CRYPTEK модели. До конца фазы оружие дружественных NECRONS моделей получает способность [IGNORES COVER], если цель находится в пределах досягаемости этого маркера.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "REACTIVE SUBROUTINES",
      cpCost: 1,
      when: "Movement фаза противника, сразу после того как вражеский юнит завершил Normal, Advance или Fall Back перемещение.",
      target: "Один CANOPTEK юнит из вашей армии в пределах 9\" от этого вражеского юнита.",
      effect: "Ваш юнит может выполнить Normal move на расстояние до 6\".",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "COUNTERTEMPORAL SHIFT",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит выбрал цели.",
      target: "Один CANOPTEK юнит из вашей армии, выбранный целью одной или более атак этого юнита.",
      effect: "До конца фазы ваш юнит может быть выбран целью дальних атак только если атакующая модель находится в пределах 18\".",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "SUBOPTIMAL FACADE",
      cpCost: 1,
      when: "Charge фаза противника, сразу после того как вражеский юнит объявил charge.",
      target: "Один CANOPTEK юнит из вашей армии, выбранный целью этого charge и полностью находящийся в пределах Power Matrix вашей армии.",
      effect: "Активируйте Reanimation Protocols вашего юнита.",
      categories: [StratagemCategory.charge],
    ),
  ],
);
