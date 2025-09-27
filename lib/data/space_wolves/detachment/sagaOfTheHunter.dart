import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';

final sagaOfTheHunter = Detachment(
  name: "Saga of the Hunter",
  additionalRules: [
    AdditionalRule(
      name: "Pack’s Quarry",
      description: "Каждый раз, когда модель в отряде SPACE WOLVES из вашей армии совершает атаку в ближнем бою по вражескому отряду, если этот вражеский отряд находится в Engagement Range с одним или более другими отрядами ADEPTUS ASTARTES из вашей армии, "
          "или если атакующий отряд содержит больше моделей, чем этот вражеский отряд: добавьте 1 к броску на попадание. Если ваша Saga завершена, также добавьте 1 к броску на пробитие."
          "\n\nSaga of the Hunter:\n"
          "В начале первого раунда битвы ваш Quarry tally равен 0. Каждый раз, когда отряд ADEPTUS ASTARTES из вашей армии сражается, после того как все атаки этого отряда разрешены, "
          "добавьте 1 к вашему Quarry tally за каждый уничтоженный вражеский отряд.\nКогда ваш Quarry tally становится равным или превышает значение, указанное ниже (в зависимости от размера сражения), ваша Saga считается завершённой:\n\n"
          "BATTLE SIZE   | QUARRY TALLY\n"
          "Incursion     | 2\n"
          "Strike Force  | 3\n"
          "Onslaught     | 4",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Swift Hunter",
      description: "Только для модели SPACE WOLVES. Модели в отряде носителя имеют способность Scouts 7\".",
    ),
    Enhancement(
      name: "Fenrisian Grit",
      description: "Только для модели ADEPTUS ASTARTES. Носитель имеет способность Feel No Pain 4+.",
    ),
    Enhancement(
      name: "Wolf Master",
      description: "Только для модели SPACE WOLVES. В вашей Command phase выберите один дружественный отряд SPACE WOLVES в пределах 9\" от носителя. До начала вашей следующей Command phase оружие teeth and claws и Tyrnak and Fenrir, которым оснащены модели в этом отряде, получают способность [LETHAL HITS].",
    ),
    Enhancement(
      name: "Feral Rage",
      description: "Только для модели ADEPTUS ASTARTES. Добавьте 1 к характеристике Attacks оружия ближнего боя, которым оснащён носитель. Каждый раз, когда носитель завершает Charge перемещение, до конца хода добавляйте ещё 1 к характеристике Attacks этого оружия.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Hunters’ Trail",
      cpCost: 1,
      when: "Фаза Fight.",
      target: "Один отряд SPACE WOLVES (кроме MONSTERS и VEHICLES) из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде совершает Pile-in или Consolidation перемещение, она может переместиться до 6\" вместо 3\". При этом она не обязана завершать перемещение ближе к ближайшей вражеской модели, если завершает его как можно ближе к ближайшему вражескому отряду.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Territorial Advantage",
      cpCost: 1,
      when: "Фаза Fight, сразу после того как вражеский отряд был уничтожен отрядом ADEPTUS ASTARTES из вашей армии.",
      target: "Этот отряд ADEPTUS ASTARTES.",
      effect: "Выберите один маркер цели, который вы контролируете и в пределах досягаемости которого находится ваш отряд. Этот маркер остаётся под вашим контролем, пока уровень контроля вашего оппонента над ним не превысит ваш в конце любой фазы.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Overwhelming Onslaught",
      cpCost: 1,
      when: "Фаза Fight, сразу после того как вражеский отряд выбрал цели.",
      target: "Два отряда ADEPTUS ASTARTES из вашей армии в Engagement Range этого вражеского отряда, или один отряд SPACE WOLVES BEASTS из вашей армии в Engagement Range этого вражеского отряда.",
      effect: "До конца фазы каждый раз, когда модель в этом вражеском отряде совершает атаку, вычитайте 1 из броска на попадание.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Chosen Prey",
      cpCost: 1,
      when: "Ваша фаза Movement, сразу после того как отряд SPACE WOLVES из вашей армии выполнил Fall Back.",
      target: "Этот отряд SPACE WOLVES.",
      effect: "До конца хода ваш отряд может стрелять и объявлять атаку в тот же ход, в который он выполнил Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "Bounding Advance",
      cpCost: 1,
      when: "Ваша фаза Movement или фаза Charge.",
      target: "Один отряд SPACE WOLVES INFANTRY или SPACE WOLVES BEASTS из вашей армии, который ещё не был выбран для перемещения или атаки в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде совершает Normal, Advance, Fall Back или Charge перемещение, она может проходить сквозь модели (кроме моделей с ключевым словом TITANIC). При этом она может входить в Engagement Range с вражескими моделями, но если это не Charge перемещение, оно не может заканчиваться в Engagement Range.",
      restrictions: null,
      categories: [StratagemCategory.move, StratagemCategory.charge],
    ),
    Stratagem(
      name: "Marked for Destruction",
      cpCost: 1,
      when: "Ваша фаза Shooting.",
      target: "Два отряда ADEPTUS ASTARTES (кроме BEASTS) из вашей армии, которые ещё не были выбраны для стрельбы в этой фазе.",
      effect: "Выберите один вражеский отряд, видимый для обоих ваших отрядов. До конца фазы модели в ваших отрядах могут атаковать только этот вражеский отряд (если он является допустимой целью), и каждый раз, когда модель в одном из ваших отрядов совершает атаку, перебрасывайте бросок на пробитие с результатом 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
);

