import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final obeisancePhalanx = Detachment(
  name: "Obeisance Phalanx",
  additionalRules: [
    AdditionalRule(
      name: "Worthy Foes",
      description: "В вашу Command фазу выберите один вражеский юнит. До начала вашей следующей Command фазы каждый раз, когда NOBLE, LYCHGUARD или TRIARCH юнит из вашей армии совершает атаку, нацеленную на этот юнит, добавляйте 1 к броску на ранение.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Honourable Combatant",
      description: "Только для OVERLORD модели. Каждый раз, когда юнит носителя уничтожает вражеский CHARACTER юнит, ваш противник теряет 1CP, если у него они есть.",
    ),
    Enhancement(
      name: "Unflinching Will",
      description: "Только для OVERLORD модели. Оружие ближнего боя носителя получает способности [PRECISION] и [ANTI-INFANTRY 5+].",
    ),
    Enhancement(
      name: "Warrior Noble",
      description: "Только для OVERLORD модели. Каждый раз, когда атака в ближнем бою нацелена на юнит носителя, вычитайте 1 из броска на попадание.",
    ),
    Enhancement(
      name: "Eternal Conqueror",
      description: "Только для OVERLORD модели. Каждый раз, когда модель в юните носителя совершает атаку по вражескому юниту в пределах досягаемости маркера цели, вы можете перебросить бросок на попадание.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "YOUR TIME IS NIGH",
      cpCost: 1,
      when: "Любая фаза, сразу после того как WARLORD противника был уничтожен.",
      target: "Ваш NECRONS WARLORD.",
      effect: "До конца сражения каждый раз, когда вражеский юнит проходит Battle-shock или Leadership тест, вычитайте 1 из результата.",
      categories: StratagemCategory.values,
    ),
    Stratagem(
      name: "ENSLAVED ARTIFICE",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один NECRONS юнит из вашей армии (кроме TITANIC), который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, неизменённый бросок на попадание 5+ считается Critical Hit.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "NANOASSEMBLY PROTOCOLS",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один NECRONS VEHICLE юнит из вашей армии, выбранный целью одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака распределяется на модель в вашем юните, вычитайте 1 из характеристики Damage этой атаки.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SENTINELS OF ETERNITY",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один LYCHGUARD или TRIARCH PRAETORIANS юнит из вашей армии, выбранный целью одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните уничтожается, если она ещё не сражалась в этой фазе, бросьте один D6: при 4+ модель не удаляется с поля боя, может сражаться после того, как атакующий юнит завершит свои атаки, а затем будет удалена.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "SUFFER NO RIVAL",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один LYCHGUARD или TRIARCH юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы оружие ближнего боя моделей в вашем юните получает способность [PRECISION].",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "TERRITORIAL OBSESSION",
      cpCost: 1,
      when: "Ваша Command фаза.",
      target: "Один LYCHGUARD или TRIARCH юнит из вашей армии.",
      effect: "До начала вашей следующей Command фазы добавляйте 1 к характеристике Objective Control моделей в вашем юните. Если ваш юнит имеет ключевое слово VEHICLE, вместо этого добавляйте 3.",
      categories: [StratagemCategory.command],
    ),
  ],
);
