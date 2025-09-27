import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';



final Detachment mortarionsHammer = Detachment(
  name: "Mortarion's Hammer",

  additionalRules: [
    AdditionalRule(
      name: "Miasmic Bombardment",
      description:
      "В начале боевого раунда выберите количество вражеских отрядов более чем в 12\" от каждой модели из вашей армии, которая находится на поле битвы. До конца боевого раунда эти вражеские отряды Afflicted. Максимальное количество отрядов, которое вы можете выбрать таким образом, зависит от размера битвы, как показано ниже.\n\nBATTLE SIZE\tUNITS\nIncursion\t1\nStrike Force\t2\nOnslaught\t3",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Eye of Affliction",
      description:
      "Только модель DEATH GUARD. Дальнее оружие, которым экипированы модели в отряду носителя, имеет способность [ignores cover] при нацеливании на Afflicted вражеский отряд.",
    ),
    Enhancement(
      name: "Bilemaw Blight",
      description:
      "Только MALIGNANT PLAGUECASTER. В начале вашей Shooting phase, до конца фазы, добавьте 12\" к характеристикам Range оружия Plague Wind носителя.",
    ),
    Enhancement(
      name: "Shriekworm Familiar",
      description:
      "Только модель DEATH GUARD. Один раз за боевой раунд вы можете нацелить отряд носителя стратагемой Fire Overwatch за 0CP.",
    ),
    Enhancement(
      name: "Tendrilous Emissions",
      description:
      "Только LORD OF VIRULENCE. Пока носитель находится в пределах 3\" от одного или более дружественных отрядов DEATH GUARD VEHICLE, носитель имеет способность Lone Operative, и каждый раз, когда один из этих отрядов VEHICLE совершает дальнюю атаку, нацеленную на вражеский отряд, видимый носителю, перебросьте бросок Ранения 1.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "BLIGHTED LAND",
      cpCost: 2,
      categories: [
        StratagemCategory.move,
      ],
      when: "Конец вашей Movement phase.",
      target: "Один отряд DEATH GUARD VEHICLE из вашей армии.",
      effect:
      "Выберите одну элемент ландшафта в пределах 24\" от вашего отряда и видимый ему. До начала вашего следующего хода вражеские отряды Afflicted, пока они находятся в пределах 3\" от этого элемента ландшафта.",
    ),
    Stratagem(
      name: "RELENTLESS GRIND",
      cpCost: 1,
      categories: [
        StratagemCategory.move,
        StratagemCategory.charge,
      ],
      when: "Ваша Movement phase или ваша Charge phase.",
      target:
      "Один отряд DEATH GUARD VEHICLE из вашей армии, который не был выбран для движения или атаки в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда ваш отряд совершает движение Normal, Advance или Charge, он может двигаться горизонтально через элементы ландшафта.",
    ),
    Stratagem(
      name: "DRAWN TO DESPAIR",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд DEATH GUARD из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряду совершает атаку, нацеленную на видимый вражеский отряд (исключая AIRCRAFT) в зоне развертывания вашего противника, вы можете перебросить бросок Попадания.",
    ),
    Stratagem(
      name: "FONT OF FILTH",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд DEATH GUARD VEHICLE из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы дальнее оружие, которым экипированы модели в вашем отряду, имеет способность [ASSAULT].",
    ),
    Stratagem(
      name: "EYESTINGER STORM",
      cpCost: 1,
      categories: [
        StratagemCategory.command,
      ],
      when: "Command phase вашего противника.",
      target: "Один отряд DEATH GUARD VEHICLE из вашей армии.",
      effect:
      "Выберите один маркер цели, видимый одной или более моделям в вашем отряду. Каждый Afflicted вражеский отряд в пределах досягаемости этого маркера цели должен пройти тест Battle-shock. Вражеские отряды, затронутые этой стратагемой, не должны проходить другие тесты Battle-shock в той же фазе.",
    ),
    Stratagem(
      name: "STINKING MIRE",
      cpCost: 1,
      categories: [
        StratagemCategory.charge,
      ],
      when: "Начало Charge phase вашего противника.",
      target: "Один отряд DEATH GUARD VEHICLE из вашей армии.",
      effect:
      "До конца фазы, каждый раз, когда вражеский отряд выбирает ваш отряд в качестве цели атаки, вычтите 2 из броска Charge (это не суммируется с любыми другими отрицательными модификаторами к этому броску Charge).",
    ),
  ],

  restrictions: [],
);