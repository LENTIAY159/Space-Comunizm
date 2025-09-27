import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final unforgivenTaskForce = Detachment(
  name: "Unforgiven Task Force",
  additionalRules: [
    AdditionalRule(
      name: "Grim Resolve",
      description: "Пока ADEPTUS ASTARTES юнит из вашей армии находится в состоянии Battle-shock, измените характеристику Objective Control моделей в этом юните на 1 вместо 0. В вашу Command phase выберите один ADEPTUS ASTARTES юнит из вашей армии; до начала вашей следующей Command phase добавляйте 1 к характеристике Objective Control моделей в этом юните.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Shroud of Heroes",
      description: "Только для ADEPTUS ASTARTES модели. Когда носитель впервые будет уничтожен, бросьте один D6 в конце фазы. При результате 2+ верните носителя на поле боя как можно ближе к месту, где он был уничтожен, но не в Engagement Range с вражескими юнитами, с 3 оставшимися ранами (если носитель находился в состоянии Battle-shock в момент уничтожения, он возвращается с полным числом ран).",
    ),
    Enhancement(
      name: "Stubborn Tenacity",
      description: "Только для ADEPTUS ASTARTES модели. Пока носитель возглавляет юнит, каждый раз, когда модель в этом юните совершает атаку, добавляйте 1 к броску на попадание, если этот юнит находится ниже своей Starting Strength, и также добавляйте 1 к броску на ранение, если этот юнит в состоянии Battle-shock и ниже своей Starting Strength.",
    ),
    Enhancement(
      name: "Weapons of the First Legion",
      description: "Только для ADEPTUS ASTARTES модели. Добавьте 1 к характеристикам Attacks, Strength и Damage оружия ближнего боя носителя. Пока носитель находится в состоянии Battle-shock, вместо этого добавляйте 2 к характеристикам Attacks, Strength и Damage оружия ближнего боя носителя.",
    ),
    Enhancement(
      name: "Pennant of Remembrance",
      description: "Только для ANCIENT модели. Пока носитель возглавляет юнит, модели в этом юните получают способность Feel No Pain 6+. Пока этот юнит находится в состоянии Battle-shock, модели в нём получают способность Feel No Pain 4+.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Armour of Contempt",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "Пока атакующий юнит не завершил свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Unforgiven Fury",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы оружие, которым оснащены модели в вашем юните, получает способность [LETHAL HITS]. Кроме того, если один или более ADEPTUS ASTARTES юнитов из вашей армии в состоянии Battle-shock, то до конца фазы каждый раз, когда модель в вашем юните совершает атаку, успешный неизменённый бросок на попадание 5+ считается Critical Hit.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Intractable",
      cpCost: 1,
      when: "Ваша Movement фаза, сразу после того как ADEPTUS ASTARTES юнит из вашей армии сделал Fall Back.",
      target: "Этот ADEPTUS ASTARTES юнит.",
      effect: "До конца хода ваш юнит может стрелять и объявлять charge в тот же ход, в который сделал Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "Fire Discipline",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы дальнобойное оружие, которым оснащены модели в этом юните, получает способности [ASSAULT], [HEAVY] и [IGNORES COVER].",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Grim Retribution",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит произвёл стрельбу.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, у которого в результате атак атакующего юнита была уничтожена одна или более моделей.",
      effect: "Ваш юнит может стрелять, как если бы это была ваша Shooting фаза, но он должен нацелиться на вражеский юнит, который только что атаковал, и только если этот вражеский юнит является допустимой целью.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Unbreakable Lines",
      cpCost: 2,
      when: "Charge фаза противника, сразу после того как вражеский юнит завершил Charge move.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии в Engagement Range с этим вражеским юнитом.",
      effect: "До конца хода каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из броска на ранение.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [
    Restriction.exclusiveKeywordBan(
      factionKeywords: [FactionKeyword.adeptusAstartes],
      description: "Ваша армия может включать DARK ANGELS юниты, но не может включать ADEPTUS ASTARTES юниты из других Чаптеров.",
    ),
  ],
);
