import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment slaaneshsChosen = Detachment(
  name: "Slaanesh's Chosen",

  additionalRules: [
    AdditionalRule(
      name: "Internal Rivalries",
      description:
      "Подразделения EMPEROR'S CHILDREN CHARACTER из вашей армии могут игнорировать любые или все модификаторы к их характеристике Move и любые или все модификаторы к броскам Advance и Charge, совершенным для них.\n\nВ начале битвы подразделение вашего WARLORD является Favoured Champions вашей армии. Первый раз в каждый ход игрока, когда подразделение EMPEROR'S CHILDREN CHARACTER из вашей армии уничтожает вражеское подразделение, после разрешения всех его атак, это подразделение CHARACTER становится новыми Favoured Champions вашей армии, заменяя старых.\n\nКаждый раз, когда модель в подразделении Favoured Champions вашей армии совершает атаку, вы можете перебросить бросок Wound.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Eager to Prove",
      description:
      "Только модель EMPEROR'S CHILDREN. Вы можете перебрасывать броски Charge, совершенные для подразделения носителя. Пока подразделение носителя является Favoured Champions вашей армии, добавьте 2\" к характеристике Move моделей в этом подразделении.",
    ),
    Enhancement(
      name: "Repulsed by Weakness",
      description:
      "Только модель EMPEROR'S CHILDREN. Каждый раз, когда вражеское подразделение (исключая MONSTERS и VEHICLES) в пределах Engagement Range от подразделения носителя Falls Back, модели в этом вражеском подразделении должны пройти Desperate Escape tests. При этом, если подразделение носителя является Favoured Champions вашей армии, вычтите 1 из каждого из этих Desperate Escape tests.",
    ),
    Enhancement(
      name: "Proud and Vainglorious",
      description:
      "Только модель EMPEROR'S CHILDREN. Вы можете перебрасывать Battle-shock и Leadership tests, пройденные для подразделения носителя. Пока подразделение носителя является Favoured Champions вашей армии, добавьте 1 к характеристике Objective Control моделей в этом подразделении.",
    ),
    Enhancement(
      name: "Slayer of Champions",
      description:
      "Только модель EMPEROR'S CHILDREN. Оружие ближнего боя носителя имеет способность [PRECISION], и каждый раз, когда носитель совершает атаку ближнего боя, нацеленную на подразделение CHARACTER, улучшите характеристики Strength и Armour Penetration этой атаки на 1.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "DEVOTED DUELLISTS",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Fight phase.",
      target:
      "Одно или более подразделений EMPEROR'S CHILDREN CHARACTER из вашей армии, которые не были выбраны для сражения в эту фазу.",
      effect:
      "Выберите одно вражеское подразделение. До конца фазы оружие ближнего боя, которым оснащены модели в этих подразделениях CHARACTER, имеет способность [SUSTAINED HITS 1] при нацеливании на это вражеское подразделение.",
    ),
    Stratagem(
      name: "BEAUTIFUL DEATH",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when:
      "Fight phase, сразу после того, как вражеское подразделение выбрало свои цели.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN CHARACTER из вашей армии, которое было выбрано в качестве цели одной или более атак атакующего подразделения.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем подразделении уничтожается, если эта модель не сражалась в эту фазу, бросьте одну D6, добавляя 1 к результату, если ваше подразделение является Favoured Champions вашей армии. На 4+ не убирайте уничтоженную модель с игры; она может сражаться после того, как атакующее подразделение закончит совершать свои атаки, и затем убирается с игры.",
    ),
    Stratagem(
      name: "HEIGHTENED JEALOUSY",
      cpCost: 1,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
      when:
      "Ваша Shooting phase или Fight phase, сразу после того, как подразделение EMPEROR'S CHILDREN CHARACTER становится Favoured Champions вашей армии, или сразу после того, как подразделение Favoured Champions вашей армии уничтожает вражеское подразделение.",
      target: "Подразделение Favoured Champions вашей армии.",
      effect:
      "До конца фазы каждый раз, когда модель в подразделении EMPEROR'S CHILDREN CHARACTER из вашей армии, которое не является Favoured Champions вашей армии, совершает атаку, добавьте 1 к характеристике Strength этой атаки.",
    ),
    Stratagem(
      name: "DIABOLIC MAJESTY",
      cpCost: 1,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
      when:
      "Ваша Shooting phase или Fight phase, сразу после того, как подразделение EMPEROR'S CHILDREN CHARACTER становится Favoured Champions вашей армии.",
      target: "Это подразделение EMPEROR'S CHILDREN.",
      effect:
      "Каждое вражеское подразделение в пределах 6\" от вашего подразделения должно пройти Battle-shock test, вычитая 1 из результата.",
      restrictions: "Вы можете использовать эту Stratagem только один раз за раунд битвы.",
    ),
    Stratagem(
      name: "REFUSAL TO BE OUTDONE",
      cpCost: 1,
      categories: [StratagemCategory.charge],
      when: "Ваша Charge phase.",
      target: "Одно подразделение EMPEROR'S CHILDREN CHARACTER из вашей армии.",
      effect:
      "Выберите одно вражеское подразделение в пределах Engagement Range одного или более подразделений из вашей армии. До конца фазы каждый раз, когда ваше подразделение объявляет charge, если это вражеское подразделение является одной из целей этого charge, добавьте 2 к броску Charge.",
    ),
    Stratagem(
      name: "VENGEFUL SURGE",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when:
      "Shooting phase вашего противника, сразу после того, как вражеское подразделение выбрало свои цели.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN CHARACTER из вашей армии, которое было выбрано в качестве цели одной или более атак атакующего подразделения.",
      effect:
      "После того, как атакующее подразделение выстрелило, ваше подразделение может совершить Surge move. Для этого бросьте одну D6: каждая модель в вашем подразделении может переместиться на расстояние в дюймах до результата, но ваше подразделение должно закончить это перемещение как можно ближе к ближайшему вражескому подразделению. При этом эти модели могут быть перемещены в пределы Engagement Range этого вражеского подразделения. Если ваше подразделение не является Favoured Champions вашей армии, вы можете перебросить кость, чтобы определить расстояние его Surge move.",
    ),
  ],

  restrictions: [
    Restriction.keywordBan(
      keywords: [Keyword.daemonettes],
      description: "",
    ),
  ],
);