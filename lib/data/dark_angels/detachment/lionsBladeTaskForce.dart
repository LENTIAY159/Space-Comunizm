import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final lionsBladeTaskForce = Detachment(
  name: "Lion’s Blade Task Force",
  additionalRules: [
    AdditionalRule(
      name: "In The Lion’s Claws",
      description: "Каждый раз, когда вражеский юнит (кроме MONSTERS и VEHICLES) в пределах Engagement Range от одного или более RAVENWING юнитов из вашей армии выполняет Fall Back, все модели в этом вражеском юните должны пройти Desperate Escape test. При этом, если этот вражеский юнит находится в состоянии Battle-shock, вычитайте 1 из каждого такого теста. Каждый раз, когда DEATHWING юнит из вашей армии объявляет charge, если одна или более целей этого charge находятся в пределах Engagement Range от одного или более RAVENWING юнитов из вашей армии, добавляйте 2 к броску charge.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Calibanite Armaments",
      description: "Только для ADEPTUS ASTARTES модели. Добавьте 1 к характеристике Damage оружия ближнего боя носителя.",
    ),
    Enhancement(
      name: "Lord of the Hunt",
      description: "Только для RAVENWING модели. Юнит носителя может стрелять и объявлять charge в тот ход, когда он сделал Fall Back, и вы можете перебросить Desperate Escape tests, выполненные для моделей в юните носителя.",
    ),
    Enhancement(
      name: "Stalwart Champion",
      description: "Только для CAPTAIN, CHAPLAIN или LIEUTENANT модели. Пока юнит носителя не находится в состоянии Battle-shock, добавляйте 1 к характеристике Objective Control моделей в юните носителя.",
    ),
    Enhancement(
      name: "Fulgus Magna",
      description: "Только для DEATHWING модели. Один раз за сражение, в конце хода вашего противника, если юнит носителя не находится в пределах Engagement Range от одного или более вражеских юнитов, носитель может использовать это Enhancement. Если он это делает, уберите юнит носителя с поля боя и поместите его в Strategic Reserves.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Overpowering Exaction",
      cpCost: 1,
      when: "Command фаза или начало Fight фазы.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии.",
      effect: "Выберите один вражеский юнит в пределах Engagement Range от вашего юнита. Этот вражеский юнит должен пройти Battle-shock тест. При этом, если ваш юнит имеет ключевое слово DEATHWING или RAVENWING, вычитайте 1 из результата.",
      restrictions: "Вы можете использовать эту Stratagem только один раз за боевой раунд.",
      categories: [StratagemCategory.command, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Armour of Contempt",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Strength in Unity",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "Если этот вражеский юнит находится в пределах Engagement Range от одного или более RAVENWING юнитов из вашей армии, до конца фазы каждый раз, когда модель в этом вражеском юните совершает атаку, вычитайте 1 из броска на попадание. Если этот вражеский юнит находится в пределах Engagement Range от одного или более DEATHWING юнитов из вашей армии, до конца фазы каждый раз, когда модель в этом вражеском юните совершает атаку, если характеристика Strength этой атаки больше, чем характеристика Toughness цели, вычитайте 1 из броска на ранение.",
      restrictions: "Юнит не может быть целью этой Stratagem и Stratagem Armour of Contempt в одной фазе.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Knights of Iron",
      cpCost: 1,
      when: "Ваша Movement фаза или Charge фаза.",
      target: "Один RAVENWING юнит из вашей армии.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните выполняет Normal, Advance или Charge перемещение, она может перемещаться по горизонтали сквозь элементы ландшафта.",
      restrictions: null,
      categories: [StratagemCategory.move, StratagemCategory.charge],
    ),
    Stratagem(
      name: "Illuminating Fire",
      cpCost: 1,
      when: "Ваша Shooting фаза, сразу после того как RAVENWING юнит из вашей армии выбрал свои цели.",
      target: "Этот RAVENWING юнит.",
      effect: "Выберите один вражеский юнит в пределах 12\" от вашего юнита, который был выбран целью одной или более атак этого юнита. До конца фазы каждый раз, когда дружественный DEATHWING юнит совершает атаку, нацеленную на этот вражеский юнит, добавляйте 1 к броску на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Inescapable Wrath",
      cpCost: 2,
      when: "Конец Charge фазы вашего противника.",
      target: "Один DEATHWING INFANTRY или DEATHWING WALKER юнит из вашей армии, находящийся в пределах 6\" от одного или более вражеских юнитов и могущий объявить charge против одного или более этих юнитов, если бы это была ваша Charge фаза.",
      effect: "Ваш юнит теперь объявляет charge, целью которого могут быть только один или более этих вражеских юнитов, и вы выполняете этот charge.",
      restrictions: "Даже если этот charge успешен, ваш юнит не получает бонуса Charge в этом ходу.",
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [
    Restriction.exclusiveKeywordBan(
      factionKeywords: [FactionKeyword.adeptusAstartes],
      description: "Ваша армия может включать DARK ANGELS юниты, но не может включать ADEPTUS ASTARTES юниты из других Чаптеров.",
    ),
  ],
);

