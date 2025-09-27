import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment flyblownHost = Detachment(
  name: "Flyblown Host",

  additionalRules: [
    AdditionalRule(
      name: "Verminous Haze",
      description:
      "Отряды DEATH GUARD INFANTRY (исключая отряды POXWALKERS) из вашей армии, которые не размещены в TRANSPORT, имеют способности Scouts 5\" и Stealth.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Droning Chorus",
      description:
      "Только модель DEATH GUARD INFANTRY. Дальнее оружие, которым экипированы модели в отряду носителя, имеет способность [ASSAULT].",
    ),
    Enhancement(
      name: "Insectile Murmuration",
      description:
      "Только модель DEATH GUARD INFANTRY. Каждый раз, когда модель в отряду носителя совершает атаку, нацеленную на отряд, который находится в пределах Contagion Range одного или более отрядов DEATH GUARD из вашей армии, перебросьте бросок Ранения 1.",
    ),
    Enhancement(
      name: "Rejuvenating Swarm",
      description:
      "Только модель DEATH GUARD INFANTRY. В конце каждой фазы носитель восстанавливает все свои потерянные раны.",
    ),
    Enhancement(
      name: "Plagueveil",
      description:
      "Только модель DEATH GUARD INFANTRY. Пока отряд носителя находится в пределах досягаемости одного или более маркеров целей, которые вы контролируете, этот отряд может быть выбран в качестве цели дальней атаки только если атакующая модель находится в пределах 18\".",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "NAUSEATING PAROXYSMS",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Начало Fight phase.",
      target:
      "Один отряд DEATH GUARD INFANTRY из вашей армии, который находится в пределах Engagement Range одного или более вражеских отрядов.",
      effect:
      "Выберите один вражеский отряд в пределах Engagement Range вашего отряда. Этот отряд должен пройти тест Battle-shock, вычитая 1 из результата.",
    ),
    Stratagem(
      name: "VERMIN CLOUD",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Fight phase.",
      target:
      "Один отряд DEATH GUARD INFANTRY из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в этом отряду совершает движение Pile-in или Consolidation, она может двигаться до 6\" вместо до 3\".",
    ),
    Stratagem(
      name: "EYE OF THE SWARM",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд DEATH GUARD INFANTRY из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы дальнее оружие, которым экипированы модели в вашем отряду (исключая оружие Blast), имеет способность [PISTOL].",
    ),
    Stratagem(
      name: "DRONING HORROR",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when: "Ваша Shooting phase.",
      target:
      "Один отряд DEATH GUARD INFANTRY из вашей армии, который не был выбран для стрельбы в эту фазу.",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряду совершает дальнюю атаку, перебросьте бросок Попадания 1. Если эта атака нацелена на отряд в пределах половины дальности, вы можете вместо этого перебросить бросок Попадания.",
    ),
    Stratagem(
      name: "ENERVATING ONSLAUGHT",
      cpCost: 1,
      categories: [StratagemCategory.charge],
      when:
      "Ваша Charge phase, сразу после того, как отряд DEATH GUARD INFANTRY из вашей армии совершает движение Charge.",
      target: "Этот отряд DEATH GUARD INFANTRY.",
      effect:
      "Выберите один вражеский отряд в пределах Engagement Range вашего отряда (исключая MONSTERS и VEHICLES). Бросьте один D6 за каждую модель в вашем отряду, которая находится в пределах Engagement Range этого отряда, добавляя 1 к результату, если эта модель не является моделью CULTIST или POXWALKER: за каждый 5+ выбранный вражеский отряд получает 1 смертельную рану (максимум 6 смертельных ран).",
    ),
    Stratagem(
      name: "MYPHITIC INVIGORATION",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when:
      "Shooting phase вашего противника, сразу после того, как вражеский отряд выбрал свои цели.",
      target:
      "Один отряд DEATH GUARD INFANTRY из вашей армии, который находится в пределах 6\" от одного или более дружественных отрядов MYPHITIC BLIGHT-HAULER и который был выбран в качестве цели одной или более атак атакующего отряда.",
      effect:
      "До конца фазы, каждый раз, когда атака нацелена на ваш отряд, если характеристика Strength этой атаки больше характеристики Toughness этого отряда, вычтите 1 из броска Ранения.",
    ),
  ],

  restrictions: [],
);