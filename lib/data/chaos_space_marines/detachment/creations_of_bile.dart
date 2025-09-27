import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final creationsOfBile = Detachment(
  name: "Creations of Bile",
  additionalRules: [
    AdditionalRule(
      name: "Experimental Augmentations",
      description:
      "В начале сражения выберите, какие улучшения будут активны для HERETIC ASTARTES INFANTRY моделей (кроме DAMNED моделей) из вашей армии до конца сражения. "
          "Для этого выберите одно из списка ниже или случайным образом определите два, бросив два D6. "
          "Если FABIUS BILE является вашим WARLORD, при случайном определении улучшений вы можете перебросить один или оба куба. "
          "Повторяющиеся улучшения не дают дополнительного эффекта.\n\n"
          "1 – Cholinergic Accelerants: Добавьте 1 к характеристике Attacks оружия ближнего боя, которым оснащена эта модель.\n"
          "2 – Hyperadrenal Infusion: Добавьте 2\" к характеристике Move этой модели.\n"
          "3 – Paraneural Reactions: Улучшите характеристику Weapon Skill оружия ближнего боя, которым оснащена эта модель, на 1.\n"
          "4 – Supracutaneous Chitination: Улучшите характеристику Toughness этой модели на 1.\n"
          "5 – Macrotensile Sinews: Добавьте 1 к характеристике Strength оружия ближнего боя, которым оснащена эта модель.\n"
          "6 – Ophthalmic Enhancement: Улучшите характеристику Ballistic Skill дальнобойного оружия, которым оснащена эта модель, на 1.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Surgical Precision",
      description: "Только для HERETIC ASTARTES модели (кроме DAMNED моделей). Оружие ближнего боя носителя получает способность [PRECISION].",
    ),
    Enhancement(
      name: "Living Carapace",
      description: "Только для CHAOS LORD модели. Добавьте 1 к характеристике Wounds носителя и он получает способность Feel No Pain 5+.",
    ),
    Enhancement(
      name: "Helm of All-seeing",
      description: "Только для HERETIC ASTARTES INFANTRY модели (кроме DAMNED моделей). Вражеские юниты, прибывающие на поле боя из Reserves, не могут быть выставлены в пределах 12\" от носителя.",
    ),
    Enhancement(
      name: "Prime Test Subject",
      description: "Только для HERETIC ASTARTES INFANTRY модели (кроме DAMNED моделей). Добавьте 1 к характеристике Damage оружия ближнего боя носителя. Каждый раз, когда носитель совершает атаку в ближнем бою, вы можете перебросить бросок на попадание.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "MONSTROUS VISAGES",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из броска попадания.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "MASTERS ARE WATCHING",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните уничтожается, если она ещё не сражалась в этой фазе, бросьте один D6, вычитая 1 из результата, если это DAMNED юнит: при результате 4+ не удаляйте модель с поля боя. Эта уничтоженная модель может сражаться после того, как атакующий юнит завершит свои атаки, а затем удаляется с поля боя.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "SPECIMENS FOR THE SPIDER",
      cpCost: 2,
      when: "Fight фаза.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку в ближнем бою по CHARACTER юниту, вы можете перебросить бросок на ранение. После того как ваш юнит сразился, если одна или более вражеских CHARACTER моделей были уничтожены в результате этих атак, выберите один вражеский юнит в пределах 6\" от вашего юнита. Этот вражеский юнит должен пройти Battle-shock тест. Если вражеский WARLORD был уничтожен в результате этих атак, каждый вражеский юнит в пределах 6\" от вашего юнита должен пройти Battle-shock тест вместо этого.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "DELAYED MUTATIONS",
      cpCost: 2,
      when: "Ваша Command фаза.",
      target: "Один HERETIC ASTARTES INFANTRY юнит (кроме DAMNED юнитов) из вашей армии.",
      effect: "Ваш юнит получает D3 mortal wounds. Затем выберите одно улучшение (см. Experimental Augmentations). До начала вашей следующей Command фазы модели в вашем юните имеют выбранное улучшение в дополнение к любым другим.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "DIABOLIC REGENERATION",
      cpCost: 1,
      when: "Ваша Command фаза.",
      target: "Один HERETIC ASTARTES INFANTRY юнит (кроме DAMNED юнитов) из вашей армии.",
      effect: "Одна уничтоженная модель (кроме CHARACTER моделей) возвращается в ваш юнит. Если ваш юнит имеет ключевое слово BATTLELINE, вместо этого верните D3 уничтоженные модели (кроме CHARACTER моделей).",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "AUTOSTIMULANTS",
      cpCost: 1,
      when: "Начало вашей Charge фазы.",
      target: "Один HERETIC ASTARTES INFANTRY юнит из вашей армии.",
      effect: "До конца хода ваш юнит может объявить charge в тот же ход, в который он сделал Advance.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),

  ],
  restrictions: [],
);
