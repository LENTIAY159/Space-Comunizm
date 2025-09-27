import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final librariusConclave = Detachment(
  name: "Librarius Conclave",
  additionalRules: [
    AdditionalRule(
      name: "Psychic Disciplines",
      description: "В начале раунда битвы выберите одну из следующих Psychic Disciplines. До конца раунда битвы выбранная Psychic Discipline активна, и её эффекты применяются ко всем ADEPTUS ASTARTES PSYKER юнитам из вашей армии.\n\n"
          "Biomancy Discipline:\n"
          "Добавьте 2\" к характеристике Move моделей в этом юните.\n"
          "Divination Discipline:\n"
          "Каждый раз, когда модель в этом юните совершает атаку, перебрасывайте Hit roll 1 и перебрасывайте Wound roll 1.\n\n"
          "Pyromancy Discipline:\n"
          "Каждый раз, когда дальняя атака модели из этого юнита нацелена на вражеский юнит в пределах 12\", улучшайте характеристику Armour Penetration этой атаки на 1.\n\n"
          "Telekinesis Discipline:\n"
          "Каждый раз, когда дальняя атака нацелена на этот юнит, вычитайте 1 из характеристики Strength этой атаки.\n\n"
          "Telepathy Discipline:\n"
          "Каждый раз, когда модель в этом юните совершает атаку, вы можете игнорировать любые и все модификаторы к её Weapon Skill или Ballistic Skill характеристикам и/или любые и все модификаторы к Hit roll.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Prescience",
      description: "Только для ADEPTUS ASTARTES PSYKER моделей (кроме TERMINATOR). Один раз за ход, когда вражеский юнит завершает Normal, Advance или Fall Back перемещение в пределах 9\" от юнита носителя, юнит носителя может выполнить Normal move до D6\", или до 6\" вместо этого, если для вашей армии активна Divination Discipline.",
    ),
    Enhancement(
      name: "Celerity",
      description: "Только для ADEPTUS ASTARTES PSYKER моделей. Юнит носителя может объявлять charge в тот ход, в котором он выполнял Advance, и если для вашей армии активна Biomancy Discipline, он также может объявлять charge в ход, в котором выполнял Fall Back.",
    ),
    Enhancement(
      name: "Obfuscation",
      description: "Только для ADEPTUS ASTARTES PSYKER моделей. Вражеские юниты не могут использовать Stratagem Fire Overwatch для стрельбы по юниту носителя, и если для вашей армии активна Telepathy Discipline, юнит носителя не может быть выбран целью дальних атак, если атакующая модель находится дальше 18\".",
    ),
    Enhancement(
      name: "Fusillade",
      description: "Только для ADEPTUS ASTARTES PSYKER моделей. Дальнобойное оружие моделей в юните носителя получает способности [ANTI-MONSTER 5+] и [ANTI-VEHICLE 5+], а также:\n"
          "- способность [SUSTAINED HITS 1], если для вашей армии активна Pyromancy Discipline.\n"
          "- добавьте 6\" к характеристике Range этих оружий, если для вашей армии активна Telekinesis Discipline.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "SENSORY ASSAULT",
      cpCost: 1,
      when: "Command phase",
      target: "Один ADEPTUS ASTARTES PSYKER юнит из вашей армии.",
      effect: "Выберите один вражеский юнит в пределах 18\" и видимый одной PSYKER моделью из вашего юнита. До начала вашего следующего хода этот вражеский юнит считается pinned. Пока юнит pinned, вычитайте 2 из его характеристики Move и вычитайте 2 из Charge roll. Кроме того, если для вашей армии активна Telepathy Discipline, этот вражеский юнит обязан пройти Battle-shock test, вычитая 1 из результата.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting phase противника или Fight phase, сразу после того, как вражеский юнит выбрал цели",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До завершения всех атак вражеского юнита каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "FIERY SHIELD",
      cpCost: 1,
      when: "Fight phase, сразу после того, как вражеский юнит выбрал цели",
      target: "Один ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED юнит из вашей армии, находящийся в пределах 18\" от одной или более дружественных PSYKER моделей и выбранный целью одной или нескольких атак.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из Hit roll, и если для вашей армии активна Pyromancy Discipline, оружие, нацеленное на ваш юнит, получает способность [HAZARDOUS].",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "IRON ARM",
      cpCost: 1,
      when: "Fight phase",
      target: "Один ADEPTUS ASTARTES INFANTRY юнит из вашей армии, находящийся в пределах 18\" от одной или более PSYKER моделей из вашей армии и ещё не выбранный для боя в этой фазе.",
      effect: "До конца фазы добавьте 1 к характеристике Strength melee weapons моделей в вашем юните, или добавьте 2, если для вашей армии активна Biomancy Discipline.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "ASSAIL",
      cpCost: 1,
      when: "Your Shooting phase",
      target: "Один ADEPTUS ASTARTES PSYKER юнит из вашей армии, имеющий право на стрельбу.",
      effect: "Выберите один вражеский юнит в пределах 18\" и видимый одной или несколькими PSYKER моделями из вашего юнита (исключая юниты с Lone Operative), и бросьте шесть D6, добавляя 1 к каждому результату, если для вашей армии активна Telekinesis Discipline: за каждый 4+ этот вражеский юнит получает 1 mortal wound.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "PRESCIENT PRECISION",
      cpCost: 1,
      when: "Your Shooting phase",
      target: "Один ADEPTUS ASTARTES PSYKER юнит из вашей армии, ещё не выбранный для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, эта атака получает способность [LETHAL HITS], а также [IGNORES COVER], если для вашей армии активна Divination Discipline.",
      categories: [StratagemCategory.shooting],
    ),
  ],
);


