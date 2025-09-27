import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment coterieOfTheConceited = Detachment(
  name: "Coterie of the Conceited",

  additionalRules: [
    AdditionalRule(
      name: "Pledges to the Dark Prince",
      description:
      "В начале раунда боя, если ваш WARLORD находится на поле боя, вы должны поклясться Slaanesh числом, представляющим, сколько вражеских юнитов будет уничтожено в этом раунде боя. В конце раунда боя, если количество уничтоженных в этом раунде боя вражеских юнитов больше или равно вашей клятве, вы получаете количество очков Pact, равное вашей клятве. В противном случае вы не получаете очков Pact в этом раунде боя, и ваша модель WARLORD получает D3 смертельные раны.\n\nЮниты EMPEROR'S CHILDREN из вашей армии получают бонус в зависимости от того, сколько очков Pact вы получили во время боя, как показано ниже (все они накопительные).\n\nPACT POINTS\tBONUS\n1+\tКаждый раз, когда модель в этом юните совершает атаку, перебросьте бросок Hit при результате 1.\n3+\tКаждый раз, когда модель в этом юните совершает атаку, перебросьте бросок Wound при результате 1.\n5+\tОружие ближнего боя, которым экипированы модели в этом юните, имеют способности [LETHAL HITS] и [SUSTAINED HITS 1].\n7+\tКаждый раз, когда модель в этом юните совершает атаку, Critical Hit засчитывается при немодифицированном броске Hit 5+.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Pledge of Eternal Servitude",
      description:
      "Только модель EMPEROR'S CHILDREN. В первый раз, когда носитель уничтожается, пройдите тест Leadership для носителя в конце фазы. Если этот тест пройден, поместите носителя обратно на поле боя, как можно ближе к месту, где он был уничтожен, и не в пределах Engagement Range от одного или более вражеских юнитов, с D6 оставшимися ранами (до его характеристики Wounds).",
    ),
    Enhancement(
      name: "Pledge of Dark Glory",
      description:
      "Только модель EMPEROR'S CHILDREN. Пока носитель ведет юнит, улучшите характеристики Leadership и Objective Control моделей в этом юните на 1.",
    ),
    Enhancement(
      name: "Pledge of Mortal Pain",
      description:
      "Только модель EMPEROR'S CHILDREN. В начале вашей фазы Shooting выберите один вражеский юнит в пределах 12\" от носителя и видимый ему. Этот юнит должен пройти тест Leadership, вычитая 2 из результата, если он имеет состояние Battle-shocked: если провален, этот вражеский юнит получает 3 смертельные раны.",
    ),
    Enhancement(
      name: "Pledge of Unholy Fortune",
      description:
      "Только модель EMPEROR'S CHILDREN. Один раз за ход, сразу после совершения броска Hit, броска Wound или спасброска для модели в юните носителя, если носитель не имеет состояния Battle-shocked, он может использовать это улучшение. Если он это делает, считайте результат как немодифицированный бросок 6 вместо этого.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "PROTECTION OF THE DARK PRINCE",
      cpCost: 1,
      categories: StratagemCategory.values,
      when:
      "Любая фаза, сразу после того, как смертельная рана или атака распределяется на модель в юните EMPEROR'S CHILDREN из вашей армии.",
      target: "Этот юнит EMPEROR'S CHILDREN.",
      effect:
      "До конца фазы модели в вашем юните имеют способность Feel No Pain 6+, и способность Feel No Pain 4+ против смертельных ран.",
    ),
    Stratagem(
      name: "UNSHAKEABLE OPPONENTS",
      cpCost: 1,
      categories: [StratagemCategory.command],
      when: "Фаза Command.",
      target: "Один юнит EMPEROR'S CHILDREN из вашей армии.",
      effect:
      "До конца хода каждый раз, когда модель в вашем юните совершает атаку, вы можете игнорировать любые или все модификаторы к следующему: характеристике Ballistic Skill или Weapon Skill этой атаки; броску Hit; броску Wound.",
    ),
    Stratagem(
      name: "EMBRACE THE PAIN",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Начало фазы Fight.",
      target: "Один юнит EMPEROR'S CHILDREN INFANTRY из вашей армии.",
      effect:
      "До конца фазы каждый раз, когда вражеская модель в пределах Engagement Range от вашего юнита выбирает цели, она должна выбрать ваш юнит в качестве цели своих атак.",
    ),
    Stratagem(
      name: "MARTIAL PERFECTION",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Фаза Fight.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, вы можете перебросить бросок Hit.",
    ),
    Stratagem(
      name: "UNBOUND ARROGANCE",
      cpCost: 1,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
      when:
      "Ваша фаза Shooting или фаза Fight, сразу после того, как юнит EMPEROR'S CHILDREN из вашей армии уничтожает вражеский юнит.",
      target: "Этот юнит EMPEROR'S CHILDREN.",
      effect: "Увеличьте вашу клятву Slaanesh на 1.",
      restrictions: "Вы можете использовать эту стратагему только один раз за раунд боя.",
    ),
    Stratagem(
      name: "ARMOUR OF ABHORRENCE",
      cpCost: 1,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
      when:
      "Фаза Shooting вашего противника или фаза Fight, сразу после того, как вражеский юнит выбрал свои цели.",
      target:
      "Один юнит EMPEROR'S CHILDREN из вашей армии, который был выбран в качестве цели одной или более атак атакующего юнита.",
      effect:
      "До тех пор, пока атакующий юнит не закончит совершать свои атаки, каждый раз, когда атака нацелена на модель в вашем юните, ухудшите характеристику Armour Penetration этой атаки на 1.",
    ),
  ],

  restrictions: [
    Restriction.keywordBan(
      keywords: [Keyword.daemonettes],
      description: "",
    ),
  ],
);