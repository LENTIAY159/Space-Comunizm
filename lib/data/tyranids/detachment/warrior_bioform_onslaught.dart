import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final warriorBioformOnslaught = Detachment(
  name: "Warrior Bioform Onslaught",
  additionalRules: [
    AdditionalRule(
      name: "Leader-beasts",
      description: "Отряды TYRANID WARRIORS и WINGED TYRANID PRIME из вашей армии имеют 5+ invulnerable save.\nОтряды TYRANID WARRIORS WITH RANGED BIO-WEAPONS и TYRANID WARRIORS WITH MELEE BIO-WEAPONS из вашей армии получают ключевые слова TYRANID WARRIORS и BATTLELINE, и пока такой отряд не находится в состоянии Battle-shocked, модели TYRANID WARRIORS в этом отряде имеют характеристику Objective Control, равную 3.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Synaptic Tyrant",
      description: "Только для модели Neurotyrant. На шаге Declare Battle Formations носитель может быть присоединён к отряду TYRANID WARRIORS.",
    ),
    Enhancement(
      name: "Ocular Adaptation",
      description: "Только для модели WINGED TYRANID PRIME. Каждый раз, когда модель в отряде носителя совершает атаку, добавляйте 1 к броску на попадание.",
    ),
    Enhancement(
      name: "Sensory Assimilation",
      description: "Только для модели WINGED TYRANID PRIME. Каждый раз, когда атака нацелена на отряд носителя, вычитайте 1 из броска на попадание.",
    ),
    Enhancement(
      name: "Elevated Might",
      description: "Только для модели TYRANIDS. Отряд носителя может объявить атаку в тот ход, в который он выполнил Advance.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "SYNAPTIC AMPLIFICATION",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight",
      target: "Один отряд TYRANIDS из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе",
      effect: "Если этот отряд — TYRANID WARRIORS, выберите до одного отряда ENDLESS MULTITUDE из вашей армии, который не находится в состоянии Battle-shocked, в пределах 6\" от него. До конца фазы каждый раз, когда модель в этих отрядах совершает атаку, перебрасывайте бросок на пробитие 1, а если это отряд TYRANID WARRIORS, перебрасывайте также бросок на попадание 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SPONTANEOUS HYPERCORROSION",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight",
      target: "Один отряд TYRANIDS из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе",
      effect: "До конца фазы добавляйте 2 к характеристике Strength дальнобойного оружия, которым оснащены модели в вашем отряде, и добавляйте 1 к характеристике Strength оружия ближнего боя, которым оснащены модели TYRANID WARRIORS и WINGED TYRANID PRIME в вашем отряде.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "RESTORATIVE IMPULSE",
      cpCost: 1,
      when: "Ваша фаза Command",
      target: "Один отряд TYRANID WARRIORS из вашей армии, находящийся ниже своей Starting Strength",
      effect: "Верните 1 уничтоженную модель (кроме моделей CHARACTER) в ваш отряд.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "SYNAPTIC MICRONODES",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд TYRANID WARRIORS из вашей армии",
      effect: "Выберите один маркер цели, который вы контролируете и в пределах досягаемости которого находится ваш отряд. Этот маркер остаётся под вашим контролем, пока уровень контроля вашего оппонента над этим маркером не превысит ваш в конце фазы.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "PARASITIC PAYLOAD",
      cpCost: 1,
      when: "Ваша фаза Shooting",
      target: "Один отряд TYRANID WARRIORS WITH RANGED BIO-WEAPONS из вашей армии, который ещё не был выбран для стрельбы в этой фазе",
      effect: "До конца фазы дальнобойное оружие, которым оснащены модели в вашем отряде, получает способность [IGNORES COVER]. После того как ваш отряд завершил все свои стрельбовые атаки в этой фазе, выберите один вражеский отряд, по которому была произведена одна или более атак. До конца хода модели в этом отряде не могут получать Benefit of Cover.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "SYNAPTIC SHIELD",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд TYRANID WARRIORS из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "Если этот отряд — TYRANID WARRIORS, выберите до одного отряда ENDLESS MULTITUDE из вашей армии, который не находится в состоянии Battle-shocked, в пределах 6\" от него. До конца фазы каждый раз, когда дальняя атака нацелена на один из этих отрядов, если характеристика Strength этой атаки больше, чем характеристика Toughness этого отряда, вычитайте 1 из броска на пробитие.",
      categories: [StratagemCategory.shooting],
    ),
  ],
);