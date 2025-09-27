import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';



final pactboundZealots = Detachment(
  name: "Pactbound Zealots",
  additionalRules: [
    AdditionalRule(
      name: "Marks of Chaos",
      description: '''
При формировании вашей армии, когда вы выбираете HERETIC ASTARTES юнит для включения в армию, если этот юнит не является EPIC HERO и не имеет одного из следующих ключевых слов, вы должны выбрать одно из них для этого юнита и отметить его в Army Roster: KHORNE, TZEENTCH, NURGLE, SLAANESH, CHAOS UNDIVIDED.

Каждый раз, когда юнит с одним из этих ключевых слов получает способность оружия в результате Dark Pact и не проваливает связанный с этим Leadership test, до конца фазы этот юнит получает соответствующую способность:

ЮНИТЫ, ПОЛУЧИВШИЕ [LETHAL HITS]
• KHORNE: Каждый раз, когда модель в этом юните совершает атаку в ближнем бою, неизменённый бросок на попадание 5+ считается Critical Hit.
• TZEENTCH: Каждый раз, когда модель в этом юните совершает дальнюю атаку, неизменённый бросок на попадание 5+ считается Critical Hit.
• CHAOS UNDIVIDED: Каждый раз, когда модель в этом юните совершает атаку, перебросьте бросок на попадание 1.

ЮНИТЫ, ПОЛУЧИВШИЕ [SUSTAINED HITS 1]
• NURGLE: Каждый раз, когда модель в этом юните совершает дальнюю атаку, неизменённый бросок на попадание 5+ считается Critical Hit.
• SLAANESH: Каждый раз, когда модель в этом юните совершает атаку в ближнем бою, неизменённый бросок на попадание 5+ считается Critical Hit.
• CHAOS UNDIVIDED: Каждый раз, когда модель в этом юните совершает атаку, перебросьте бросок на попадание 1.

ОГРАНИЧЕНИЯ
• Вы не можете выбрать ключевое слово KHORNE для PSYKER юнита.
• CHARACTER юнит может быть присоединён к другому юниту только если оба юнита имеют одинаковое ключевое слово из приведённого списка.
• Юнит может сесть в TRANSPORT (или начать сражение в нём) только если оба этих юнита имеют одинаковое ключевое слово из приведённого списка.
''',
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Eye of Tzeentch",
      description: "Только для HERETIC ASTARTES TZEENTCH модели. Каждый раз, когда юнит носителя совершает Dark Pact и не проваливает Leadership test, если результат этого теста был 8 или выше, вы получаете 1CP.",
    ),
    Enhancement(
      name: "Intoxicating Elixir",
      description: "Только для HERETIC ASTARTES SLAANESH модели. Носитель получает способность Feel No Pain 5+. Каждый раз, когда носитель стреляет или сражается, если юнит носителя совершил Dark Pact в этой фазе и не провалил Leadership test, после разрешения этих атак выберите один вражеский юнит, по которому было нанесено одно или более попаданий; этот юнит должен пройти Battle-shock тест.",
    ),
    Enhancement(
      name: "Orbs of Unlife",
      description: "Только для HERETIC ASTARTES NURGLE модели. В конце Fight фазы бросьте один D6 за каждый вражеский юнит в пределах 3\" от носителя, добавив 1 к результату, если юнит носителя совершил Dark Pact в этой фазе и не провалил Leadership test: при результате 4+ этот вражеский юнит получает D3 mortal wounds.",
    ),
    Enhancement(
      name: "Talisman of Burning Blood",
      description: "Только для HERETIC ASTARTES KHORNE модели. Добавьте 1 к характеристикам Attacks и Strength оружия ближнего боя носителя. Каждый раз, когда юнит носителя совершает Dark Pact и не проваливает Leadership test, бросьте один D3: до конца фазы добавьте результат к характеристикам Attacks и Strength оружия ближнего боя носителя вместо обычного бонуса.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "EYE OF THE GODS",
      cpCost: 1,
      when: "Fight фаза, сразу после того как HERETIC ASTARTES CHARACTER юнит из вашей армии (кроме DAMNED, DAEMON и EPIC HERO) уничтожил вражеский юнит.",
      target: "Одна HERETIC ASTARTES CHARACTER модель в этом юните.",
      effect: "До конца сражения добавьте 1 к характеристикам Move, Toughness и Wounds этой модели, а также 1 к характеристикам Attacks, Strength и Damage её оружия ближнего боя.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "ETERNAL HATE",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, выбранный как цель одной или более атак.",
      effect: "До конца фазы, каждый раз, когда модель в вашем юните уничтожается и ещё не сражалась в этой фазе, бросьте один D6, добавив 1 к результату, если это KHORNE юнит: при 4+ не убирайте модель с поля боя. Эта модель может сражаться после того, как атакующий юнит завершит атаки, затем её убирают с поля боя.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PROFANE ZEAL",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один HERETIC ASTARTES CHAOS UNDIVIDED юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, вы можете перебросить бросок на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SKINSHIFT",
      cpCost: 1,
      when: "Ваша Command фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии.",
      effect: "Одна модель в вашем юните восстанавливает до 3 потерянных ран. Если ваш юнит является TZEENTCH и находится ниже Starting Strength, верните одну уничтоженную модель (кроме CHARACTER) в юнит с полным количеством ран.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "TORPEFYING REFRAIN",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один HERETIC ASTARTES юнит из вашей армии.",
      effect: "До конца хода ваш юнит может объявлять charge в ход, когда он сделал Fall Back. Если ваш юнит является SLAANESH, до конца хода он может стрелять и объявлять charge в ход, когда сделал Advance или Fall Back.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "FESTERING MIASMA",
      cpCost: 1,
      when: "Shooting фаза противника, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один HERETIC ASTARTES юнит из вашей армии, выбранный как цель одной или более атак.",
      effect: "До конца фазы ваш юнит получает способность Stealth. Если ваш юнит является NURGLE, он может быть выбран целью дальних атак только если атакующая модель находится в пределах 18\".",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
);
