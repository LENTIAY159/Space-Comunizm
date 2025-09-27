import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';

final Detachment virulentVectorium = Detachment(
  name: "Virulent Vectorium",

  additionalRules: [
    AdditionalRule(
      name: "Worldblight",
      description:
      "Если вы контролируете маркер цели в конце вашей фазы Command и юнит DEATH GUARD из вашей армии (исключая юниты с Battle-shocked) находится в пределах досягаемости этого маркера цели, этот маркер цели остается под вашим контролем до тех пор, пока Level of Control вашего противника над этим маркером цели не станет больше вашего в конце фазы. Кроме того, до тех пор пока вы не потеряете контроль над этим маркером цели, он имеет способность Nurgle's Gift, как если бы он был моделью DEATH GUARD из вашей армии.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Daemon Weapon of Nurgle",
      description:
      "Только модель DEATH GUARD. Каждый раз, когда носитель совершает атаку ближнего боя, немодифицированный бросок Hit 5+ засчитывается как Critical Hit.",
    ),
    Enhancement(
      name: "Furnace of Plagues",
      description:
      "Только модель DEATH GUARD. Добавьте 1 к характеристикам Strength и Attacks оружия ближнего боя носителя, и оружие ближнего боя носителя имеет способность [DEVASTATING WOUNDS].",
    ),
    Enhancement(
      name: "Arch Contaminator",
      description:
      "Только модель DEATH GUARD. Пока юнит носителя находится в пределах досягаемости маркера цели, который вы контролируете, каждый раз, когда модель в юните носителя совершает атаку, вы можете перебросить бросок Wound.",
    ),
    Enhancement(
      name: "Revolting Regeneration",
      description:
      "Только модель DEATH GUARD. Носитель имеет способность Feel No Pain 5+.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "PUTRID DETONATION",
      cpCost: 1,
      categories: StratagemCategory.values,
      when: "Любая фаза.",
      target:
      "Одна модель DEATH GUARD VEHICLE или DEATH GUARD MONSTER из вашей армии со способностью Deadly Demise, которая только что была уничтожена.",
      effect:
      "Не бросайте один D6 для определения того, наносятся ли смертельные раны способностью Deadly Demise вашей модели. Вместо этого смертельные раны наносятся автоматически. Кроме того, любые вражеские юниты, которые получают смертельные раны в результате этой стратагемы, получают состояние Afflicted до начала вашего следующего хода.",
      restrictions:
      "Вы можете использовать эту стратагему на эту модель, даже если она только что была уничтожена.",
    ),
    Stratagem(
      name: "DISGUSTINGLY RESILIENT",
      cpCost: 2,
      categories: [
        StratagemCategory.shooting,
        StratagemCategory.fight,
      ],
      when:
      "Фаза Shooting вашего противника или фаза Fight, сразу после того, как вражеский юнит выбрал свои цели.",
      target:
      "Один юнит DEATH GUARD из вашей армии, который был выбран в качестве цели одной или более атак атакующего юнита.",
      effect:
      "До конца фазы каждый раз, когда атака распределяется на модель в вашем юните, вычтите 1 из характеристики Damage этой атаки.",
    ),
    Stratagem(
      name: "PLAGUESURGE",
      cpCost: 2,
      categories: [
        StratagemCategory.command,
      ],
      when: "Ваша фаза Command.",
      target: "Ваш DEATH GUARD WARLORD, который находится на поле боя.",
      effect:
      "До начала вашей следующей фазы Command добавьте 3\" к Contagion Range моделей из вашей армии.",
    ),
    Stratagem(
      name: "LEECHSPORE ERUPTION",
      cpCost: 1,
      categories: [
        StratagemCategory.command,
      ],
      when: "Ваша фаза Command.",
      target:
      "Одна модель DEATH GUARD из вашей армии, которая потеряла одну или более ран.",
      effect:
      "Выберите один вражеский юнит в пределах 3\" от вашей модели. Бросьте количество D6, равное количеству ран, которые потеряла ваша модель: за каждый результат 5+ этот вражеский юнит получает одну смертельную рану (максимум 6 смертельных ран) и ваша модель восстанавливает 1 потерянную рану (максимум 6 потерянных ран).",
    ),
    Stratagem(
      name: "OVERWHELMING GENEROSITY",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Начало вашей фазы Shooting.",
      target: "Один юнит DEATH GUARD CHARACTER из вашей армии.",
      effect:
      "Выберите один вражеский юнит, видимый вашему юниту. До конца фазы каждый раз, когда юнит DEATH GUARD из вашей армии выбирает этот вражеский юнит в качестве цели любых атак дальнего боя, вы можете перебросить кости для определения того, сколько атак совершает оружие, которым экипирована модель в этом юните.",
    ),
    Stratagem(
      name: "CREEPING BLIGHT",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша фаза Shooting.",
      target:
      "Один юнит DEATH GUARD INFANTRY из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем юните совершает атаку дальнего боя, которая нацелена на юнит с состоянием Afflicted, вы можете перебросить бросок Hit и вы можете перебросить бросок Wound.",
    ),
  ],

  restrictions: [],
);