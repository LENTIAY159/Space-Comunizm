import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final veteransOfTheLongWar = Detachment(
  name: "Veterans of the Long War",
  additionalRules: [
    AdditionalRule(
      name: "Focus of Hatred",
      description: "В начале вашей Command фазы выберите один юнит из армии противника в качестве вашей focus of hatred. До начала вашей следующей Command фазы каждый раз, когда HERETIC ASTARTES модель из вашей армии (кроме DAMNED моделей) совершает атаку по вашей focus of hatred, вы можете перебросить бросок на попадание.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Eager for Vengeance",
      description: "Только для HERETIC ASTARTES модели (кроме DAMNED моделей). Юнит носителя может стрелять и объявлять charge в тот ход, когда сделал Fall Back. Каждый раз, когда модель в юните носителя совершает атаку по вашей focus of hatred, если юнит носителя сделал Fall Back в этот ход, добавляйте 1 к броску на попадание, а каждый раз, когда вы выбираете вашу focus of hatred целью charge этого юнита, добавляйте 1 к броску charge.",
    ),
    Enhancement(
      name: "Eye of Abaddon",
      description: "Только для HERETIC ASTARTES модели (кроме DAMNED моделей). Пока носитель находится на поле боя, каждый раз, когда ваша focus of hatred уничтожается, бросайте один D6: при результате 4+ вы получаете 1CP.",
    ),
    Enhancement(
      name: "Mark of Legend",
      description: "Только для HERETIC ASTARTES модели (кроме DAMNED моделей). Один раз за ход вы можете перебросить один бросок на попадание, один бросок на ранение или один спасбросок для носителя.",
    ),
    Enhancement(
      name: "Warmaster's Gift",
      description: "Только для CHAOS LORD модели. Каждый раз, когда носитель совершает атаку по вашей focus of hatred, неизменённый успешный бросок на ранение 5+ считается Critical Wound.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ENDLESS IRE",
      cpCost: 2,
      when: "Любая фаза, сразу после того как ваша focus of hatred уничтожена.",
      target: "Один HERETIC ASTARTES CHARACTER юнит из вашей армии (кроме DAMNED юнитов)",
      effect: "Выберите один вражеский юнит в пределах 12\" и в зоне видимости вашего юнита. До начала вашей следующей Command фазы этот вражеский юнит считается вашей focus of hatred.",
      restrictions: null,
      categories: [StratagemCategory.command, StratagemCategory.move, StratagemCategory.shooting, StratagemCategory.charge, StratagemCategory.fight],
    ),
    Stratagem(
      name: "CONTEMPTUOUS DISREGARD",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии (кроме DAMNED юнитов), выбранный как цель одной или более атак атакующего юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "BRINGERS OF DESPAIR",
      cpCost: 2,
      when: "Начало Fight фазы.",
      target: "Один HERETIC ASTARTES юнит из вашей армии (кроме DAMNED юнитов), находящийся в Engagement Range с вашей focus of hatred.",
      effect: "До конца фазы ваш юнит получает способность Fights First.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "BLACK CRUSADE",
      cpCost: 1,
      when: "Ваша Movement фаза",
      target: "Один HERETIC ASTARTES INFANTRY или HERETIC ASTARTES MOUNTED юнит из вашей армии (кроме DAMNED юнитов).",
      effect: "До конца хода ваш юнит может стрелять в тот ход, когда сделал Advance или Fall Back, и bolt pistols, boltguns и combi-bolters, которыми оснащены модели в вашем юните, получают способность [DEVASTATING WOUNDS], пока ваш юнит не нанёс 6 или более ран с этой способностью в этом ходу.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "LET THE GALAXY BURN",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии (кроме TZEENTCH юнитов), который ещё не был выбран для стрельбы в этой фазе",
      effect: "До конца фазы дальнобойное оружие, которым оснащены модели в вашем юните, получает способность [IGNORES COVER], а характеристика Attacks Torrent оружия, которым оснащены модели в вашем юните, становится 6.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "MILLENNIA OF EXPERIENCE",
      cpCost: 1,
      when: "Movement фаза противника, сразу после того как вражеский юнит завершил Normal, Advance или Fall Back перемещение.",
      target: "Один HERETIC ASTARTES INFANTRY или HERETIC ASTARTES MOUNTED юнит из вашей армии (кроме DAMNED юнитов), находящийся в пределах 9\" от этого вражеского юнита и не в Engagement Range с одним или более вражескими юнитами.",
      effect: "Ваш юнит может выполнить Normal move на расстояние до 6\".",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
  ],
  restrictions: [],
);