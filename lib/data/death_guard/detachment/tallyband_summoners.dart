import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment tallybandSummoners = Detachment(
  name: "Tallyband Summoners",

  additionalRules: [
    AdditionalRule(
      name: "Reverberant Rancidity",
      description:
      "Пока юнит PLAGUE LEGIONS из вашей армии находится в пределах 7\" от одного или более юнитов DEATH GUARD из вашей армии, этот юнит PLAGUE LEGIONS имеет способность Nurgle's Gift.\n\nПока юнит DEATH GUARD из вашей армии находится в пределах 7\" от одного или более юнитов PLAGUE LEGIONS из вашей армии, добавьте 3\" к Contagion Range этого юнита DEATH GUARD.",
    ),
    AdditionalRule(
      name: "PLAGUE LEGIONS",
      description:
      "Вы можете включать юниты PLAGUE LEGIONS в свою армию, даже если у них нет ключевого слова фракции DEATH GUARD. Общая стоимость в очках таких юнитов, которые вы можете включить в свою армию:\nIncursion: До 500 очков\nStrike Force: До 1000 очков\nOnslaught: До 1500 очков\n\nНи одна модель PLAGUE LEGIONS из вашей армии не может быть вашим WARLORD.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Beckoning Blight",
      description:
      "Только модель DEATH GUARD. Каждый раз, когда юнит PLAGUE LEGIONS из вашей армии размещается на поле боя, используя способность Deep Strike, если он размещается полностью в пределах 12\" от носителя, он может быть размещен в любом месте, которое находится более чем в 6\" по горизонтали от всех вражеских моделей, вместо более чем в 9\".",
    ),
    Enhancement(
      name: "Fell Harvester",
      description:
      "Только модель DEATH GUARD. Добавьте 2 к характеристике Attacks оружия ближнего боя носителя.",
    ),
    Enhancement(
      name: "Entropic Knell",
      description:
      "Только GREAT UNCLEAN ONE. В шаге Battle-shock фазы Command вашего противника каждый вражеский юнит в пределах 6\" от носителя, который находится ниже своей Starting Strength, должен пройти тест Battle-shock, вычитая 1 из этого теста.",
    ),
    Enhancement(
      name: "Tome of Bounteous Blessings",
      description:
      "Только MALIGNANT PLAGUECASTER. Каждый раз, когда юнит PLAGUE LEGIONS в пределах 12\" от носителя проходит тест Battle-shock, добавьте 1 к этому тесту и, если этот тест пройден, одна модель в этом юните восстанавливает до D3 потерянных ран (если этот юнит является юнитом BATTLELINE и этот тест пройден, вместо этого до D3 уничтоженных моделей могут быть возвращены в этот юнит).",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "PERSISTENT PESTS",
      cpCost: 1,
      categories: StratagemCategory.values,
      when: "Любая фаза.",
      target:
      "Один юнит NURGLINGS из вашей армии, который только что был уничтожен. Вы можете выбрать этот юнит целью данной стратагемы, даже если он только что был уничтожен.",
      effect:
      "Добавьте новый юнит в вашу армию, идентичный вашему уничтоженному юниту, в Strategic Reserves, с его Starting Strength и с полными оставшимися ранами.",
    ),
    Stratagem(
      name: "CLUTCHING CORRUPTION",
      cpCost: 1,
      categories: [
        StratagemCategory.fight,
      ],
      when: "Фаза Fight.",
      target:
      "Один юнит DEATH GUARD из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, которая нацелена на вражеский юнит, находящийся в пределах Engagement Range от одного или более юнитов PLAGUE LEGIONS из вашей армии, вы можете перебросить бросок Hit.",
    ),
    Stratagem(
      name: "ALL IS ROT",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша фаза Shooting.",
      target:
      "Один юнит PLAGUE LEGIONS из вашей армии, который находится в пределах Engagement Range от одного или более вражеских юнитов.",
      effect:
      "До конца фазы вражеские юниты не считаются находящимися в пределах Engagement Range от вашего юнита для целей выбора целей оружия дальнего боя. До конца фазы каждый раз, когда вражеская модель теряет рану, пока юнит этой модели находится в пределах Engagement Range от вашего юнита, бросьте один D6: при 5+ ваш юнит получает 1 смертельную рану после того, как атакующий юнит завершит свои атаки.",
    ),
    Stratagem(
      name: "FLESHY AVALANCHE",
      cpCost: 1,
      categories: [
        StratagemCategory.move,
        StratagemCategory.charge,
      ],
      when: "Ваша фаза Movement или ваша фаза Charge.",
      target:
      "Один юнит PLAGUE LEGIONS MONSTER из вашей армии, который не был выбран для передвижения или атаки в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда ваш юнит совершает движение Normal, Advance или Charge, он может двигаться горизонтально через элементы ландшафта.",
    ),
    Stratagem(
      name: "AVATARS OF DECAY",
      cpCost: 1,
      categories: [
        StratagemCategory.shooting,
      ],
      when: "Ваша фаза Shooting.",
      target: "Один юнит PLAGUE LEGIONS из вашей армии.",
      effect:
      "До конца фазы, пока вражеский юнит находится в пределах 6\" от вашего юнита, этот вражеский юнит получает состояние Afflicted.",
    ),
    Stratagem(
      name: "MIRESLICK",
      cpCost: 1,
      categories: [
        StratagemCategory.move,
      ],
      when:
      "Фаза Movement вашего противника, когда вражеский юнит (исключая MONSTERS и VEHICLES) выбран для Fall Back.",
      target:
      "Один юнит PLAGUE LEGIONS из вашей армии, который находится в пределах Engagement Range от этого вражеского юнита.",
      effect:
      "До конца фазы, пока вражеский юнит находится в пределах Engagement Range от вашего юнита, каждый раз, когда этот юнит выбран для Fall Back, он должен пройти тест Leadership. Если этот тест провален, этот юнит должен вместо этого остаться Remain Stationary в эту фазу.",
    ),
  ],

  restrictions: [],
);