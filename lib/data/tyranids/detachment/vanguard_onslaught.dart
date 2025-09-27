import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final vanguardOnslaught = Detachment(
  name: "Vanguard Onslaught",
  additionalRules: [
    AdditionalRule(
      name: "Questing Tendrils",
      description: "Отряды TYRANIDS с этой способностью могут объявлять атаку в ход, в который они выполнили Fall Back. Отряды VANGUARD INVADER с этой способностью могут объявлять атаку в ход, в который они выполнили Advance.",
    ),
    AdditionalRule(
      name: "Vanguard Prime",
      description: "DEATHLEAPER теряет правило Hunter Organism и может быть вашим WARLORD.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Hunting Grounds",
      description: "Только для модели TYRANIDS. Пока носитель находится на поле боя, каждый раз, когда ваш оппонент размещает отряд из Reserves на поле боя, бросьте D6: при результате 2+ этот отряд должен пройти тест Battle-shock.",
    ),
    Enhancement(
      name: "Chameleonic",
      description: "Только для модели VANGUARD INVADER. Носитель получает способность Stealth, и каждый раз, когда дальняя атака нацелена на отряд носителя, модели в этом отряде получают Benefit of Cover против этой атаки.",
    ),
    Enhancement(
      name: "Stalker",
      description: "Только для модели VANGUARD INVADER. В начале сражения выберите один вражеский отряд. Каждый раз, когда носитель совершает атаку, нацеленную на этот отряд, добавляйте 1 к броску на попадание и 1 к броску на пробитие.",
    ),
    Enhancement(
      name: "Neuronode",
      description: "Только для модели TYRANIDS. После того как обе армии расставлены, выберите до трёх отрядов VANGUARD INVADER из вашей армии и передислоцируйте их. При этом вы можете поместить эти отряды в Strategic Reserves, независимо от того, сколько отрядов уже находится в Strategic Reserves.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "SURPRISE ASSAULT",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight, сразу после того как отряд VANGUARD INVADER из вашей армии выбрал цели",
      target: "Этот отряд VANGUARD INVADER",
      effect: "Выберите один вражеский отряд, который был выбран целью одной или нескольких атак вашего отряда. Этот вражеский отряд должен пройти тест Battle-shock. До конца фазы каждый раз, когда модель в вашем отряде совершает атаку по этому вражескому отряду, добавляйте 1 к броску на попадание. Если тест Battle-shock был провален, также добавляйте 1 к броску на пробитие.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "ASSASSIN BEASTS",
      cpCost: 1,
      when: "Фаза Fight",
      target: "Один отряд VANGUARD INVADER INFANTRY из вашей армии, который ещё не был выбран для боя в этой фазе",
      effect: "До конца фазы оружие ближнего боя, которым оснащены модели в вашем отряде, получает способность [PRECISION].",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "SEEDED BROODS",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд TYRANIDS из вашей армии, находящийся в Reserves, или до двух отрядов VANGUARD INVADER из вашей армии, находящихся в Reserves",
      effect: "До конца фазы, для целей размещения выбранных отрядов на поле боя, считайте, что текущий номер раунда битвы на один выше, чем он есть на самом деле.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "HYPERSENSORY SCILLIA",
      cpCost: 2,
      when: "Фаза Movement вашего оппонента, сразу после того как вражеский отряд завершил Normal, Advance или Fall Back перемещение",
      target: "До двух отрядов VANGUARD INVADER из вашей армии в пределах 9\" от этого вражеского отряда, или один другой отряд TYRANIDS INFANTRY из вашей армии в пределах 9\" от этого вражеского отряда",
      effect: "Каждый из выбранных отрядов может совершить Normal move до 6\".",
      restrictions: "Вы не можете выбрать отряды, находящиеся в Engagement Range одного или нескольких вражеских отрядов",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "UNSEEN LURKERS",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд VANGUARD INVADER из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "До конца фазы ваш отряд может быть выбран целью дальнобойной атаки только в том случае, если атакующая модель находится в пределах 18\", или, если ваш отряд имеет способность Lone Operative, в пределах 6\". Ваш оппонент может выбрать новые цели для атак атакующего отряда.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "INVISIBLE HUNTER",
      cpCost: 1,
      when: "Конец фазы Fight вашего оппонента",
      target: "До двух отрядов VANGUARD INVADER из вашей армии или один отряд TYRANIDS INFANTRY из вашей армии",
      effect: "Уберите выбранные отряды с поля боя и поместите их в Strategic Reserves.",
      restrictions: "Выбранные отряды должны находиться более чем в 3\" от всех вражеских отрядов",
      categories: [StratagemCategory.fight],
    ),
  ],
);
