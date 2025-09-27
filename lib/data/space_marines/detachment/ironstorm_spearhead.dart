import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';




final ironstormSpearhead = Detachment(
  name: "Ironstorm Spearhead",
  additionalRules: [
    AdditionalRule(
      name: "Armoured Wrath",
      description: "Один раз за фазу для каждого ADEPTUS ASTARTES юнита из вашей армии вы можете перебросить один бросок на Hit, один бросок на Wound или один бросок на Damage для модели в этом юните.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Target Augury Web",
      description: "Только для TECHMARINE модели. В вашей Command фазе выберите одну ADEPTUS ASTARTES VEHICLE модель в пределах 6\" от носителя. До начала вашей следующей Command фазы оружие, которым оснащена эта VEHICLE модель, получает способность [LETHAL HITS].",
    ),
    Enhancement(
      name: "The Flesh is Weak",
      description: "Только для ADEPTUS ASTARTES модели. Носитель получает способность Feel No Pain 4+.",
    ),
    Enhancement(
      name: "Adept of the Omnissiah",
      description: "Только для TECHMARINE модели. Один раз за раунд битвы, когда спасбросок провален для дружественной ADEPTUS ASTARTES VEHICLE модели в пределах 6\" от носителя, вы можете изменить характеристику Damage этой атаки на 0.",
    ),
    Enhancement(
      name: "Master of Machine War",
      description: "Только для ADEPTUS ASTARTES модели. В вашей Command фазе выберите одну ADEPTUS ASTARTES VEHICLE модель в пределах 6\" от носителя. До начала вашей следующей Command фазы этот VEHICLE может стрелять, даже если он Fell Back или Advanced в этот ход.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "UNBOWED CONVICTION",
      cpCost: 1,
      when: "Command phase",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ниже своей Starting Strength",
      effect: "До конца хода ваш юнит может игнорировать любые модификаторы к своим характеристикам и/или к любому броску или тесту (кроме модификаторов к спасброскам)",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал цели",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который был выбран целью одной или нескольких атак вражеского юнита",
      effect: "До окончания всех атак вражеского юнита каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "MERCY IS WEAKNESS",
      cpCost: 2,
      when: "Ваша Shooting фаза или Fight фаза",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, который ещё не стрелял и не сражался в этой фазе",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по юниту, находящемуся ниже своей Starting Strength, эта атака получает способность [SUSTAINED HITS 1], а при атаке VEHICLE моделью успешный неизменённый бросок на Hit 5+ считается Critical Hit",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "VENGEFUL ANIMUS",
      cpCost: 1,
      when: "Любая фаза, сразу после того как ADEPTUS ASTARTES VEHICLE модель из вашей армии с Deadly Demise была уничтожена",
      target: "Та ADEPTUS ASTARTES VEHICLE модель. Вы можете использовать эту Stratagem для этой модели, даже если она только что была уничтожена",
      effect: "Не выполняйте бросок D6 для определения mortal wounds от способности Deadly Demise этой модели. Вместо этого mortal wounds наносятся автоматически",
      categories: StratagemCategory.values,
    ),
    Stratagem(
      name: "ANCIENT FURY",
      cpCost: 1,
      when: "Ваша Command phase",
      target: "Одна ADEPTUS ASTARTES WALKER модель из вашей армии",
      effect: "До начала вашей следующей Command фазы улучшите характеристики Move, Toughness, Leadership и Objective Control этой модели на 1 и каждый раз, когда она совершает атаку, добавляйте 1 к броску на Hit",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "POWER OF THE MACHINE SPIRIT",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того как вражеский юнит завершил свои атаки",
      target: "Один ADEPTUS ASTARTES VEHICLE юнит из вашей армии, который был понижен до Below Half-strength в результате атак этого вражеского юнита",
      effect: "Ваш юнит может стрелять, как если бы это была ваша Shooting фаза, но при этом он должен целиться только в этот вражеский юнит и может это сделать только если этот вражеский юнит является допустимой целью",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
