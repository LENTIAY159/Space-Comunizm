import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final vanguardSpearhead = Detachment(
  name: "Vanguard Spearhead",
  additionalRules: [
    AdditionalRule(
      name: "Shadow Masters",
      description:
      "Каждый раз, когда дальняя атака направлена на отряд ADEPTUS ASTARTES из вашей армии, если атакующая модель не находится в пределах 12\", вычитайте 1 из броска на попадание, и цель получает Benefit of Cover против этой атаки.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "The Blade Driven Deep",
      description:
      "Только для модели ADEPTUS ASTARTES INFANTRY. Пока носитель возглавляет отряд, модели в этом отряде имеют способность Infiltrators.",
    ),
    Enhancement(
      name: "Ghostweave Cloak",
      description:
      "Только для модели ADEPTUS ASTARTES. Носитель имеет способности Stealth и Lone Operative.",
    ),
    Enhancement(
      name: "Execute and Redeploy",
      description:
      "Только для модели PHOBOS. В вашу фазу Shooting, после того как отряд носителя произвел стрельбу, если этот отряд не находится в Engagement Range с одним или более вражескими отрядами, он может совершить Normal move до 6\". Если он это делает, до конца хода этот отряд не может объявлять Charge. Это не может позволить отряду носителя перемещаться более одного раза в вашу фазу Shooting.",
    ),
    Enhancement(
      name: "Shadow War Veteran",
      description:
      "Только для модели PHOBOS. Получите следующую способность:\nLord of Deceit (Aura): Каждый раз, когда ваш оппонент использует Stratagem, нацеливаясь на отряд из своей армии, если этот отряд находится в пределах 12\" от этой модели, увеличьте стоимость применения этой Stratagem на 1CP.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "A DEADLY PRIZE",
      cpCost: 1,
      when: "Начало фазы Command",
      target:
      "Один отряд ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED из вашей армии в пределах досягаемости маркера цели, который вы контролируете",
      effect:
      "Этот маркер цели считается Sabotaged и остаётся под вашим контролем, даже если у вас нет моделей в пределах досягаемости, пока ваш оппонент не возьмёт его под контроль в начале или в конце любого хода. Пока маркер цели Sabotaged и под вашим контролем, каждый раз, когда вражеский отряд завершает Normal, Advance, Fall Back или Charge перемещение в пределах досягаемости этого маркера цели, бросьте D6: при результате 2+, этот вражеский отряд получает D3 mortal wounds.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when:
      "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target:
      "Один отряд ADEPTUS ASTARTES из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect:
      "Пока атакующий отряд не закончит свои атаки, каждый раз, когда атака направлена на ваш отряд, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SURGICAL STRIKES",
      cpCost: 2,
      when: "Фаза Fight",
      target:
      "Один отряд ADEPTUS ASTARTES INFANTRY из вашей армии, который ещё не был выбран для боя в этой фазе",
      effect:
      "До конца фазы оружие ближнего боя, которым оснащены модели в вашем отряде, получает способность [PRECISION].",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "STRIKE FROM THE SHADOWS",
      cpCost: 1,
      when: "Ваша фаза Shooting",
      target:
      "Один отряд ADEPTUS ASTARTES INFANTRY из вашей армии, который ещё не был выбран для стрельбы в этой фазе",
      effect:
      "До конца фазы, каждый раз, когда модель в вашем отряде совершает дальнюю атаку по вражескому отряду, находящемуся более чем в 12\" от неё, улучшайте характеристики Ballistic Skill и Armour Penetration этой атаки на 1. Если одна или несколько вражеских моделей уничтожены в результате этих атак, выберите одну из уничтоженных моделей; отряд этой модели должен пройти тест Battle-shock.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "CALCULATED FEINT",
      cpCost: 1,
      when:
      "Фаза Charge вашего оппонента, сразу после того как вражеский отряд объявил атаку",
      target:
      "Один отряд ADEPTUS ASTARTES INFANTRY из вашей армии, выбранный целью этой атаки",
      effect:
      "Ваш отряд может совершить Normal move до D6\", или до 6\" вместо этого, если это отряд PHOBOS или SCOUT SQUAD.",
      restrictions:
      "Вы не можете выбрать отряд, находящийся в Engagement Range одного или нескольких вражеских отрядов.",
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "GUERRILLA TACTICS",
      cpCost: 1,
      when: "Конец фазы Fight вашего оппонента",
      target:
      "До двух отрядов PHOBOS и/или SCOUT SQUAD из вашей армии или один другой отряд ADEPTUS ASTARTES INFANTRY из вашей армии",
      effect:
      "Уберите эти отряды с поля боя и поместите их в Strategic Reserves.",
      restrictions:
      "Каждый отряд, выбранный для этой Stratagem, должен находиться более чем в 3\" от всех вражеских моделей.",
      categories: [StratagemCategory.fight],
    ),
  ],
);

