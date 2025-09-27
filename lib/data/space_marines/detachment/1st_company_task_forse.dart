import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final firstCompanyTaskForce = Detachment(
  name: "1st Company Task Force",
  additionalRules: [
    AdditionalRule(
      name: "Extremis-level Threat",
      description: "Один раз за сражение, в вашей Command фазе, вы можете использовать эту способность. Если вы это сделаете, до начала вашей следующей Command фазы каждый раз, когда модель из вашей армии с способностью Oath of Moment совершает атаку по вашей цели Oath of Moment, вы можете перебросить бросок на Wound.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "The Imperium's Sword",
      description: "Только для ADEPTUS ASTARTES моделей. Добавьте 1 к характеристике Attacks их melee weapons. Один раз за сражение, в начале любой фазы, носитель может использовать это Enhancement. Если он это делает, до конца фазы добавьте 1 к характеристике Attacks melee weapons всех других моделей в его юните.",
    ),
    Enhancement(
      name: "Fear Made Manifest",
      description: "Только для ADEPTUS ASTARTES моделей. Пока противник (кроме MONSTERS и VEHICLES) находится в пределах 6\" от носителя, каждый раз, когда этот юнит проваливает Battle-shock test, одна модель в нём уничтожается (выбирается контролирующим игроком). Один раз за сражение, когда такой юнит проваливает Battle-shock test, вы можете вместо этого выбрать D3 моделей в этом юните для уничтожения этим образом.",
    ),
    Enhancement(
      name: "Rites of War",
      description: "Только для ADEPTUS ASTARTES TERMINATOR моделей. Улучшите характеристику Objective Control носителя на 1. Один раз за сражение, в начале любой фазы, носитель может использовать это Enhancement. Если он это делает, до конца фазы добавьте 1 к характеристике Objective Control всех других моделей в его юните.",
    ),
    Enhancement(
      name: "Iron Resolve",
      description: "Только для ADEPTUS ASTARTES TERMINATOR моделей. Носитель получает способность Feel No Pain 5+. Один раз за сражение, после того как юнит носителя выбран целью одной или нескольких атак, носитель может использовать это Enhancement. Если он это делает, до конца фазы модели в его юните получают способность Feel No Pain 5+.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "ARMOUR OF CONTEMPT",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал свои цели.",
      target: "Один ADEPTUS ASTARTES юнит из вашей армии, выбранный в качестве цели одной или нескольких атак вражеского юнита.",
      effect: "До тех пор, пока атакующий юнит не завершит свои атаки, каждый раз, когда атака нацелена на ваш юнит, ухудшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "HEROES OF THE CHAPTER",
      cpCost: 1,
      when: "Ваша Shooting или Fight фаза.",
      target: "Один ADEPTUS ASTARTES TERMINATOR, BLADEGUARD VETERAN SQUAD, STERNGUARD VETERAN SQUAD или VANGUARD VETERAN SQUAD юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку, добавляйте 1 к броску на Hit. Если ваш юнит находится Below Half-strength, добавляйте также 1 к броску на Wound.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "TERRIFYING PROFICIENCY",
      cpCost: 1,
      when: "Ваша Fight фаза.",
      target: "Один ADEPTUS ASTARTES TERMINATOR, BLADEGUARD VETERAN SQUAD, STERNGUARD VETERAN SQUAD или VANGUARD VETERAN SQUAD юнит из вашей армии, который в этом ходу выполнил Charge move и уничтожил одного или более вражеских юнитов.",
      effect: "В Command фазе вашего противника каждый вражеский юнит в пределах 6\" от вашего юнита должен пройти Battle-shock test. Если юнит, выполняющий этот тест, находится Below Half-strength, вычитайте 1 из теста. Вражеские юниты, затронутые этой Stratagem, не обязаны проходить другие Battle-shock тесты в той же фазе.",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "DUTY AND HONOUR",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один ADEPTUS ASTARTES TERMINATOR, BLADEGUARD VETERAN SQUAD, STERNGUARD VETERAN SQUAD или VANGUARD VETERAN SQUAD юнит из вашей армии в пределах досягаемости маркера цели, которым вы владеете.",
      effect: "Этот маркер цели остаётся под вашим контролем, даже если у вас нет моделей в пределах его досягаемости, до тех пор, пока ваш противник не получит контроль над ним в начале или в конце любого хода.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "ORBITAL TELEPORTARIUM",
      cpCost: 1,
      when: "Конец Fight фазы вашего противника.",
      target: "Один ADEPTUS ASTARTES TERMINATOR юнит из вашей армии.",
      effect: "Уберите ваш юнит с поля боя и поместите его в Strategic Reserves. Он вернётся на поле боя на шаге Reinforcements вашей следующей Movement фазы с использованием способности Deep Strike.",
      restrictions: "Нельзя выбрать юнит, находящийся в Engagement Range с одним или более вражескими юнитами.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "LEGENDARY FORTITUDE",
      cpCost: 1,
      when: "Charge фаза вашего противника, сразу после того как вражеский юнит завершил Charge move.",
      target: "Один ADEPTUS ASTARTES TERMINATOR, BLADEGUARD VETERAN SQUAD, STERNGUARD VETERAN SQUAD или VANGUARD VETERAN SQUAD юнит из вашей армии, находящийся в Engagement Range с этим вражеским юнитом.",
      effect: "До конца хода каждый раз, когда атака распределяется на модель в вашем юните, вычитайте 1 из характеристики Damage этой атаки.",
      restrictions: null,
      categories: [StratagemCategory.charge],
    ),
  ],
  restrictions: [],
);
