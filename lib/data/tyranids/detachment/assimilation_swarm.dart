import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final assimilationSwarm = Detachment(
  name: "Assimilation Swarm",
  additionalRules: [
    AdditionalRule(
      name: "Feed the Swarm",
      description: "В вашу Command phase каждый отряд HARVESTER из вашей армии может Regenerate один дружественный отряд TYRANIDS в пределах 6\" от него. Отряд может быть регенерирован только один раз за фазу. Каждый раз, когда отряд регенерируется, выполните одно из следующих действий:\n- Одна модель в этом отряде восстанавливает до D3+1 потерянных Wounds.\n- Одна уничтоженная модель INFANTRY (кроме CHARACTERS) возвращается в этот отряд с полным количеством Wounds. Если этот отряд является отрядом ENDLESS MULTITUDE, вместо этого возвращаются до 3 уничтоженных моделей.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Regenerating Monstrosity",
      description: "Только для модели TYRANIDS (кроме моделей MONSTERS). Отряд носителя может быть регенерирован до двух раз за фазу вместо одного.",
    ),
    Enhancement(
      name: "Instinctive Defence",
      description: "Только для модели TYRANIDS. Пока носитель находится в пределах 6\" от одного или более дружественных отрядов HARVESTER, вы можете использовать Stratagem Heroic Intervention на отряд носителя за 0CP. Кроме того, пока носитель находится в пределах 6\" от одного или более дружественных отрядов HARVESTER, модели в отряде носителя имеют способность Fights First.",
    ),
    Enhancement(
      name: "Biophagic Flow (Aura)",
      description: "Только для модели TYRANIDS. Пока дружественная модель HARVESTER находится в пределах 12\" от носителя, при использовании способности Feed the Swarm эта модель HARVESTER может Regenerate один дружественный отряд TYRANIDS в пределах 9\" от неё вместо 6\".",
    ),
    Enhancement(
      name: "Parasitic Biomorphology",
      description: "Только для модели TYRANIDS. Добавьте 1 к характеристике Strength оружия ближнего боя, которым оснащены модели в отряде носителя. В первый раз, когда отряд носителя уничтожает вражеский отряд в фазе Fight, находясь в пределах 6\" от одного или более дружественных отрядов HARVESTER, до конца битвы добавьте 1 к характеристике Attacks оружия ближнего боя, которым оснащены модели в отряде носителя.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "BROODGUARD IMPULSE",
      cpCost: 1,
      when: "Любая фаза.",
      target: "Один отряд HARVESTER из вашей армии, который только что был уничтожен. Вы можете использовать эту Stratagem на этот отряд, даже если он только что был уничтожен.",
      effect: "До конца битвы каждый раз, когда дружественная модель TYRANIDS совершает атаку по вражескому отряду, который уничтожил ваш отряд HARVESTER, добавляйте 1 к броску на пробитие.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "RECLAIM BIOMASS",
      cpCost: 1,
      when: "Любая фаза, когда отряд TYRANIDS из вашей армии уничтожен, до того как последняя модель в нём будет удалена с поля боя.",
      target: "Один отряд HARVESTER из вашей армии в пределах 6\" от уничтоженного отряда.",
      effect: "Regenerate один дружественный отряд TYRANIDS в пределах 6\" от вашего отряда HARVESTER (см. Feed the Swarm).",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "TYRANNOFORMED",
      cpCost: 1,
      when: "Фаза Command.",
      target: "Один отряд HARVESTER из вашей армии, находящийся в пределах досягаемости маркера цели, который вы контролируете.",
      effect: "Этот маркер цели остаётся под вашим контролем, даже если у вас нет моделей в пределах досягаемости, пока ваш оппонент не возьмёт его под контроль в начале или конце любого хода.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "ABLATIVE CARAPACE",
      cpCost: 2,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели.",
      target: "Один отряд HARVESTER из вашей армии, выбранный целью одной или нескольких атак атакующего отряда.",
      effect: "До конца фазы модели в вашем отряде получают способность Feel No Pain 5+. Если ваш отряд находится в пределах досягаемости маркера цели, который вы контролируете, до конца фазы модели в вашем отряде вместо этого получают способность Feel No Pain 4+.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SECURE BIOMASS",
      cpCost: 1,
      when: "Фаза Fight.",
      target: "Один отряд TYRANIDS из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы оружие ближнего боя, которым оснащены модели в вашем отряде, получает способность [LETHAL HITS]. Если ваш отряд является отрядом HARVESTER, каждый раз, когда модель в этом отряде совершает атаку в ближнем бою, немодифицированный результат 5+ на попадание также считается Critical Hit.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "RAPACIOUS HUNGER",
      cpCost: 1,
      when: "Ваша фаза Fight.",
      target: "Один отряд TYRANIDS из вашей армии, который только что уничтожил вражеский отряд.",
      effect: "Ваш отряд немедленно выполняет Regenerate (см. Feed the Swarm). При этом, если ваш отряд является отрядом HARVESTER и вы выбираете восстановление до D3 потерянных Wounds одной модели, эта модель восстанавливает до 3 Wounds вместо D3.",
      categories: [StratagemCategory.fight],
    ),
  ],
);
