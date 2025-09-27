import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final crusherStampede = Detachment(
  name: "Crusher Stampede",
  additionalRules: [
    AdditionalRule(
      name: "Enraged Behemoths",
      description: "Каждый раз, когда модель TYRANIDS MONSTER из вашей армии совершает атаку, добавляйте 1 к броску на попадание, если отряд этой модели находится ниже своей Starting Strength, и добавляйте 1 к броску на пробитие, если отряд этой модели находится в состоянии Below Half-strength. Кроме того, пока отряд TYRANIDS MONSTER из вашей армии (кроме Battle-shocked отрядов) находится на своей Starting Strength, добавляйте 2 к характеристике Objective Control моделей в этом отряде.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Ominous Presence",
      description: "Только для модели TYRANIDS MONSTER. Добавьте 3 к характеристике Objective Control носителя.",
    ),
    Enhancement(
      name: "Enraged Reserves",
      description: "Только для модели TYRANIDS MONSTER. Если носитель уничтожен в ближнем бою и ещё не сражался в этой фазе, бросьте D6: при результате 3+ не убирайте его с поля боя. Он может сражаться после того, как атакующий отряд завершит свои атаки, а затем будет удалён с поля боя.",
    ),
    Enhancement(
      name: "Null Nodules",
      description: "Только для модели TYRANIDS MONSTER. Один раз за битву, когда на носителя распределена Psychic атака, он может использовать эту способность. Если он это делает, до конца фазы носитель получает способность Feel No Pain 5+ против Psychic атак.",
    ),
    Enhancement(
      name: "Monstrous Nemesis",
      description: "Только для модели TYRANIDS MONSTER. Каждый раз, когда носитель совершает атаку в ближнем бою против отряда MONSTER или VEHICLE, добавляйте 1 к броску на пробитие.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "CORROSIVE VISCERA",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как модель TYRANIDS MONSTER из вашей армии со способностью Deadly Demise, которая не имеет ключевого слова FLY, уничтожена",
      target: "Эта модель TYRANIDS MONSTER. Вы можете использовать эту Stratagem на этой модели, даже если она только что была уничтожена.",
      effect: "Не бросайте D6, чтобы определить, будут ли нанесены mortal wounds по способности Deadly Demise вашей модели. Вместо этого mortal wounds наносятся автоматически.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "RAMPAGING MONSTROSITIES",
      cpCost: 1,
      when: "Фаза Fight",
      target: "Один отряд TYRANIDS MONSTER из вашей армии, который ещё не был выбран для боя в этой фазе",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде совершает атаку, вы можете перебросить бросок на попадание.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "SAVAGE ROAR",
      cpCost: 1,
      when: "Фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд TYRANIDS MONSTER из вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "Этот вражеский отряд должен пройти тест Battle-shock, и до конца фазы каждый раз, когда модель в этом вражеском отряде совершает атаку против вашего отряда, вычитайте 1 из броска на попадание. Если тест Battle-shock был провален, вычитайте 1 и из броска на пробитие.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "UNTRAMMELLED FEROCITY",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд TYRANIDS MONSTER из вашей армии, который ещё не был выбран для перемещения в этой фазе",
      effect: "До конца фазы каждый раз, когда модель в вашем отряде совершает Normal, Advance или Fall Back перемещение, она может проходить сквозь модели (кроме моделей с ключевым словом TITANIC) и участки местности высотой 4\" или меньше. При этом:\n• Она может входить в Engagement Range с вражескими моделями, но не может завершить перемещение в Engagement Range с ними.\n• Она также может проходить через участки местности высотой более 4\", но если это происходит, после перемещения бросьте D6: при результате 1 ваш отряд находится в состоянии Battle-shocked.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "SWARM-GUIDED SALVOES",
      cpCost: 1,
      when: "Ваша фаза Shooting",
      target: "Один отряд TYRANIDS MONSTER из вашей армии, который ещё не был выбран для стрельбы в этой фазе",
      effect: "До конца фазы дальнобойное оружие, которым оснащены модели в вашем отряде, получает способность [IGNORES COVER], и до конца фазы каждый раз, когда модель в вашем отряде совершает атаку, вы можете игнорировать любые или все модификаторы к характеристике Ballistic Skill этой модели и любые или все модификаторы к броску на попадание.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "MASSIVE IMPACT",
      cpCost: 1,
      when: "Ваша фаза Charge, сразу после того как модель TYRANIDS MONSTER из вашей армии завершила Charge перемещение",
      target: "Эта модель TYRANIDS MONSTER",
      effect: "Выберите один вражеский отряд в Engagement Range с вашей моделью и бросьте шесть D6: за каждое 4+ этот вражеский отряд получает 1 mortal wound.",
      categories: [StratagemCategory.charge],
    ),
  ],
);
