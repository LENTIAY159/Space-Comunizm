import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final soulforgedWarpack = Detachment(
  name: "Soulforged Warpack",
  additionalRules: [
    AdditionalRule(
      name: "Debt to the Soul Forge",
      description: "Каждый раз, когда HERETIC ASTARTES DAEMON VEHICLE юнит из вашей армии заключает Dark Pact, он может активировать свой контракт. Если он это делает, вычтите 1 из результата Leadership test при совершении этого Dark Pact, и до конца фазы: каждый раз, когда модель в этом юните совершает дальнюю атаку, добавляйте 1 к броску на ранение. Добавьте 2 к характеристике Attacks оружия ближнего боя, которым оснащены модели в этом юните.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Forge's Blessing",
      description: "Только для HERETIC ASTARTES модели. В вашу Command phase выберите один дружественный HERETIC ASTARTES VEHICLE юнит в пределах 12\" от носителя. До начала вашей следующей Command phase этот юнит получает способность Feel No Pain 6+.",
    ),
    Enhancement(
      name: "Invigorated Mechatendrils",
      description: "Только для WARPSMITH модели. Добавьте 4\" к характеристике Move носителя.",
    ),
    Enhancement(
      name: "Tempting Addendum",
      description: "Только для HERETIC ASTARTES модели. Каждый раз, когда HERETIC ASTARTES DAEMON VEHICLE юнит из вашей армии активирует свой контракт, находясь в пределах 3\" от носителя: - Если он получает одну или более mortal wounds в результате этого Dark Pact, добавьте 1 к числу полученных mortal wounds. - До конца фазы каждый раз, когда модель в этом юните совершает атаку, вы можете перебросить бросок на попадание.",
    ),
    Enhancement(
      name: "Soul Harvester",
      description: "Только для HERETIC ASTARTES модели. Пока носитель находится на поле боя, каждый раз, когда вражеский юнит в пределах 12\" от носителя уничтожается, бросьте один D6: при результате 5+ вы получаете 1CP.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "DESPERATE PLEDGE",
      cpCost: 1,
      when: "Ваша Shooting phase или Fight фаза.",
      target: "Один HERETIC ASTARTES DAEMON VEHICLE юнит из вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе.",
      effect: "До конца фазы, если ваш юнит активирует свой контракт, каждый раз, когда он совершает атаку, улучшайте характеристику Armour Penetration этой атаки на 1.",
      restrictions: null,
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "GLUT OF SOULS",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один HERETIC ASTARTES DAEMON VEHICLE юнит из вашей армии (кроме TITANIC), который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы, если ваш юнит активирует свой контракт, каждый раз, когда он уничтожает вражескую модель атакой, бросьте один D6: при 5+ ваш юнит восстанавливает 1 потерянную рану после того, как завершит все свои атаки (максимум 6 ран).",
      restrictions: null,
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "DAEMONIC POSSESION",
      cpCost: 1,
      when: "Ваша Command phase.",
      target: "Один HERETIC ASTARTES VEHICLE юнит из вашей армии (кроме DAEMON).",
      effect: "До конца сражения ваш юнит получает ключевое слово DAEMON.",
      restrictions: null,
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "UNSTOPPABLE RAMPAGE",
      cpCost: 1,
      when: "Ваша Movement phase или Charge фаза.",
      target: "Один HERETIC ASTARTES VEHICLE или VASHTORR THE ARKIFANE юнит из вашей армии, который ещё не был выбран для перемещения или charge в этой фазе.",
      effect: "До конца фазы каждый раз, когда ваш юнит выполняет Normal, Advance или charge перемещение, он может перемещаться по горизонтали сквозь элементы ландшафта, как если бы их не было.",
      restrictions: null,
      categories: [StratagemCategory.move, StratagemCategory.charge],
    ),
    Stratagem(
      name: "PREDATORY PURSUIT",
      cpCost: 1,
      when: "Movement фаза вашего противника, сразу после того как вражеский юнит завершил Normal, Advance или Fall Back перемещение.",
      target: "Один HERETIC ASTARTES VEHICLE или VASHTORR THE ARKIFANE юнит из вашей армии, находящийся в пределах 9\" от этого вражеского юнита и не в Engagement Range с одним или более вражескими юнитами.",
      effect: "Ваш юнит может выполнить Normal move на расстояние до 6\", но должен закончить это перемещение как можно ближе к этому вражескому юниту.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "FEEDING FRENZY",
      cpCost: 1,
      when: "Movement фаза вашего противника, когда вражеский юнит (кроме MONSTER и VEHICLE) выбирается для Fall Back.",
      target: "Один HERETIC ASTARTES DAEMON VEHICLE или VASHTORR THE ARKIFANE юнит из вашей армии, находящийся в Engagement Range с этим вражеским юнитом.",
      effect: "До конца фазы каждый раз, когда вражеский юнит (кроме MONSTER и VEHICLE) в Engagement Range с вашими юнитами делает Fall Back, все модели в этом юните должны пройти Desperate Escape test. Если этот вражеский юнит находится в состоянии Battle-shock, вычитайте 1 из каждого такого теста.",
      restrictions: null,
      categories: [StratagemCategory.move],
    ),
  ],
  restrictions: [],
);
