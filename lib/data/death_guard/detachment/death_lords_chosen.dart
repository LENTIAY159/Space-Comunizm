import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment deathLordsChosen = Detachment(
  name: "Death Lord's Chosen",

  additionalRules: [
    AdditionalRule(
      name: "Deadly Vectors",
      description:
      "В Command phase вашего противника бросьте 2D6 для каждого Afflicted вражеского отряда, вычитая 1 из результата, если этот отряд Below Half-strength. Если результат 6 или меньше, этот вражеский отряд получает D3 смертельных ран.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Face of Death",
      description:
      "Только модель TERMINATOR. В начале Fight phase каждый вражеский отряд в пределах Engagement Range отряда носителя должен пройти тест Battle-shock.",
    ),
    Enhancement(
      name: "Vile Vigour",
      description:
      "Только модель TERMINATOR. Пока носитель ведет отряд, добавьте 1\" к характеристике Movement моделей в этом отряду и вы можете перебрасывать броски Advance для этого отряда.",
    ),
    Enhancement(
      name: "Warprot Talisman",
      description:
      "Только модель TERMINATOR. Один раз за битву, в конце хода вашего противника, если отряд носителя не находится в пределах Engagement Range одного или более вражеских отрядов, вы можете убрать его с поля битвы и поместить в Strategic Reserves.",
    ),
    Enhancement(
      name: "Helm of the Fly King",
      description:
      "Только модель TERMINATOR. Пока носитель ведет отряд, модели в этом отряду не могут быть целью дальних атак, если атакующая модель не находится в пределах 18\".",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "BLOOMING PESTILENCE",
      cpCost: 1,
      categories: StratagemCategory.values,
      when: "Начало любой фазы.",
      target: "Один отряд TERMINATOR из вашей армии.",
      effect:
      "До конца фазы добавьте 3\" к Contagion Range моделей в вашем отряду.",
    ),
    Stratagem(
      name: "GRIM REAPERS",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when: "Fight phase.",
      target:
      "Один отряд TERMINATOR из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряде совершает атаку, нацеленную на вражеский отряд (исключая MONSTERS и VEHICLES), вы можете перебросить бросок Попадания.",
    ),
    Stratagem(
      name: "UNDYING SPITE",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when:
      "Fight phase, сразу после того, как вражеский отряд выбрал свои цели.",
      target:
      "Один отряд TERMINATOR из вашей армии, который был выбран в качестве цели одной или более атак атакующего отряда.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряду уничтожается, если эта модель не сражалась в эту фазу, бросьте один D6. При 4+ не убирайте уничтоженную модель из игры; она может сражаться после того, как атакующий отряд закончит свои атаки, а затем убирается из игры.",
    ),
    Stratagem(
      name: "SIGNAL POX",
      cpCost: 1,
      categories: [
        StratagemCategory.command,
      ],
      when: "Ваша Command phase.",
      target: "Одна модель LORD OF VIRULENCE из вашей армии.",
      effect:
      "Выберите один маркер цели в пределах 30\" от вашей модели и видимый ей. До начала вашего следующего хода, пока вражеский отряд находится в пределах досягаемости этого маркера цели, этот отряд Afflicted.",
    ),
    Stratagem(
      name: "MORTARION'S TEACHINGS",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд TERMINATOR из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы дальнее оружие, которым экипированы модели в вашем отряду, имеет способности [ASSAULT] и [HEAVY].",
    ),
    Stratagem(
      name: "SICKENING IMPACT",
      cpCost: 1,
      categories: [
        StratagemCategory.charge,
      ],
      when:
      "Ваша Charge phase, сразу после того, как отряд TERMINATOR из вашей армии завершает движение Charge.",
      target: "Этот отряд TERMINATOR.",
      effect:
      "Выберите один вражеский отряд в пределах Engagement Range вашего отряда, затем бросьте один D6 за каждую модель в вашем отряду, которая находится в пределах Engagement Range этого вражеского отряда: за каждый 2+ этот вражеский отряд получает 1 смертельную рану (максимум 6 смертельных ран).",
    ),
  ],

  restrictions: [],
);