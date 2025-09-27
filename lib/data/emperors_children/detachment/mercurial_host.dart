import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment mercurialHost = Detachment(
  name: "Mercurial Host",

  additionalRules: [
    AdditionalRule(
      name: "Quicksilver Grace",
      description:
      "Вы можете перебрасывать броски Advance, совершенные для юнитов EMPEROR'S CHILDREN из вашей армии.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Steeped in Suffering",
      description:
      "Только модель EMPEROR'S CHILDREN. Каждый раз, когда модель в юните носителя совершает атаку, которая нацелена на вражеский юнит ниже его Starting Strength, добавьте 1 к броску Hit. Если эта цель также Below Half-strength, добавьте 1 к броску Wound также.",
    ),
    Enhancement(
      name: "Intoxicating Musk",
      description:
      "Только модель EMPEROR'S CHILDREN. Каждый раз, когда атака ближнего боя нацелена на юнит носителя, если характеристика Strength этой атаки больше характеристики Toughness этого юнита, вычтите 1 из броска Wound.",
    ),
    Enhancement(
      name: "Tactical Perfection",
      description:
      "Только модель EMPEROR'S CHILDREN. После того как оба игрока развернули свои армии, выберите до двух юнитов EMPEROR'S CHILDREN из вашей армии и переразверните их. При этом вы можете разместить эти юниты в Strategic Reserves, если хотите, независимо от того, сколько юнитов уже находится в Strategic Reserves.",
    ),
    Enhancement(
      name: "Loathsome Dexterity",
      description:
      "Только модель EMPEROR'S CHILDREN. Каждый раз, когда модель в юните носителя совершает движение Normal, Advance или Fall Back, она может двигаться через вражеские модели. При этом она может двигаться в пределах Engagement Range таких моделей, но не может закончить это движение в пределах Engagement Range от них, и любой тест Desperate Escape автоматически проходит.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "VIOLENT EXCESS",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Фаза Fight.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы оружие ближнего боя, которым экипированы модели в вашем юните, имеет способность [SUSTAINED HITS 1].",
    ),
    Stratagem(
      name: "COMBAT STIMMS",
      cpCost: 2,
      categories: [StratagemCategory.fight],
      when: "Фаза Fight, сразу после того, как вражеский юнит выбрал свои цели.",
      target:
      "Один юнит EMPEROR'S CHILDREN INFANTRY из вашей армии, который был выбран в качестве цели одной или более атак атакующего юнита.",
      effect:
      "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычтите 1 из броска Wound.",
    ),
    Stratagem(
      name: "HONOUR THE PRINCE",
      cpCost: 1,
      categories: [StratagemCategory.move],
      when: "Ваша фаза Movement.",
      target:
      "Один юнит EMPEROR'S CHILDREN INFANTRY из вашей армии, который не был выбран для движения в эту фазу.",
      effect:
      "До конца фазы, если ваш юнит совершает Advance, не делайте бросок Advance. Вместо этого до конца фазы добавьте 6\" к характеристике Move моделей в вашем юните.",
    ),
    Stratagem(
      name: "DARK VIGOUR",
      cpCost: 1,
      categories: [StratagemCategory.move],
      when:
      "Фаза Movement вашего противника, сразу после того, как вражеский юнит завершает движение Normal, Advance или Fall Back.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии (исключая BEASTS и VEHICLES), который находится в пределах 9\" от вражеского юнита, который только что завершил это движение.",
      effect: "Ваш юнит может совершить движение Normal до 6\".",
    ),
    Stratagem(
      name: "CAPRICIOUS REACTIONS",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when:
      "Фаза Shooting вашего противника, сразу после того, как вражеский юнит выбрал свои цели.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии, который был выбран в качестве цели одной или более атак атакующего юнита.",
      effect:
      "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычтите 1 из броска Hit.",
    ),
    Stratagem(
      name: "CRUEL RAIDERS",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Конец фазы Fight вашего противника.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии, который находится полностью в пределах 9\" от одного или более краев поля боя и не в пределах 3\" по горизонтали от одного или более вражеских юнитов.",
      effect:
      "Уберите ваш юнит с поля боя и поместите его в Strategic Reserves.",
    ),
  ],

  restrictions: [
    Restriction.keywordBan(
      keywords: [Keyword.daemonettes],
      description: "",
    ),
  ],
);