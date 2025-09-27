import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment rapidEvisceration = Detachment(
  name: "Rapid Evisceration",

  additionalRules: [
    AdditionalRule(
      name: "Mechanised Murder",
      description:
      "Каждый раз, когда модель EMPEROR'S CHILDREN из вашей армии совершает атаку, если она высадилась из TRANSPORT в этот ход, перебросьте бросок Hit с результатом 1 и перебросьте бросок Wound с результатом 1.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Sublime Prescience",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Один раз за ход, в вашу Movement phase, носитель может использовать это Enhancement. Если он это делает, выберите один дружественный EMPEROR'S CHILDREN TRANSPORT, который находится в Strategic Reserves. До конца фазы для целей размещения этого TRANSPORT на поле боя считайте текущий номер раунда битвы на один выше, чем он есть на самом деле.",
    ),
    Enhancement(
      name: "Spearhead Striker",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Каждый раз, когда носитель высаживается из TRANSPORT, до конца хода вы можете перебрасывать броски Charge, совершенные для подразделения носителя, и вражеские подразделения не могут использовать Fire Overwatch Stratagem для стрельбы по подразделению носителя.",
    ),
    Enhancement(
      name: "Accomplished Tactician",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Один раз за ход, в Shooting phase вашего противника, сразу после того, как вражеское подразделение выстрелило, вы можете выбрать одно дружественное подразделение EMPEROR'S CHILDREN в пределах 9\" от носителя, которое было поражено одной или более из этих атак, затем выберите один дружественный TRANSPORT, от которого это подразделение находится полностью в пределах 6\" и может в него погрузиться. Это подразделение EMPEROR'S CHILDREN может погрузиться в этот Transport.",
    ),
    Enhancement(
      name: "Heretek Adept",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Один раз за раунд битвы, когда спасительный бросок проваливается для дружественной модели EMPEROR'S CHILDREN VEHICLE в пределах 6\" от носителя, вы можете изменить характеристику Damage этой атаки на 0.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "ONTO THE NEXT",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Конец Fight phase.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое уничтожило вражеское подразделение в эту фазу, и один дружественный TRANSPORT, в который оно может погрузиться.",
      effect:
      "Если ваше подразделение EMPEROR'S CHILDREN находится полностью в пределах 6\" от этого TRANSPORT, оно может погрузиться в него.",
    ),
    Stratagem(
      name: "ADVANCE AND CLAIM",
      cpCost: 1,
      categories: [StratagemCategory.command],
      when: "Ваша Command phase.",
      target:
      "Один EMPEROR'S CHILDREN TRANSPORT из вашей армии, в котором погружено одно или более подразделений TORMENTORS (исключая Battle-shocked подразделения).",
      effect:
      "Выберите один маркер цели, который вы контролируете и в радиусе действия которого находится ваш TRANSPORT. Этот маркер цели остается под вашим контролем до тех пор, пока Level of Control вашего противника над этим маркером цели не станет больше вашего в конце фазы.",
    ),
    Stratagem(
      name: "DYNAMIC BREAKTHROUGH",
      cpCost: 1,
      categories: [StratagemCategory.move],
      when: "Ваша Movement phase.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN VEHICLE из вашей армии, которое не было выбрано для перемещения в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем подразделении совершает перемещение, она может перемещаться сквозь вражеские модели (исключая MONSTERS и VEHICLES). При этом она может перемещаться в пределах Engagement Range таких моделей, но не может закончить это перемещение в пределах Engagement Range от них, и любой Desperate Escape test автоматически пройден.",
    ),
    Stratagem(
      name: "CEASELESS ONSLAUGHT",
      cpCost: 1,
      categories: [StratagemCategory.charge],
      when: "Ваша Charge phase.",
      target:
      "Одно подразделение EMPEROR'S CHILDREN из вашей армии, которое высадилось из TRANSPORT, совершившего Normal move в этот ход.",
      effect:
      "До конца фазы ваше подразделение EMPEROR'S CHILDREN имеет право объявить charge.",
    ),
    Stratagem(
      name: "REACTIVE DISEMBARKATION",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when:
      "Shooting phase вашего противника, сразу после того, как вражеское подразделение выбрало свои цели.",
      target:
      "Один EMPEROR'S CHILDREN TRANSPORT из вашей армии, который был выбран в качестве цели одной или более атак атакующего подразделения.",
      effect:
      "Одно подразделение EMPEROR'S CHILDREN, погруженное в ваш TRANSPORT, может высадиться. При этом модели в этом подразделении могут быть размещены где угодно на поле боя полностью в пределах 6\" от этого TRANSPORT и не в пределах Engagement Range одного или более вражеских подразделений.",
    ),
    Stratagem(
      name: "OUTFLANKING STRIKE",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when: "Конец Fight phase вашего противника.",
      target:
      "Один EMPEROR'S CHILDREN TRANSPORT из вашей армии, или до двух EMPEROR'S CHILDREN DEDICATED TRANSPORTS из вашей армии.",
      effect:
      "For каждого из этих TRANSPORTS, полностью находящегося в пределах 9\" от одного или более краев поля боя, уберите его с поля боя и поместите в Strategic Reserves.",
    ),
  ],

  restrictions: [
    Restriction.keywordBan(
      keywords: [Keyword.daemonettes],
      description: "",
    ),
  ],
);