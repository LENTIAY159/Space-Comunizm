import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';

final championsOfFenris = Detachment(
  name: "Champions of Fenris",
  additionalRules: [
    AdditionalRule(
      name: "The Great Wolf Watches",
      description: "В конце фазы Charge вашего оппонента, каждый отряд ADEPTUS ASTARTES INFANTRY и ADEPTUS ASTARTES WALKER из вашей армии, находящийся в пределах 3\" от одного или более вражеских отрядов и имеющий право объявить атаку против одного или более из этих отрядов, может объявить атаку против одного или более из этих отрядов, и вы разрешаете эту атаку так, как если бы это была ваша фаза Charge. Если эта атака успешна, ваш отряд не получает бонус Charge в этом ходу.\n\nПока отряды ADEPTUS ASTARTES TERMINATOR из вашей армии не находятся в состоянии Battle-shocked, добавляйте 1 к характеристике Objective Control моделей в этих отрядах.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Wolves’ Wisdom",
      description: "Только для модели ADEPTUS ASTARTES INFANTRY. Отряд носителя может объявлять атаку против одного или более отрядов в пределах 6\" вместо 3\" при использовании правила детачмента The Great Wolf Watches.",
    ),
    Enhancement(
      name: "Foes’ Fate",
      description: "Только для модели ADEPTUS ASTARTES TERMINATOR. Каждый раз, когда вражеский отряд (кроме MONSTERS и VEHICLES) в Engagement Range с отрядом носителя выполняет Fall Back, все модели в этом отряде должны пройти тесты Desperate Escape. При этом, если вражеский отряд находится в состоянии Battle-shocked, вычитайте 1 из каждого такого теста.",
    ),
    Enhancement(
      name: "Fangrune Pendant",
      description: "Только для модели ADEPTUS ASTARTES TERMINATOR. Отряд носителя может стрелять и объявлять атаку в тот ход, когда он выполнил Fall Back.",
    ),
    Enhancement(
      name: "Longstrider",
      description: "Только для модели ADEPTUS ASTARTES. Вы можете перебрасывать броски Charge для отряда носителя.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Preytaker’s Eye",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight.",
      target: "Один отряд ADEPTUS ASTARTES INFANTRY из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "Выберите способность [LETHAL HITS] или [SUSTAINED HITS 1]. До конца фазы оружие, которым оснащены модели в вашем отряде, получает эту способность.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Armour of Contempt",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели.",
      target: "Один отряд ADEPTUS ASTARTES из вашей армии, выбранный целью одной или нескольких атак атакующего отряда.",
      effect: "Пока атакующий отряд не закончит свои атаки, каждый раз, когда атака направлена на ваш отряд, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Runes of Claiming",
      cpCost: 1,
      when: "Конец вашей фазы Command.",
      target: "Один отряд ADEPTUS ASTARTES INFANTRY или ADEPTUS ASTARTES WALKER из вашей армии.",
      effect: "Выберите один маркер цели, который вы контролируете, и в пределах досягаемости которого находится ваш отряд. Этот маркер цели остаётся под вашим контролем, пока уровень контроля вашего оппонента над этим маркером не превысит ваш в конце фазы.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Chilling Howl",
      cpCost: 1,
      when: "Фаза Command вашего оппонента.",
      target: "Один отряд ADEPTUS ASTARTES TERMINATOR из вашей армии.",
      effect: "Каждый вражеский отряд в пределах 6\" от вашего отряда должен пройти тест Battle-shock с вычитанием 1, если этот отряд находится в состоянии Below Half-strength.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "Stalking Wolves",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели.",
      target: "Один отряд ADEPTUS ASTARTES INFANTRY из вашей армии, выбранный целью одной или нескольких атак атакующего отряда.",
      effect: "До конца фазы модели в вашем отряде получают способность Stealth.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Onrushing Storm",
      cpCost: 1,
      when: "Конец фазы Fight вашего оппонента.",
      target: "Один отряд ADEPTUS ASTARTES TERMINATOR из вашей армии, который не находится в Engagement Range с одним или более вражескими отрядами.",
      effect: "Уберите ваш отряд с поля боя и поместите его в Strategic Reserves.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
  ],
  restrictions: [
    Restriction.exclusiveKeywordBan(
      factionKeywords: [FactionKeyword.adeptusAstartes],
      description: "Ваша армия может включать отряды SPACE WOLVES, но не может включать отряды ADEPTUS ASTARTES из любых других Chapters.",
    ),
  ],
);

