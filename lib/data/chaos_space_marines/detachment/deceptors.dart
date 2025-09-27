import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final deceptors = Detachment(
  name: "Deceptors",
  additionalRules: [
    AdditionalRule(
      name: "Masters of Misdirection",
      description: "На шаге Declare Battle Formations вы можете выбрать несколько LEGIONARIES и CULTIST MOB юнитов из вашей армии. До конца сражения эти юниты и любые CHARACTER юниты, присоединённые к ним (кроме EPIC HEROES), получают способность Infiltrators.\n\n"
          "BATTLE SIZE   | LEGIONARIES | CULTIST MOBS\n"
          "------------- | ------------|--------------\n"
          "Incursion     | До 2        | До 2\n"
          "Strike Force  | До 3        | До 3\n"
          "Onslaught     | До 4        | До 4",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Cursed Fang",
      description: "Только для HERETIC ASTARTES INFANTRY модели. Улучшите характеристику Armour Penetration оружия ближнего боя носителя на 1, и оружие ближнего боя носителя получает способность [PRECISION].",
    ),
    Enhancement(
      name: "Falsehood",
      description: "Только для CHAOS LORD модели (кроме TERMINATOR и JUMP PACK моделей). На шаге Declare Battle Formations вы можете разместить носителя в Reserves вместо того, чтобы выставить его на поле боя. Если вы так сделали, на шаге Reinforcements одной из ваших Movement фаз вы можете выбрать одну модель в дружественном LEGIONARIES или CHOSEN юните, в котором осталось две или более моделей и который находится на поле боя (кроме Attached юнитов). Выбранная модель уничтожается, и носитель выставляется как можно ближе к месту, где была уничтожена эта модель. Затем носитель присоединяется к этому юниту как его Leader.",
    ),
    Enhancement(
      name: "Shroud of Obfuscation",
      description: "Только для HERETIC ASTARTES INFANTRY модели. Носитель получает способности Stealth и Lone Operative.",
    ),
    Enhancement(
      name: "Soul Link",
      description: "Только для HERETIC ASTARTES INFANTRY модели. В начале вашей Command фазы вы можете выбрать одну другую HERETIC ASTARTES INFANTRY CHARACTER модель из вашей армии (кроме EPIC HEROES). До начала вашей следующей Command фазы носитель получает ключевое слово PSYKER и заменяет свои datasheet способности на datasheet способности выбранного CHARACTER.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "DETONATOR",
      cpCost: 1,
      when: "Любая фаза, сразу после того как вражеская модель со способностью Deadly Demise (кроме TITANIC моделей) была уничтожена.",
      target: "Один HERETIC ASTARTES CHARACTER юнит из вашей армии, который находился в пределах 18\" от этой вражеской модели в момент её уничтожения.",
      effect: "Ваш противник не выполняет бросок для определения, наносятся ли mortal wounds способностью Deadly Demise его модели. Вместо этого mortal wounds наносятся автоматически (если эта способность наносит случайное количество mortal wounds, ваш противник всё же выполняет бросок для определения этого числа как обычно).",
      restrictions: null,
      categories: [StratagemCategory.command, StratagemCategory.move, StratagemCategory.shooting, StratagemCategory.charge, StratagemCategory.fight],
    ),
    Stratagem(
      name: "FROM ALL SIDES",
      cpCost: 1,
      when: "Начало вашей Charge фазы.",
      target: "Один HERETIC ASTARTES юнит из вашей армии.",
      effect: "До конца фазы добавляйте 1 к броскам charge вашего юнита за каждый другой HERETIC ASTARTES юнит из вашей армии, который сделал Charge move в этой фазе (максимум +3).",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "PICK THEM OFF",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по цели, которая находится ниже Starting Strength, вы можете перебросить бросок на попадание. Если цель находится в состоянии Below Half-strength, вы также можете перебросить бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "COILS OF DECEPTION",
      cpCost: 1,
      when: "Ваша Movement фаза, сразу после того как HERETIC ASTARTES юнит из вашей армии выполнил Fall Back.",
      target: "Этот HERETIC ASTARTES юнит.",
      effect: "До конца хода ваш юнит может стрелять в тот ход, в который он сделал Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "RELENTLESS PURSUIT",
      cpCost: 1,
      when: "Movement фаза противника, сразу после того как вражеский юнит завершил Normal, Advance или Fall Back перемещение.",
      target: "Один HERETIC ASTARTES INFANTRY или HERETIC ASTARTES MOUNTED юнит из вашей армии, который находится в пределах 9\" от этого вражеского юнита и не в Engagement Range с одним или более вражескими юнитами.",
      effect: "Ваш юнит может выполнить Normal move на расстояние до 6\".",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "SCRAMBLED COORDINATES",
      cpCost: 1,
      when: "Начало шага Reinforcements Movement фазы противника.",
      target: "Один HERETIC ASTARTES юнит из вашей армии.",
      effect: "До конца фазы вражеские юниты, прибывающие на поле боя из Reserves, не могут быть выставлены в пределах 12\" по горизонтали от вашего юнита.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
  ],
  restrictions: [],
);
