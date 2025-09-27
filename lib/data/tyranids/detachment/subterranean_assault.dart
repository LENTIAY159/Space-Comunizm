import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final subterraneanAssault = Detachment(
  name: "Subterranean Assault",
  additionalRules: [
    AdditionalRule(
      name: "Surprise Assault",
      description: "Каждый раз, когда модель TYRANIDS из вашей армии совершает атаку, перебрасывайте броски на попадание с результатом 1.\nКаждый раз, когда отряд BURROWER из вашей армии размещается на поле боя из Reserves, разместите круглый маркер Tunnel диаметром 40 мм в любой точке поля боя в пределах 1\" от этого отряда и более чем в 3\" по горизонтали от всех вражеских отрядов.\nНа шаге Reinforcements вашей фазы Movement, когда вы размещаете отряд на поле боя из Reserves, вы можете разместить этот отряд полностью в пределах 9\" от одного из ваших Tunnel Markers и более чем в 6\" по горизонтали от любых вражеских отрядов.\nЕсли вражеская модель (кроме AIRCRAFT) завершает любое перемещение в пределах 3\" от одного из ваших Tunnel Markers, этот маркер удаляется с поля боя.\nОтряды MAWLOC и TRYGON из вашей армии получают ключевое слово BURROWER.\nНа шаге Muster Armies вы можете выбрать до 2 моделей TRYGON из вашей армии. Выбранные отряды получают ключевое слово CHARACTER.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Synaptic Strategy",
      description: "Только для модели TYRANIDS. Один раз за битву вы можете выбрать отряд носителя целью Stratagem Rapid Ingress за 0CP и можете сделать это, даже если уже выбрали другой отряд целью этой Stratagem в этой фазе.",
    ),
    Enhancement(
      name: "Tremor Senses",
      description: "Только для модели TYRANIDS. После того как обе армии расставлены, выберите до трёх дружественных отрядов TYRANIDS из вашей армии и передислоцируйте их. При этом вы можете поместить эти отряды в Strategic Reserves, независимо от того, сколько отрядов уже находится в Strategic Reserves.",
    ),
    Enhancement(
      name: "Vanguard Intellect",
      description: "Только для модели TYRANIDS с способностью Deep Strike. Отряд носителя может быть размещён с использованием способности Deep Strike на шаге Reinforcements вашей первой, второй или третьей фазы Movement, независимо от правил миссии.",
    ),
    Enhancement(
      name: "Trygon Prime",
      description: "Только для модели TRYGON. Носитель получает ключевое слово SYNAPSE. Улучшите характеристики Strength и Weapon Skill оружия ближнего боя, которым оснащён носитель, на 1.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ADAPTIVE OPTIMISATION",
      cpCost: 1,
      when: "Фаза Command",
      target: "Один отряд MAWLOC или TRYGON из вашей армии",
      effect: "До начала вашей следующей фазы Command ваш отряд получает ключевое слово SYNAPSE.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "REPLENISHING SWARMS",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд TYRANIDS из вашей армии, полностью в пределах 9\" от одного или более ваших Tunnel Markers",
      effect: "Одна модель в вашем отряде восстанавливает до D3+1 потерянных Wounds или, вместо этого, вы можете вернуть до D3+1 уничтоженных моделей с характеристикой Wounds 1 в ваш отряд с полным количеством Wounds.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "ENFILADING EMERGENCE",
      cpCost: 1,
      when: "Конец вашей фазы Movement",
      target: "Один отряд TYRANIDS из вашей армии, который был размещён как Reinforcements в этом ходу",
      effect: "До конца вашей следующей фазы Fight оружие, которым оснащены модели в вашем отряде, получает способности [SUSTAINED HITS 1] и [IGNORES COVER].",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "TUNNEL NETWORK",
      cpCost: 1,
      when: "Конец вашей фазы Movement",
      target: "Один отряд TYRANIDS из вашей армии, полностью в пределах 9\" от одного или более ваших Tunnel Markers и не находящийся в Engagement Range с одним или более вражескими отрядами",
      effect: "Уберите ваш отряд с поля боя и разместите его снова, полностью в пределах 9\" от другого вашего Tunnel Marker и более чем в 6\" по горизонтали от всех вражеских отрядов.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "SWARMING ASSAULT",
      cpCost: 1,
      when: "Ваша фаза Charge",
      target: "Один отряд TYRANIDS MONSTER из вашей армии, который был размещён как Reinforcements в этом ходу",
      effect: "До конца фазы дружественные отряды TYRANIDS в пределах 6\" от вашего отряда могут перебрасывать броски Charge.",
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "RETREAT BELOW",
      cpCost: 1,
      when: "Конец фазы Fight вашего оппонента",
      target: "Один отряд TYRANIDS или до двух отрядов BURROWER из вашей армии, которые не находятся в Engagement Range с одним или более вражескими отрядами",
      effect: "Уберите ваш отряд с поля боя и поместите его в Strategic Reserves.",
      categories: [StratagemCategory.fight],
    ),
  ],
);