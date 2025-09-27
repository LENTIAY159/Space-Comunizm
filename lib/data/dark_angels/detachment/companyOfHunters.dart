import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final companyOfHunters = Detachment(
  name: "Company of Hunters",
  additionalRules: [
    AdditionalRule(
      name: "Masters Of Manoeuvre",
      description: "ADEPTUS ASTARTES юниты из вашей армии могут стрелять в ход, в который они сделали Advance или Fell Back. ADEPTUS ASTARTES MOUNTED юниты из вашей армии могут стрелять и объявлять charge в ход, в который они сделали Advance или Fell Back.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Master-crafted Weapon",
      description: "Только для RAVENWING модели. Оружие ближнего боя, которым оснащён носитель, получает способность [PRECISION].",
    ),
    Enhancement(
      name: "Mounted Strategist",
      description: "Только для RAVENWING модели. Вы можете перебрасывать броски Advance и Charge, сделанные для юнита носителя.",
    ),
    Enhancement(
      name: "Master of Manoeuvre",
      description: "Только для RAVENWING модели. Если юнит носителя начинает сражение в Strategic Reserves, его стоимость в очках не учитывается в общем лимите очков на юниты в Strategic Reserves, и при выставлении этого юнита на поле боя считайте номер текущего раунда на один больше, чем он есть на самом деле.",
    ),
    Enhancement(
      name: "Recon Hunter",
      description: "Только для RAVENWING модели. Модели в юните носителя получают способность Scouts 9\".",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "Hunters’ Trail",
      cpCost: 1,
      when: "Command фаза.",
      target: "Один RAVENWING MOUNTED юнит из вашей армии, находящийся в пределах досягаемости маркера цели, который вы контролируете.",
      effect: "Этот маркер цели остаётся под вашим контролем, даже если у вас нет моделей в пределах его досягаемости, пока ваш противник не получит контроль над ним в начале или в конце любого хода.",
      restrictions: null,
      categories: [StratagemCategory.command],
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
      name: "Talon Strike",
      cpCost: 1,
      when: "Ваша Shooting фаза или Fight фаза.",
      target: "Один RAVENWING MOUNTED юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по INFANTRY CHARACTER или MOUNTED CHARACTER юниту, добавляйте 1 к броску на ранение.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "Death on the Wind",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один RAVENWING юнит из вашей армии, который только что произвёл стрельбу.",
      effect: "Выберите один вражеский юнит, который получил одно или более попаданий от этих атак. Этот юнит должен пройти Battle-shock тест. При этом, если один или более RAVENWING юнитов из вашей армии находятся в пределах 6\" от этого вражеского юнита, вычитайте 1 из результата теста.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "High-Speed Focus",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один RAVENWING юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычитайте 1 из броска на попадание.",
      restrictions: null,
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "Rapid Reappraisal",
      cpCost: 1,
      when: "Конец Fight фазы вашего противника.",
      target: "Один RAVENWING юнит из вашей армии, который не находится в Engagement Range с одним или более вражескими юнитами.",
      effect: "Уберите ваш юнит с поля боя и поместите его в Strategic Reserves.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
  ],
  restrictions: [
    Restriction.exclusiveKeywordBan(
      factionKeywords: [FactionKeyword.adeptusAstartes],
      description: "Ваша армия может включать DARK ANGELS юниты, но не может включать ADEPTUS ASTARTES юниты из других Чаптеров.",
    ),
  ],
);

