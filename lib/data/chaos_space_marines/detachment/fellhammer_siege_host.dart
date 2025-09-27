import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final fellhammerSiegeHost = Detachment(
  name: "Fellhammer Siege-host",
  additionalRules: [
    AdditionalRule(
      name: "Iron Fortitude",
      description: "Каждый раз, когда дальняя атака нацелена на HERETIC ASTARTES юнит из вашей армии (кроме DAMNED юнитов), если характеристика Strength этой атаки больше, чем характеристика Toughness этого юнита, вычитайте 1 из броска на ранение.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Bastion Plate",
      description: "Только для CHAOS LORD модели (кроме JUMP PACK моделей). Один раз за раунд сражения, когда спасбросок юнита носителя провален, вы можете изменить характеристику Damage этой атаки на 0.",
    ),
    Enhancement(
      name: "Iron Artifice",
      description: "Только для HERETIC ASTARTES INFANTRY модели. Оружие носителя получает способности [ANTI-VEHICLE 4+] и [ANTI-FORTIFICATION 4+].",
    ),
    Enhancement(
      name: "Ironbound Enmity",
      description: "Только для HERETIC ASTARTES модели. Каждый раз, когда носитель совершает атаку, находясь в пределах досягаемости маркера цели, добавляйте 1 к броску на ранение.",
    ),
    Enhancement(
      name: "Warp Tracer",
      description: "Только для HERETIC ASTARTES модели. В вашей Shooting phase, после того как носитель произвел стрельбу, выберите один вражеский юнит, поражённый одной или более этими атаками. До конца фазы этот вражеский юнит не может получать Benefit of Cover.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "PERSISTENT ASSAILANTS",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, выбранный как цель одной или более атак в этой фазе и ещё не выбранный для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, вы можете перебросить бросок на попадание, а если ваш юнит находится в состоянии Below Half-strength, также перебросить бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "BRUTAL ATTRITION",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии (кроме DAMNED юнитов), выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда по вашему юниту распределяется атака в ближнем бою, после того как атакующий юнит завершил свои атаки, бросьте один D6 (максимум шесть D6 на атакующий юнит): за каждый результат 4+ атакующий юнит получает 1 mortal wound.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PITILESS CANNONADE",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту, находящемуся в состоянии Below Half-strength, успешный неизменённый бросок на попадание 5+ считается Critical Hit.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "POINT-BLANK DESTRUCTION",
      cpCost: 1,
      when: "Ваша Shooting фаза",
      target: "Один HERETIC ASTARTES юнит из вашей армии, находящийся в Engagement Range с одним или более вражескими юнитами и ещё не выбранный для стрельбы в этой фазе.",
      effect: "До конца фазы дальнобойное оружие вашего юнита (кроме Blast оружия) получает способность [PISTOL].",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "STEADFAST DETERMINATION",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии (кроме DAMNED юнитов), выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы модели в вашем юните получают способность Feel No Pain 5+.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "SIEGECRAFT",
      cpCost: 1,
      when: "Начало Charge фазы вашего противника.",
      target: "Один HERETIC ASTARTES юнит из вашей армии.",
      effect: "До конца фазы каждый раз, когда вражеский юнит выбирает ваш юнит целью для charge, вычитайте 2 из броска charge (это не суммируется с другими отрицательными модификаторами к этому броску).",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [],
);
