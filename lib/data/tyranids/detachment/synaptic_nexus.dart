import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final synapticNexus = Detachment(
  name: "Synaptic Nexus",
  additionalRules: [
    AdditionalRule(
      name: "Synaptic Imperatives",
      description: "В начале раунда битвы вы можете выбрать одну из Synaptic Imperatives, указанных ниже. До конца раунда битвы эта Synaptic Imperative активна для вашей армии, и пока отряд TYRANIDS из вашей армии находится в Synapse Range вашей армии, он получает её эффект. Каждую Synaptic Imperative можно выбрать только один раз за битву.\n"
          "- Synaptic Augmentation: Пока этот отряд находится в Synapse Range вашей армии, модели в этом отряде имеют 5+ invulnerable save.\n"
          "- Surging Vitality: Пока этот отряд находится в Synapse Range вашей армии, добавляйте 1 к броскам Advance и Charge, выполняемым для этого отряда.\n"
          "- Goaded to Slaughter: Пока этот отряд находится в Synapse Range вашей армии, каждый раз, когда модель в этом отряде совершает атаку в ближнем бою, добавляйте 1 к броску на попадание.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Power of the Hive Mind",
      description: "Только для модели TYRANIDS PSYKER. Улучшите характеристики Strength и Armour Penetration оружия-псайкера, которым оснащён носитель, на 1.",
    ),
    Enhancement(
      name: "Psychostatic Disruption",
      description: "Только для модели TYRANIDS SYNAPSE. Вражеские отряды, выходящие на поле боя из Reserves, не могут быть размещены в пределах 12\" от носителя. Кроме того, один раз за битву, в первый или второй раунд, когда ваш оппонент объявляет, что отряд выйдет на поле боя из Strategic Reserves, носитель может использовать это Enhancement. Если он это делает, бросьте D6: при результате 4+ этот вражеский отряд не может выйти на поле боя в этот ход.",
    ),
    Enhancement(
      name: "Synaptic Control",
      description: "Только для модели TYRANIDS SYNAPSE. Каждый раз, когда на носителя распределяется атака, вычитайте 1 из характеристики Damage этой атаки.",
    ),
    Enhancement(
      name: "The Dirgeheart of Kharis (Aura)",
      description: "Только для модели TYRANIDS SYNAPSE. Пока вражеский отряд находится в пределах 9\" от носителя, ухудшайте характеристику Leadership этого отряда на 1.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "THE SMOTHERING SHADOW",
      cpCost: 1,
      when: "Любая фаза, сразу после того как вражеский отряд провалил тест Battle-shock",
      target: "Один отряд SYNAPSE из вашей армии в пределах 12\" от этого вражеского отряда",
      effect: "Бросьте шесть D6: за каждое 3+ этот вражеский отряд получает 1 mortal wound.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "SYNAPTIC CHANNELLING",
      cpCost: 1,
      when: "Фаза Command",
      target: "Один отряд SYNAPSE из вашей армии",
      effect: "До конца хода, пока дружественный отряд TYRANIDS находится в пределах 9\" от выбранного отряда, он считается находящимся в Synapse Range.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "IRRESISTIBLE WILL",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight",
      target: "Один отряд SYNAPSE из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе, и один вражеский отряд в пределах 24\" и в зоне видимости этого отряда SYNAPSE",
      effect: "До конца фазы каждый раз, когда дружественная модель TYRANIDS совершает атаку по этому вражескому отряду, если отряд атакующей модели находится в пределах 6\" от вашего отряда SYNAPSE, перебрасывайте бросок на попадание 1 и бросок на пробитие 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "REINFORCED HIVE NODE",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд SYNAPSE из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "Пока атакующий отряд не завершит свои атаки, каждый раз, когда атака направлена на ваш отряд, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "IMPERATIVE DOMINANCE",
      cpCost: 1,
      when: "Ваша фаза Command",
      target: "Один отряд TYRANIDS из вашей армии, находящийся в Synapse Range вашей армии",
      effect: "Выберите одну Synaptic Imperative, даже если вы уже выбирали её в этой битве. До начала вашей следующей фазы Command эта Synaptic Imperative активна для вашего отряда вместо любой другой, активной для вашей армии.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "OVERRIDE INSTINCTS",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд TYRANIDS из вашей армии, находящийся в Synapse Range вашей армии и выполнивший Fall Back в этой фазе",
      effect: "Ваш отряд может стрелять и объявлять атаку в этот ход.",
      categories: [StratagemCategory.move],
    ),
  ],
);