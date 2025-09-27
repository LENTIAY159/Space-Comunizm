import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';



final Detachment championsOfContagion = Detachment(
  name: "Champions of Contagion",

  additionalRules: [
    AdditionalRule(
      name: "Manifold Maladies",
      description:
      "В начале боевого раунда вы можете выбрать одну из Чум, перечисленных в Nurgle's Gift. До конца битвы это ваша выбранная Чума вместо любой ранее выбранной Чумы.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Final Ingredient",
      description:
      "Только BIOLOGUS PUTRIFIER. Один раз за битву, после того как отряд носителя сражался, если одна или более моделей CHARACTER были уничтожены в результате этих атак, выберите одну Чуму. До конца битвы, пока вражеский отряд Afflicted, этот отряд имеет эффект выбранной Чумы в дополнение к любым другим.",
    ),
    Enhancement(
      name: "Visions of Virulence",
      description:
      "Только MALIGNANT PLAGUECASTER. Пока вражеский отряд ослаблен способностью Pestilent Fallout носителя, этот отряд также Afflicted.",
    ),
    Enhancement(
      name: "Needle of Nurgle",
      description:
      "Только PLAGUE SURGEON. Каждый раз, когда носитель использует свою способность Tainted Narthecium, вы можете вернуть до D3 уничтоженных моделей в отряд носителя (вместо 1).",
    ),
    Enhancement(
      name: "Cornucophagus",
      description:
      "Только LORD OF POXES. На этапе Declare Battle Formations выберите одну Чуму. До конца битвы, пока вражеский отряд находится в пределах Contagion Range носителя, этот вражеский отряд имеет эффект этой Чумы в дополнение к любым другим.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "BLESSINGS OF FILTH",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
        StratagemCategory.fight,
      ],
      when: "Ваша Shooting phase или Fight phase.",
      target:
      "Один Attached отряд DEATH GUARD из вашей армии, который не был выбран для стрельбы или сражения в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряде совершает атаку, немодифицированный бросок Попадания 5+ засчитывает Critical Hit.",
    ),
    Stratagem(
      name: "MALIGNANCE MAGNIFIED",
      cpCost: 2,
      categories: [
        StratagemCategory.shooting,
        StratagemCategory.fight,
      ],
      when: "Ваша Shooting phase или Fight phase.",
      target:
      "Один Attached отряд DEATH GUARD из вашей армии, который не был выбран для стрельбы или сражения в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряде совершает атаку, нацеленную на отряд, который находится ниже своего Starting Strength, вы можете перебросить бросок Попадания и вы можете перебросить бросок Ранения.",
    ),
    Stratagem(
      name: "GROTESQUE FORTITUDE",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
        StratagemCategory.fight,
      ],
      when:
      "Shooting phase вашего противника или Fight phase, сразу после того, как вражеский отряд выбрал свои цели.",
      target:
      "Один Attached отряд DEATH GUARD из вашей армии, который был выбран в качестве цели одной или более атак атакующего отряда.",
      effect:
      "До конца фазы, добавьте 2 к характеристике Toughness моделей в вашем отряде.",
    ),
    Stratagem(
      name: "RABID INFUSION",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when: "Начало Fight phase.",
      target:
      "Один отряд DEATH GUARD из вашей армии, который включает две модели CHARACTER.",
      effect:
      "До конца фазы ваш отряд имеет способность Fights First.",
    ),
    Stratagem(
      name: "MOBILE VECTOR",
      cpCost: 1,
      categories: [
        StratagemCategory.move,
      ],
      when: "Ваша Movement phase, перед этапом Reinforcements.",
      target:
      "Один отряд CHARACTER DEATH GUARD из вашей армии, который не ведет отряд.",
      effect:
      "Выберите один другой дружественный отряд DEATH GUARD (исключая Battle-shocked отряды и Attached отряды, которые уже имеют два отряда Leader или один из ваших отрядов CHARACTER, ведущий его) в пределах 2\" по горизонтали и 5\" по вертикали от вашего отряда, которым ваш отряд может руководить (как описано в разделе Leader его карточки данных). Ваш отряд присоединяется к этому отряду как Leader. Измените Starting Strength этого отряда соответственно.",
    ),
    Stratagem(
      name: "DEATH'S HEADS",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд BIOLOGUS PUTRIFIER из вашей армии, который не находится в пределах Engagement Range одного или более вражеских отрядов и не был выбран для стрельбы в эту фазу.",
      effect:
      "Выберите один вражеский отряд (исключая VEHICLES), который находится в пределах 8\" от вашего отряда и виден ему. До начала вашего следующего хода этот отряд имеет эффект всех Чум (см. Nurgle's Gift).",
    ),
  ],

  restrictions: [],
);