import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final firestormAssaultForce = Detachment(
  name: "Firestorm Assault Force",
  additionalRules: [
    AdditionalRule(
      name: "Close-range Eradication",
      description: "Дальнобойное оружие, которым оснащены ADEPTUS ASTARTES модели из вашей армии, получает способность [ASSAULT], и каждый раз, когда атака таким оружием нацелена на юнит в пределах 12\", добавляйте 1 к характеристике Strength этой атаки.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Champion of Humanity",
      description: "Только для TACTICUS модели. Пока носитель возглавляет юнит, модели в нём могут игнорировать любые модификаторы к своим характеристикам и/или к любому броску или тесту (исключая модификаторы к спасброскам).",
    ),
    Enhancement(
      name: "War-tempered Artifice",
      description: "Только для ADEPTUS ASTARTES INFANTRY модели. Добавьте 3 к характеристике Strength ближнего оружия носителя.",
    ),
    Enhancement(
      name: "Forged in Battle",
      description: "Только для ADEPTUS ASTARTES модели. Пока носитель возглавляет юнит, один раз за ход после броска Hit или спасброска для модели в этом юните вы можете изменить результат на неизменённую 6.",
    ),
    Enhancement(
      name: "Adamantine Mantle",
      description: "Только для ADEPTUS ASTARTES модели. Каждый раз, когда по носителю распределяется атака, вычитайте 1 из характеристики Damage этой атаки. Если атака выполнялась Melta или Torrent оружием, установите Damage этой атаки равным 1.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Сhooting фаза противника или Fight фаза, сразу после того, как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До завершения всех атак вражеского юнита каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "CRUCIBLE OF BATTLE",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один ADEPTUS ASTARTES INFANTRY юнит из вашей армии, который ещё не стрелял или не сражался в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните атакует ближайшую допустимую цель в пределах 6\", добавляйте 1 к броску Wound.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "RAPID EMBARKATION",
      cpCost: 1,
      when: "Конец Fight фазы.",
      target: "Один ADEPTUS ASTARTES TRANSPORT юнит из вашей армии без посаженных в него моделей и один ADEPTUS ASTARTES INFANTRY юнит целиком в пределах 6\" от этого TRANSPORT.",
      effect: "Ваш INFANTRY юнит может загрузиться в этот TRANSPORT.",
      restrictions: "Нельзя выбрать INFANTRY юнит, находящийся в Engagement Range с вражескими юнитами, не способный обычно загрузиться в этот TRANSPORT или вышедший из TRANSPORT в этом ходу.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "IMMOLATION PROTOCOLS",
      cpCost: 2,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ещё не стрелял в этой фазе.",
      effect: "До конца фазы Torrent оружие, которым оснащены модели в этом юните, получает способность [DEVASTATING WOUNDS].",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "ONSLAUGHT OF FIRE",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который вышел из TRANSPORT в этом ходу и ещё не стрелял в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните атакует ближайшую допустимую цель в пределах 12\", добавляйте 1 к броску Hit. Если одна или более вражеских моделей уничтожены этими атаками, выберите одну из уничтоженных моделей: её юнит обязан пройти Battle-shock тест.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "BURNING VENGEANCE",
      cpCost: 1,
      when: "Сhooting фаза противника, сразу после того, как вражеский юнит завершил свои атаки.",
      target: "Один ADEPTUS ASTARTES TRANSPORT юнит из вашей армии, выбранный целью одной или нескольких вражеских атак.",
      effect: "Один загруженный в этот TRANSPORT юнит может выгрузиться как в Movement фазе и затем стрелять как в Shooting фазе, но должен целиться только в тот вражеский юнит и только если он является допустимой целью.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
  restrictions: [],
);
