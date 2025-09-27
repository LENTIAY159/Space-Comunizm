import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';

final sagaOfTheBeastslayer = Detachment(
  name: "Saga of the Beastslayer",
  additionalRules: [
    AdditionalRule(
      name: "Legendary Slayers",
      description: "Каждый раз, когда модель ADEPTUS ASTARTES из вашей армии совершает атаку по отряду с ключевыми словами CHARACTER, MONSTER или VEHICLE, или если ваша Saga завершена, эта атака получает способность [LETHAL HITS].\n\nSaga of the Beastslayer:\nВ начале первого раунда битвы ваш Beastslayer tally равен 0, и вы определяете свою Beastslayer target, деля пополам количество отрядов в армии противника, имеющих хотя бы одно из следующих ключевых слов (округляя в большую сторону): CHARACTER, MONSTER, VEHICLE.\nКаждый раз, когда отряд ADEPTUS ASTARTES из вашей армии стреляет или сражается в ближнем бою, после того как все атаки этого отряда разрешены, добавьте 1 к вашему Beastslayer tally за каждый уничтоженный вражеский отряд с одним или более из этих ключевых слов: CHARACTER, MONSTER, VEHICLE.\nКак только ваш Beastslayer tally становится равен или превышает Beastslayer target, ваша Saga считается завершённой.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Wolf-touched",
      description: "Только для модели SPACE WOLVES. Добавьте 2\" к характеристике Move носителя. На шаге Declare Battle Formations носитель может быть присоединён к отряду WULFEN INFANTRY.",
    ),
    Enhancement(
      name: "Hunter’s Guile",
      description: "Только для модели ADEPTUS ASTARTES. После того как обе армии расставлены, выберите до трёх отрядов THUNDERWOLF CAVALRY, WULFEN и/или BLOOD CLAWS из вашей армии и передислоцируйте их. Вы можете поместить эти отряды в Strategic Reserves, независимо от того, сколько отрядов уже находится там.",
    ),
    Enhancement(
      name: "Elder’s Guidance",
      description: "Только для модели SPACE WOLVES. Один раз за битву, в начале фазы Fight, если носитель возглавляет отряд BLOOD CLAWS, он может использовать это Enhancement. Если он это делает, до конца фазы улучшите характеристику Armour Penetration оружия ближнего боя, которым оснащены модели в этом отряде, на 1.",
    ),
    Enhancement(
      name: "Helm of the Beastslayer",
      description: "Только для модели ADEPTUS ASTARTES. Каждый раз, когда атака, совершаемая моделью с ключевыми словами CHARACTER, MONSTER или VEHICLE, нацелена на отряд носителя, снижайте характеристику Armour Penetration этой атаки на 1.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Unbridled Ferocity",
      cpCost: 1,
      when: "Фаза Fight.",
      target: "Один отряд SPACE WOLVES из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы, каждый раз, когда модель из вашего отряда совершает атаку, добавляйте 1 к броску на Wound.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Shock Cavalry",
      cpCost: 1,
      when: "Ваша фаза Movement или фаза Charge.",
      target: "Один отряд THUNDERWOLF CAVALRY из вашей армии, который ещё не был выбран для перемещения или объявления атаки в этой фазе.",
      effect: "До конца фазы, каждый раз, когда модель в вашем отряде совершает Normal, Advance, Fall Back или Charge перемещение, она может проходить сквозь модели (кроме моделей с ключевым словом TITANIC) и участки местности высотой 4\" или меньше. При этом она может перемещаться в Engagement Range с вражескими моделями, но если это не перемещение Charge, оно не может заканчиваться в Engagement Range.",
      restrictions: null,
      categories: [StratagemCategory.move, StratagemCategory.charge],
    ),
    Stratagem(
      name: "Pinning Fire",
      cpCost: 1,
      when: "Ваша фаза Shooting.",
      target: "Один отряд ADEPTUS ASTARTES из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы, после стрельбы вашего отряда, выберите один вражеский отряд с ключевыми словами CHARACTER, MONSTER или VEHICLE, по которому попали одной или несколькими атаками. До начала вашей следующей фазы Shooting этот отряд считается pinned: вычитайте 2\" из его Move и 2 из бросков Charge.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Thunderous Pursuit",
      cpCost: 1,
      when: "Фаза Movement вашего оппонента, сразу после того как вражеский отряд завершил Normal, Advance или Fall Back перемещение.",
      target: "Один отряд ADEPTUS ASTARTES из вашей армии в пределах 9\" от этого вражеского отряда и не находящийся в Engagement Range.",
      effect: "Ваш отряд может совершить Normal move до D6\". Если у него есть ключевые слова SPACE WOLVES INFANTRY или THUNDERWOLF CAVALRY, он может переместиться до 6\" вместо этого.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "Impetuosity",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели.",
      target: "Один отряд WULFEN INFANTRY или BLOOD CLAWS из вашей армии, выбранный целью одной или нескольких атак.",
      effect: "До конца фазы, после того как этот вражеский отряд завершит стрельбу, если одна или более моделей в вашем отряде были уничтожены в результате этих атак, ваш отряд может совершить Impetuous move. Для этого бросьте D6: ваш отряд может переместиться на количество дюймов, равное результату, но должен завершить перемещение как можно ближе к ближайшему вражескому отряду (кроме AIRCRAFT). При этом модели могут перемещаться в Engagement Range с этим отрядом.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Coordinated Strike",
      cpCost: 1,
      when: "Конец фазы Fight вашего оппонента.",
      target: "Один отряд SPACE WOLVES из вашей армии, полностью находящийся в пределах 9\" от одного или более краёв стола и не находящийся в Engagement Range.",
      effect: "Уберите ваш отряд с поля боя и поместите его в Strategic Reserves.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
  ],
  restrictions: [],
);

