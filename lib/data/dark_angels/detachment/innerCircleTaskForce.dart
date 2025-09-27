import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final innerCircleTaskForce = Detachment(
  name: "Inner Circle Task Force",
  additionalRules: [
    AdditionalRule(
      name: "Vowed Target",
      description: "В начале вашей Movement фазы выберите одно из следующего: Defensive Footing: выберите один маркер цели, который вы контролируете. До начала вашей следующей Movement фазы этот маркер цели является вашим Vowed objective marker. Aggressive Push: выберите один или несколько маркеров цели, которые вы не контролируете. До начала вашей следующей Movement фазы каждый из этих маркеров цели является вашим Vowed objective marker. Если правило ссылается на юнит или модель, находящуюся в пределах досягаемости вашего Vowed objective marker, это правило действует, если этот юнит или модель находится в пределах досягаемости одного или нескольких ваших Vowed objective markers. Каждый раз, когда DEATHWING INFANTRY юнит из вашей армии совершает атаку по юниту в пределах досягаемости одного или нескольких ваших Vowed objective markers, добавляйте 1 к броску на ранение.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Champion of the Deathwing",
      description: "Только для DEATHWING модели. Оружие ближнего боя, которым оснащён носитель, получает способность [LETHAL HITS], и каждый раз, когда носитель совершает атаку в ближнем бою, если он находится в пределах досягаемости вашего Vowed objective marker, неизменённый бросок на попадание 5+ считается Critical Hit.",
    ),
    Enhancement(
      name: "Eye of the Unseen",
      description: "Только для DEATHWING модели. Каждый раз, когда вы выбираете юнит носителя целью Stratagem, бросайте один D6, добавив 1, если носитель находится в пределах досягаемости вашего Vowed objective marker: при 5+ вы получаете 1CP.",
    ),
    Enhancement(
      name: "Singular Will",
      description: "Только для DEATHWING модели. Каждый раз, когда юнит носителя выполняет Pile In или Consolidate, модели в этом юните могут перемещаться дополнительно на 3\".",
    ),
    Enhancement(
      name: "Deathwing Assault",
      description: "Только для DEATHWING модели со способностью Deep Strike. Юнит носителя может быть выставлен с использованием способности Deep Strike на шаге Reinforcements вашей первой, второй или третьей Movement фазы, независимо от любых правил миссии.",
    ),
  ],
  stratagems: [
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
      name: "Martial Mastery",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один DEATHWING INFANTRY юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, перебрасывайте броски на ранение 1. Если ваш юнит находится в пределах досягаемости вашего Vowed objective marker, вы можете перебросить бросок на ранение вместо этого.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Duty Unto Death",
      cpCost: 1,
      when: "Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один DEATHWING юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните уничтожается, если эта модель ещё не сражалась в этой фазе, бросьте один D6, добавив 1, если ваш юнит находится в пределах досягаемости вашего Vowed objective marker. При 4+ не удаляйте модель с поля боя: она может сражаться после того, как атакующий юнит завершит свои атаки, а затем будет удалена.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "Relic Teleportarium",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один DEATHWING юнит из вашей армии, прибывающий с использованием способности Deep Strike в этой фазе.",
      effect: "Ваш юнит может быть выставлен в любом месте поля боя на расстоянии более 6\" по горизонтали от всех вражеских моделей.",
      restrictions: "До конца хода ваш юнит не может объявлять charge.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "Wrath of the Lion",
      cpCost: 1,
      when: "Ваша Charge фаза.",
      target: "Один DEATHWING INFANTRY юнит из вашей армии, который только что завершил Charge move.",
      effect: "Выберите один вражеский юнит в Engagement Range с вашим юнитом и бросьте один D6 за каждую модель в вашем юните, добавив 1 к результату, если этот вражеский юнит находится в пределах досягаемости вашего Vowed objective marker: за каждый результат 4+ этот вражеский юнит получает 1 mortal wound (максимум 3 mortal wounds).",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "Unmatched Fortitude",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один DEATHWING INFANTRY юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, если характеристика Strength этой атаки больше, чем характеристика Toughness вашего юнита, вычитайте 1 из броска на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
  ],
  restrictions: [
    Restriction.exclusiveKeywordBan(
      factionKeywords: [FactionKeyword.adeptusAstartes],
      description: "Ваша армия может включать DARK ANGELS юниты, но не может включать ADEPTUS ASTARTES юниты из других Чаптеров.",
    ),
  ],
);

