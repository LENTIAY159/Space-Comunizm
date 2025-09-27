import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final chaosCult = Detachment(
  name: "Chaos Cult",
  additionalRules: [
    AdditionalRule(
      name: "Desperate Devotion",
      description: "Каждый раз, когда DAMNED юнит из вашей армии со способностью Dark Pacts выбирается для выполнения Normal или Advance перемещения или объявления charge (кроме юнитов, которые прибыли из Reserves в этот ход), он может заключить Desperate Pact. Если он это делает, до конца фазы добавьте 2 к характеристике Move моделей в этом юните и добавьте 2 к броскам charge, сделанным для этого юнита. Каждый раз, когда юнит заключает Desperate Pact, он должен сначала пройти Leadership test; если тест провален, этот юнит получает D3 mortal wounds до применения эффектов Desperate Pact.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Amulet of Tainted Vigour",
      description: "Только для DARK APOSTLE модели. В вашу Command phase вы можете вернуть до D3 уничтоженных DAMNED моделей (кроме CHARACTER моделей) в юнит носителя.",
    ),
    Enhancement(
      name: "Cultist's Brand",
      description: "Только для DARK APOSTLE или DAMNED модели. Если каждая другая модель в юните носителя (кроме Dark Disciples) является DAMNED, вы можете перебросить броски Advance и Charge для юнита носителя.",
    ),
    Enhancement(
      name: "Incendiary Goad",
      description: "Только для DARK APOSTLE или DAMNED модели. Пока юнит носителя имеет меньше моделей, чем Starting Strength, добавляйте 1 к характеристике Strength оружия ближнего боя, которым оснащены DAMNED модели в этом юните, а пока юнит находится в состоянии Below Half-strength, добавляйте также 1 к характеристике Attacks этих оружий.",
    ),
    Enhancement(
      name: "Warped Foresight",
      description: "Только для DARK APOSTLE или DAMNED модели. Пока носитель возглавляет юнит со способностью Scouts 6\", каждая модель в юните носителя имеет способность Scouts 6\".",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "CHOSEN FOR GLORY",
      cpCost: 1,
      when: "Ваша Shooting phase или Fight фаза.",
      target: "Один DAMNED юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "Ваш юнит может заключить Desperate Pact. Если он это делает, до конца фазы каждый раз, когда модель в вашем юните совершает атаку, вы можете перебросить бросок на попадание, а если ваш юнит не провалил Leadership test при заключении Desperate Pact, вы также можете перебросить бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SELFLESS DEMISE",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один DAMNED юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "Пока атакующий юнит не завершил все свои атаки, каждый раз, когда модель в вашем юните уничтожается, бросайте один D6: при результате 6 атакующий юнит получает 1 mortal wound после того, как завершит все свои атаки.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "INFERNAL SACRIFICE",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один DAMNED юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "Ваш юнит может заключить Desperate Pact. Если он это делает, он получает D3 mortal wounds (в дополнение к тем, что получены за провал Leadership test), и до конца фазы добавляйте 1 к характеристике Attacks оружия ближнего боя, которым оснащены модели в вашем юните, а если юнит не провалил Leadership test при заключении Desperate Pact, улучшите характеристику Strength этих оружий на 1 до конца фазы.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "CRAZED FOCUS",
      cpCost: 1,
      when: "Ваша Shooting phase.",
      target: "Один DAMNED юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "Ваш юнит может заключить Desperate Pact. Если он это делает, до конца фазы каждая атака модели в вашем юните получает +1 к характеристике Armour Penetration, а если ваш юнит не провалил Leadership test при заключении Desperate Pact, также увеличьте характеристику Strength этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "RECKLESS HASTE",
      cpCost: 1,
      when: "Ваша Charge фаза",
      target: "Один DAMNED юнит из вашей армии.",
      effect: "До конца хода ваш юнит может объявить charge в тот же ход, в который сделал Advance.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "MORTAL THRALLS",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита, и один дружественный DAMNED юнит в пределах 3\" от вашего юнита и видимый как вашему юниту, так и атакующему юниту.",
      effect: "До конца фазы, пока ваш DAMNED юнит находится на поле боя, каждый раз, когда противник должен сделать бросок на ранение для атаки, нацеленной на ваш HERETIC ASTARTES юнит, если ваш DAMNED юнит виден атакующей модели и является допустимой целью этой атаки, бросок не выполняется; вместо этого ваш DAMNED юнит получает количество mortal wounds, равное характеристике Damage этой атаки.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
  restrictions: [],
);
