import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final invasionFleet = Detachment(
  name: "Invasion Fleet",
  additionalRules: [
    AdditionalRule(
      name: "Hyper-adaptations",
      description: "В начале первого раунда битвы выберите одну из следующих Hyper-adaptations, которая будет активна для отрядов TYRANIDS из вашей армии до конца сражения:\n\n"
          "Swarming Instincts: Каждый раз, когда модель TYRANIDS с этой Hyper-adaptation совершает атаку по отряду INFANTRY или SWARM, эта атака получает способность [SUSTAINED HITS 1].\n\n"
          "Hyper-aggression: Каждый раз, когда модель TYRANIDS с этой Hyper-adaptation совершает атаку по отряду MONSTER или VEHICLE, эта атака получает способность [LETHAL HITS].\n\n"
          "Hive Predators: Каждый раз, когда модель TYRANIDS с этой Hyper-adaptation совершает атаку по отряду CHARACTER, при Critical Hit эта атака получает способность [PRECISION].",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Alien Cunning",
      description: "Только для модели TYRANIDS. После того как обе армии расставлены, выберите до трёх отрядов TYRANIDS из вашей армии и передислоцируйте их. При этом вы можете поместить эти отряды в Strategic Reserves, независимо от того, сколько отрядов уже находится в Strategic Reserves.",
    ),
    Enhancement(
      name: "Perfectly Adapted",
      description: "Только для модели TYRANIDS. Один раз за ход вы можете перебросить один бросок на попадание, один бросок на пробитие, один бросок урона, один бросок Advance, один бросок Charge или один спасбросок, выполненный для носителя.",
    ),
    Enhancement(
      name: "Synaptic Linchpin",
      description: "Только для модели TYRANIDS. Пока дружественный отряд TYRANIDS находится в пределах 9\" от носителя, этот отряд считается находящимся в Synapse Range вашей армии.",
    ),
    Enhancement(
      name: "Adaptive Biology",
      description: "Только для модели TYRANIDS. Носитель имеет способность Feel No Pain 5+. В начале любого хода, если у носителя меньше, чем его начальное количество Wounds, до конца битвы он имеет способность Feel No Pain 4+.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "RAPID REGENERATION",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд TYRANIDS из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "До конца фазы модели в вашем отряде имеют способность Feel No Pain 6+. Если ваш отряд находится в Synapse Range вашей армии, модели в нём имеют способность Feel No Pain 5+ вместо этого.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "ADRENAL SURGE",
      cpCost: 2,
      when: "Фаза Fight",
      target: "До двух отрядов TYRANIDS из вашей армии, находящихся в Synapse Range вашей армии и имеющих право сражаться, или один другой отряд TYRANIDS из вашей армии, имеющий право сражаться",
      effect: "До конца фазы каждый раз, когда модель в любом из выбранных отрядов совершает атаку, немодифицированный результат 5+ на попадание считается Critical Hit.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "DEATH FRENZY",
      cpCost: 1,
      when: "Фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд TYRANIDS из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде уничтожается, если она ещё не сражалась в этой фазе, бросьте D6: при результате 4+ не убирайте её с поля боя. Эта уничтоженная модель может сражаться после того, как атакующий отряд завершит свои атаки, а затем будет удалена с поля боя.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "OVERRUN",
      cpCost: 1,
      when: "Фаза Fight, перед тем как отряд TYRANIDS из вашей армии выполнит Consolidation",
      target: "Этот отряд TYRANIDS",
      effect: "До конца фазы каждый раз, когда ваш отряд выполняет Consolidation, модели в нём могут перемещаться на дополнительные 3\", если это перемещение заканчивается в Engagement Range с одним или более вражескими отрядами. Если ваш отряд находится в Synapse Range вашей армии и не находится в Engagement Range с вражескими отрядами, вместо Consolidation он может выполнить Normal move до 6\".",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PREDATORY IMPERATIVE",
      cpCost: 1,
      when: "Ваша фаза Command",
      target: "До двух отрядов TYRANIDS из вашей армии, находящихся в Synapse Range вашей армии, или один другой отряд TYRANIDS из вашей армии",
      effect: "Выберите одну Hyper-adaptation. До начала вашей следующей фазы Command эта Hyper-adaptation активна для выбранных отрядов в дополнение к уже активной для вашей армии.",
      restrictions: "Нельзя выбрать ту же Hyper-adaptation, что была выбрана в начале первого раунда битвы",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "ENDLESS SWARM",
      cpCost: 1,
      when: "Ваша фаза Command",
      target: "До двух отрядов ENDLESS MULTITUDE из вашей армии, находящихся в Synapse Range вашей армии, или один другой отряд ENDLESS MULTITUDE из вашей армии",
      effect: "Вы можете вернуть до D3+3 уничтоженных моделей в каждый из выбранных отрядов.",
      categories: [StratagemCategory.command],
    ),
  ],
);
