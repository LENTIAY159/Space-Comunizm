import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final gladiusTaskForce = Detachment(
  name: "Gladius Task Force",

  additionalRules: [
    AdditionalRule(
      name: "Combat Doctrines",
      description: "В начале вашей Command фазы вы можете выбрать одну из указанных Combat Doctrines. "
          "До начала вашей следующей Command фазы выбранная Combat Doctrine активна, и её эффекты применяются ко всем ADEPTUS ASTARTES юнитам вашей армии. Вы можете выбрать каждую Combat Doctrine только один раз за сражение."
          "\nDevastator Doctrine: этот юнит может стрелять в ходу, в котором он выполнял Advance."
          "\nTactical Doctrine: этот юнит может стрелять и объявлять charge в ходу, в котором он выполнял Fell Back."
          "\nAssault Doctrine: этот юнит может объявлять charge в ходу, в котором он выполнял Advance.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Artificer Armour",
      description: "Только для ADEPTUS ASTARTES моделей. Носитель имеет Save 2+ и способность Feel No Pain 5+.",
    ),
    Enhancement(
      name: "The Honour Vehement",
      description: "Только для ADEPTUS ASTARTES моделей. Добавьте 1 к характеристикам Attacks и Strength melee weapons носителя. "
          "Если носитель находится под эффектом Assault Doctrine, вместо этого добавьте 2 к характеристикам Attacks и Strength melee weapons носителя.",
    ),
    Enhancement(
      name: "Adept of the Codex",
      description: "Только для CAPTAIN модели. В начале вашей Command фазы, если носитель находится на поле боя, вместо выбора Combat Doctrine для армии вы можете выбрать Tactical Doctrine. "
          "В этом случае до начала вашей следующей Command фазы эта Combat Doctrine активна только для юнита носителя, даже если вы уже выбрали её для армии в этом сражении.",
    ),
    Enhancement(
      name: "Fire Discipline",
      description: "Только для ADEPTUS ASTARTES моделей. Пока носитель возглавляет юнит, ranged weapons моделей в нём имеют способность [SUSTAINED HITS 1]. "
          "Кроме того, если юнит носителя находится под эффектом Devastator Doctrine, вы можете перебрасывать Advance rolls, сделанные для этого юнита.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того, как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До завершения всех атак вражеского юнита каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "ONLY IN DEATH DOES DUTY END",
      cpCost: 2,
      when: "Fight фаза, сразу после того, как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит вашей армии, выбранный целью одной или нескольких атак вражеского юнита.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните уничтожается, если она ещё не сражалась в этой фазе, не удаляйте её с поля. "
          "Уничтоженная модель может сражаться после того, как юнит противника завершит свои атаки, а затем удаляется.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Honour the Chapter",
      cpCost: 1,
      when: "Fight фаза",
      target: "Один ADEPTUS ASTARTES юнит вашей армии",
      effect: "До конца фазы melee weapons моделей в вашем юните получают способность [LANCE]. "
          "Если ваш юнит находится под эффектом Assault Doctrine, до конца фазы также улучшайте характеристику Armour Penetration этих оружий на 1.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Adaptive Strategy",
      cpCost: 2,
      when: "Your Command phase",
      target: "Один ADEPTUS ASTARTES юнит вашей армии",
      effect: "Выберите Devastator Doctrine, Tactical Doctrine или Assault Doctrine. "
          "До начала вашей следующей Command фазы выбранная Combat Doctrine активна только для этого юнита вместо любых других, активных для вашей армии, даже если вы уже выбирали её ранее.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Storm of Fire",
      cpCost: 1,
      when: "Your Shooting phase",
      target: "Один ADEPTUS ASTARTES юнит вашей армии, который ещё не стрелял в этой фазе",
      effect: "До конца фазы ranged weapons моделей в вашем юните получают способность [IGNORES COVER]. "
          "Если ваш юнит находится под эффектом Devastator Doctrine, до конца фазы также улучшайте характеристику Armour Penetration этих оружий на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Squad Tactics",
      cpCost: 2,
      when: "Movement фаза противника, сразу после того, как вражеский юнит завершил Normal, Advance или Fall Back move",
      target: "Один ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES MOUNTED юнит вашей армии, находящийся в пределах 9\" от этого вражеского юнита",
      effect: "Ваш юнит может выполнить Normal move до D6\", или до 6\" вместо этого, если он находится под эффектом Tactical Doctrine.",
      restrictions: "Нельзя выбирать юнит, находящийся в Engagement Range с одним или более вражескими юнитами.",
      categories: [StratagemCategory.move],
    ),
  ],

  restrictions: [],
);
