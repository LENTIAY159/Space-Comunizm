import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';

final sagaOfTheBold = Detachment(
  name: "Saga of the Bold",
  additionalRules: [
    AdditionalRule(
      name: "Heroes All",
      description: "Каждый раз, когда отряд ADEPTUS ASTARTES из вашей армии выбирается для стрельбы или боя, примените один из следующих эффектов при разрешении этих атак:\n• Если ваша Saga завершена, вы можете перебросить один бросок на попадание, один бросок на пробитие и один бросок урона.\n• В противном случае, если этот отряд является отрядом SPACE WOLVES CHARACTER, вы можете перебросить один бросок на попадание, один бросок на пробитие или один бросок урона.\n\nSaga of the Bold:\nКаждый раз, когда отряд SPACE WOLVES CHARACTER из вашей армии выполняет одно из следующих условий, он достигает соответствующего Boast. Как только три или более различных Boast выполнены отрядами вашей армии, ваша Saga считается завершённой:\n— Your Hide as a Trophy: Отряд уничтожает вашу цель Oath of Moment.\n— Slay Them All: Отряд уничтожает вашу цель Oath of Moment, и это вторая цель Oath of Moment, уничтоженная этим отрядом в данной битве.\n— Overrun Their Position: В конце хода любого игрока этот отряд полностью находится в зоне высадки противника.\n— Hold the Line: Начиная со второго раунда битвы, в конце вашей фазы Command этот отряд находится в пределах досягаемости маркера цели, который вы контролируете, и который не находится в вашей зоне высадки.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Braggart’s Steel",
      description: "Только для модели SPACE WOLVES. Добавьте 2 к характеристике Strength оружия ближнего боя, которым оснащён носитель. Если отряд носителя выполнил один или более Boast, также добавьте 1 к характеристике Damage этого оружия.",
    ),
    Enhancement(
      name: "Skjald",
      description: "Только для модели ADEPTUS ASTARTES. Каждый раз, когда отряд SPACE WOLVES CHARACTER из вашей армии выполняет Boast, если носитель находится на поле боя, вы получаете 1CP.",
    ),
    Enhancement(
      name: "Hordeslayer",
      description: "Только для модели SPACE WOLVES. В начале фазы Fight, если в пределах 6\" от носителя полностью находится больше вражеских моделей, чем дружественных, до конца фазы добавьте 2 к характеристике Attacks оружия ближнего боя, которым оснащён носитель. Если отряд носителя выполнил один или более Boast, вместо этого добавьте 3 к характеристике Attacks.",
    ),
    Enhancement(
      name: "Thunderwolf’s Fortitude",
      description: "Только для модели ADEPTUS ASTARTES. Первый раз, когда носитель уничтожается, уберите его с игры, затем в конце фазы бросьте D6: при результате 2+ верните носителя на поле боя как можно ближе к месту его уничтожения, но не в Engagement Range с вражескими отрядами, с оставшимися 3 Wounds.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Inspiring Presence",
      cpCost: 1,
      when: "Фаза Fight.",
      target: "Один отряд ADEPTUS ASTARTES CHARACTER из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы оружие ближнего боя моделей в вашем отряде получает способность [LETHAL HITS].",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Champion’s Guidance",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight.",
      target: "Один отряд SPACE WOLVES CHARACTER из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде совершает атаку, вы можете перебросить бросок на попадание.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Birth of a Saga",
      cpCost: 1,
      when: "Ваша фаза Command.",
      target: "Одна модель Wolf Guard Headtaker или Wolf Guard Terminator Pack Leader из вашей армии.",
      effect: "До начала вашей следующей фазы Command ваша модель получает ключевое слово CHARACTER. Пока это действует, отряд вашей модели считается CHARACTER и взаимодействует с правилом Heroes All, а также с другими правилами, которые взаимодействуют с CHARACTER.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Alpha Strike",
      cpCost: 1,
      when: "Ваша фаза Charge.",
      target: "Один отряд ADEPTUS ASTARTES CHARACTER из вашей армии.",
      effect: "До конца фазы ваш отряд может объявить атаку в ход, когда он выполнил Advance.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "Heroic Resolve",
      cpCost: 2,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели.",
      target: "Один отряд SPACE WOLVES CHARACTER из вашей армии, выбранный целью одной или нескольких атак атакующего отряда.",
      effect: "До конца фазы каждый раз, когда атака распределяется на модель в вашем отряде, вычитайте 1 из характеристики Damage этой атаки.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Countercharge",
      cpCost: 2,
      when: "Конец фазы Charge вашего оппонента.",
      target: "Один отряд ADEPTUS ASTARTES CHARACTER из вашей армии, находящийся в пределах 6\" от одного или более вражеских отрядов и имеющий возможность объявить атаку против одного или более из этих отрядов, если бы это была ваша фаза Charge.",
      effect: "Ваш отряд объявляет атаку, целью которой являются только эти вражеские отряды, и вы разрешаете эту атаку так, как если бы это была ваша фаза Charge. Даже если атака успешна, ваш отряд не получает бонус Charge в этот ход.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [],
);

