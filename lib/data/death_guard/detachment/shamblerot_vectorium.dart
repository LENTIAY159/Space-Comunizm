import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment shamblerotVectorium = Detachment(
  name: "Shamblerot Vectorium",

  additionalRules: [
    AdditionalRule(
      name: "Numberless Horde",
      description:
      "В вашу Command phase в каждом из следующих боевых раундов, в зависимости от выбранного размера битвы, добавьте новый отряд POXWALKERS с Starting Strength 10 в вашу армию, в Strategic Reserves.\n\nBATTLE SIZE\tBATTLE ROUNDS\nIncursion\t2,3\nStrike Force\t2, 3, 4\nOnslaught\t2, 3, 4, 5",
    ),
    AdditionalRule(
      name: "KEYWORDS",
      description:
      "Отряды POXWALKERS из вашей армии получают ключевое слово BATTLELINE.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Witherbone Pipes",
      description:
      "Только NOXIOUS BLIGHTBRINGER. Пока носитель ведет отряд POXWALKERS, добавьте 1 к характеристике Objective Control моделей в этом отряду, и каждый раз, когда этот отряд проходит тест Battle-shock или Leadership, добавьте 1 к этому тесту.",
    ),
    Enhancement(
      name: "Lord of the Walking Pox",
      description:
      "Только модель DEATH GUARD. Если носитель ведет отряд POXWALKER и находится в Strategic Reserves, для целей установки этого отряда на поле битвы, рассматривайте текущий боевой раунд как третий боевой раунд.",
    ),
    Enhancement(
      name: "Sorrowsyphon",
      description:
      "Только MALIGNANT PLAGUECASTER. Пока носитель ведет отряд POXWALKERS, добавьте 1 к характеристике Damage оружия Plague Wind носителя. Каждый раз, когда носитель совершает одну или более атак оружием Plague Wind, после того как отряд носителя разрешил свои атаки, D3 модели Bodyguard из отряда носителя уничтожаются.",
    ),
    Enhancement(
      name: "Talisman of Burgeoning",
      description:
      "Только модель DEATH GUARD. Пока носитель ведет отряд, добавьте 1 к характеристике Toughness моделей POXWALKERS в этом отряду.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "GRIP OF THE WALKING POX",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when: "Fight phase, сразу после того, как вражеский отряд выбрал свои цели.",
      target:
      "Один отряд POXWALKERS из вашей армии, который был выбран в качестве цели одной или более атак атакующего отряда.",
      effect:
      "После того как атакующий отряд сражался, бросьте один D6 за каждую модель из вашего отряда, которая была уничтожена в результате этих атак: при 6 атакующий отряд получает 1 смертельную рану. Если ваш отряд не уничтожен после того как атакующий отряд сражался, вражеские модели, уничтоженные в результате этой стратагемы, засчитываются как вражеские модели, уничтоженные атакой, совершенной моделью в вашем отряду, для целей способности Curse of the Walking Pox.",
    ),
    Stratagem(
      name: "SMEARED WITH FILTH",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when: "Fight phase.",
      target:
      "Один отряд POXWALKERS из вашей армии, который только что был уничтожен. Вы можете нацелить этот отряд этой стратагемой, даже если он только что был уничтожен.",
      effect:
      "Выберите один вражеский отряд, который совершил одну или более атак, нацеленных на ваш отряд в эту фазу. До конца битвы этот вражеский отряд Afflicted.",
    ),
    Stratagem(
      name: "GNAWING HUNGER",
      cpCost: 1,
      categories: [
        StratagemCategory.command,
      ],
      when: "Ваша Command phase.",
      target: "Один отряд POXWALKERS из вашей армии.",
      effect:
      "До конца хода добавьте 1 к характеристике Move моделей в вашем отряду, и добавьте 1 к характеристикам Attacks и Strength оружия ближнего боя, которым экипированы модели в вашем отряду.",
    ),
    Stratagem(
      name: "HIDDEN AMONGST THE DEAD",
      cpCost: 1,
      categories: [
        StratagemCategory.move,
      ],
      when: "Этап Reinforcements вашей Movement phase.",
      target:
      "Один отряд POXWALKERS из вашей армии, который находится в Strategic Reserves и который не является Attached отрядом.",
      effect:
      "До конца фазы модели в этом отряду имеют способность Deep Strike.",
    ),
    Stratagem(
      name: "SHOCK AND HORROR",
      cpCost: 1,
      categories: [
        StratagemCategory.charge,
      ],
      when:
      "Ваша Charge phase, сразу после того, как отряд DEATH GUARD из вашей армии завершает движение Charge.",
      target: "Этот отряд DEATH GUARD.",
      effect:
      "Каждый вражеский отряд в пределах Engagement Range вашего отряда должен пройти тест Battle-shock, вычитая 1 из этого теста.",
    ),
    Stratagem(
      name: "SHAMBLING WALL",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when:
      "Shooting phase вашего противника, сразу после того, как вражеский отряд выбрал свои цели.",
      target:
      "Один отряд DEATH GUARD из вашей армии, который был выбран в качестве цели одной или более атак атакующего отряда, и один дружественный отряд POXWALKERS в пределах 3\" от вашего отряда и видимый как вашему отряду, так и атакующему отряду.",
      effect:
      "До конца фазы, каждый раз, когда вы назначали бы атаку модели в вашем отряду DEATH GUARD, если ваш отряд POXWALKERS виден атакующей модели и является подходящей целью для этой атаки, спасбросок для этой атаки не совершается; вместо этого количество POXWALKERS из вашего отряда POXWALKERS, равное характеристике Damage этой атаки, уничтожается.",
    ),
  ],

  restrictions: [],
);