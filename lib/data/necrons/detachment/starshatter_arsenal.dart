import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final starshatterArsenal = Detachment(
  name: "Starshatter Arsenal",
  additionalRules: [
    AdditionalRule(
      name: "Relentless Onslaught",
      description: "Каждый раз, когда NECRONS модель из вашей армии совершает атаку по юниту в пределах досягаемости одного или более маркеров цели, добавляйте 1 к броску на попадание. Кроме того, дальнобойное оружие, которым оснащены NECRONS VEHICLE и NECRONS MOUNTED модели (кроме TITANIC моделей) из вашей армии, получает способность [ASSAULT].",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Dread Majesty (Aura)",
      description: "Только для OVERLORD или CATACOMB COMMAND BARGE модели. Пока дружественный NECRONS юнит (кроме TITANIC юнитов) находится в пределах 6\" от носителя, каждый раз, когда модель в этом юните совершает атаку, перебрасывайте бросок на попадание 1 и бросок на ранение 1.",
    ),
    Enhancement(
      name: "Miniaturised Nebuloscope",
      description: "Только для NECRONS модели. Дальнобойное оружие, которым оснащены модели в юните носителя, получает способность [IGNORES COVER].",
    ),
    Enhancement(
      name: "Demanding Leader",
      description: "Только для NECRONS модели. В вашу Command фазу выберите один дружественный NECRONS VEHICLE или NECRONS MOUNTED юнит (кроме TITANIC юнитов) в пределах 6\" от носителя. До начала вашей следующей Command фазы этот юнит может стрелять в ход, когда он сделал Fall Back.",
    ),
    Enhancement(
      name: "Chrono-impedance Fields",
      description: "Только для NECRONS модели. В вашу Command фазу выберите один дружественный NECRONS VEHICLE или NECRONS MOUNTED юнит (кроме TITANIC юнитов) в пределах 6\" от носителя. До начала вашей следующей Command фазы каждый раз, когда атака распределяется на модель в этом юните, вычитайте 1 из характеристики Damage этой атаки.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "MERCILESS RECLAMATION",
      cpCost: 2,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один NECRONS юнит (кроме TITANIC юнитов) из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, если цель этой атаки находится в пределах досягаемости одного или более маркеров цели, добавляйте 1 к броску на ранение.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "UNYIELDING FORMS",
      cpCost: 2,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал цели.",
      target: "Один NECRONS VEHICLE или NECRONS MOUNTED юнит (кроме TITANIC юнитов) из вашей армии, выбранный целью одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на модель в вашем юните, если характеристика Strength этой атаки больше, чем характеристика Toughness вашего юнита, вычитайте 1 из броска на ранение.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "CHRONOSHIFT",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один NECRONS VEHICLE или NECRONS MOUNTED юнит (кроме TITANIC юнитов) из вашей армии, который ещё не был выбран для перемещения в этой фазе.",
      effect: "До конца фазы, если ваш юнит выполняет Advance, не бросайте кубик для Advance. Вместо этого добавьте 6\" к характеристике Move моделей в вашем юните.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "DIMENSIONAL TUNNEL",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один NECRONS VEHICLE или NECRONS MOUNTED юнит (кроме TITANIC юнитов) из вашей армии.",
      effect: "До конца фазы модели в вашем юните могут перемещаться по горизонтали сквозь модели и элементы ландшафта.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "ENDLESS SERVITUDE",
      cpCost: 1,
      when: "Конец вашей Fight фазы.",
      target: "Один NECRONS юнит (кроме TITANIC юнитов) из вашей армии, находящийся в пределах досягаемости одного или более маркеров цели, которые вы контролируете.",
      effect: "Активируйте Reanimation Protocols вашего юнита.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "REACTIVE REPOSITION",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того как вражеский юнит произвёл стрельбу.",
      target: "Один NECRONS юнит (кроме TITANIC юнитов) из вашей армии, выбранный целью одной или более атак атакующего юнита.",
      effect: "Ваш юнит может выполнить Normal move на расстояние до D6\".",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
