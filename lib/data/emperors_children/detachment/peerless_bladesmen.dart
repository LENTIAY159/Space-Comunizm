import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment peerlessBladesmen = Detachment(
  name: "Peerless Bladesmen",

  additionalRules: [
    AdditionalRule(
      name: "Exquisite Swordsmanship",
      description:
      "Каждый раз, когда подразделение EMPEROR'S CHILDREN из вашей армии выбирается для сражения, если оно совершило Charge move в этот ход, выберите одну из способностей ниже. При разрешении этих атак оружие ближнего боя, которым оснащены модели в этом подразделении, имеет эту способность:\n[LETHAL HITS]\n[SUSTAINED HITS 1]",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Faultless Opportunist",
      description:
      "Только модель EMPEROR'S CHILDREN. Вы можете нацелить подразделение носителя Heroic Intervention Stratagem за 0CP, и можете делать это, даже если вы уже нацелили другое подразделение этой Stratagem в эту фазу.",
    ),
    Enhancement(
      name: "Blinding Speed",
      description:
      "Только модель EMPEROR'S CHILDREN. Один раз за битву, в начале Fight phase, носитель может использовать это Enhancement. Если он это делает, до конца фазы модели в подразделении носителя имеют способность Fights First.",
    ),
    Enhancement(
      name: "Distortion",
      description:
      "Только модель EMPEROR'S CHILDREN. Добавьте 1 к характеристикам Attacks и Damage оружия ближнего боя, которым оснащен носитель.",
    ),
    Enhancement(
      name: "Rise to the Challenge",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Один раз за битву, в конце Fight phase, если носитель находится в пределах Engagement Range трех или более моделей противника, он может использовать это Enhancement. Если он это делает, носитель может сражаться один дополнительный раз. При этом вы можете выбрать одну способность, используя правило отряда Exquisite Swordsmanship, чтобы применить к этим атакам.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "DEFT PARRY",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when:
      "Fight phase, сразу после того, как вражеское подразделение выбрало свои цели.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое было выбрано в качестве цели одной или более атак атакующего подразделения.",
      effect:
      "До конца фазы каждый раз, когда атака нацеливается на ваше подразделение, вычтите 1 из броска Hit.",
    ),
    Stratagem(
      name: "DEATH ECSTASY",
      cpCost: 2,
      categories: [StratagemCategory.fight],
      when:
      "Fight phase, сразу после того, как вражеское подразделение выбрало свои цели.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое было выбрано в качестве цели одной или более атак атакующего подразделения.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем подразделении уничтожается, если эта модель не сражалась в эту фазу, не убирайте ее с игры. Уничтоженная модель может сражаться после того, как атакующее подразделение закончит совершать свои атаки, и затем убирается с игры.",
    ),
    Stratagem(
      name: "INCESSANT VIOLENCE",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when:
      "Fight phase, прямо перед тем, как подразделение EMPEROR'S CHILDREN из вашей армии совершает Consolidates.",
      target: "Это подразделение EMPEROR'S CHILDREN.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем подразделении совершает Consolidation move, она может перемещаться до 6\" вместо до 3\", при условии, что ваше подразделение заканчивает это Consolidation move в пределах Engagement Range одного или более вражеских подразделений.",
    ),
    Stratagem(
      name: "CRUEL BLADESMAN",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Fight phase.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое совершило Charge move в этот ход и не было выбрано для сражения в эту фазу.",
      effect:
      "До конца фазы улучшите характеристику Armour Penetration оружия ближнего боя, которым оснащены модели в вашем подразделении, на 1.",
    ),
    Stratagem(
      name: "TERRIFYING SPECTACLE",
      cpCost: 1,
      categories: [StratagemCategory.command],
      when: "Command phase вашего противника.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое совершило Charge move в предыдущий ход и уничтожило одно или более вражеских подразделений в предыдущую Fight phase.",
      effect:
      "Каждое вражеское подразделение в пределах 6\" от вашего подразделения должно пройти Battle-shock test, вычитая 1 из этого теста, если они Below Half-strength. Вражеские подразделения, затронутые этой Stratagem, не должны проходить никаких других Battle-shock tests в ту же фазу.",
    ),
    Stratagem(
      name: "CUT DOWN THE WEAK",
      cpCost: 2,
      categories: [StratagemCategory.move],
      when:
      "Movement phase вашего противника, сразу после того, как вражеское подразделение Falls Back.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии (вы можете выбрать VEHICLE только если это WALKER), которое находится в пределах 6\" от этого вражеского подразделения и имело бы право объявить атаку против этого вражеского подразделения, если бы это была ваша Charge phase.",
      effect:
      "Ваше подразделение может объявить charge. При этом вы должны выбрать это вражеское подразделение в качестве цели этой атаки, и ваше подразделение не получает Charge bonus в этот ход.",
    ),
  ],

  restrictions: [
    Restriction.keywordBan(
      keywords: [Keyword.daemonettes],
      description: "",
    ),
  ],
);