import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';

final unendingSwarm = Detachment(
  name: "Unending Swarm",
  additionalRules: [
    AdditionalRule(
      name: "Insurmountable Odds",
      description: "Каждый раз, когда вражеский отряд выбирается для стрельбы, после того как этот отряд завершил все свои атаки, если одна или более моделей из одного или нескольких отрядов ENDLESS MULTITUDE вашей армии были уничтожены в результате этих атак, каждый такой отряд может выполнить Surge перемещение. Для этого бросьте D6: этот отряд может переместиться на количество дюймов, равное результату, но должен завершить перемещение как можно ближе к ближайшему вражескому отряду (кроме AIRCRAFT). При этом модели могут перемещаться в Engagement Range с вражескими отрядами. Отряд не может выполнить Surge перемещение, если он находится в состоянии Battle-shocked.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Relentless Hunger",
      description: "Только для модели TYRANIDS. Добавьте 2\" к характеристике Move моделей в отряде носителя.",
    ),
    Enhancement(
      name: "Naturalised Camouflage",
      description: "Только для модели TYRANIDS. В начале первого раунда битвы выберите до трёх дружественных отрядов ENDLESS MULTITUDE в пределах 9\" от носителя. До конца этого раунда, каждый раз, когда дальняя атака нацелена на один из этих отрядов, модели в этом отряде получают Benefit of Cover против этой атаки.",
    ),
    Enhancement(
      name: "Piercing Talons",
      description: "Только для модели TYRANIDS. Каждый раз, когда модель в отряде носителя совершает атаку, при Critical Wound улучшайте характеристику Armour Penetration этой атаки на 1.",
    ),
    Enhancement(
      name: "Adrenalised Onslaught",
      description: "Только для модели TYRANIDS. Каждый раз, когда отряд носителя выполняет Pile In или Consolidation перемещение, модели в этом отряде могут перемещаться на дополнительные 3\".",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "SYNAPTIC GOADING",
      cpCost: 1,
      when: "Любая фаза, сразу перед тем как отряд ENDLESS MULTITUDE вашей армии, находящийся в Synapse Range вашей армии, выполняет Surge перемещение",
      target: "Этот отряд ENDLESS MULTITUDE",
      effect: "При выполнении этого Surge перемещения вы можете перебросить бросок D6, определяющий дальность перемещения, и ваш отряд может завершить перемещение как можно ближе к ближайшему маркеру цели (вместо ближайшего вражеского отряда). Все остальные правила выполнения Surge перемещений сохраняются.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "UNENDING WAVES",
      cpCost: 2,
      when: "Любая фаза",
      target: "Один отряд ENDLESS MULTITUDE вашей армии, который только что был уничтожен. Вы можете использовать эту Stratagem на этот отряд, даже если он только что был уничтожен",
      effect: "Добавьте новый отряд в вашу армию, идентичный уничтоженному, в Strategic Reserves, с его Starting Strength.",
      restrictions: "Любые уничтоженные CHARACTER, присоединённые к вашему отряду, не возвращаются. Вы можете использовать эту Stratagem только один раз за битву",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "TEEMING MASSES",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента или фаза Fight, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд ENDLESS MULTITUDE вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "До конца фазы каждый раз, когда атака нацелена на ваш отряд, вычитайте 1 из броска на попадание.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "SWARMING MASSES",
      cpCost: 1,
      when: "Ваша фаза Shooting или фаза Fight",
      target: "Один отряд ENDLESS MULTITUDE вашей армии, который ещё не был выбран для стрельбы или боя в этой фазе",
      effect: "До конца фазы оружие, которым оснащены модели в вашем отряде, получает способность [SUSTAINED HITS 1], и если в вашем отряде 15 или более моделей, каждый раз, когда модель в нём совершает атаку, немодифицированный результат 5+ на попадание считается Critical Hit.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "BOUNDING ADVANCE",
      cpCost: 1,
      when: "Ваша фаза Movement",
      target: "Один отряд ENDLESS MULTITUDE вашей армии",
      effect: "До конца фазы каждый раз, когда ваш отряд выполняет Advance перемещение, не выполняйте бросок Advance. Вместо этого до конца фазы добавьте 6\" к характеристике Move моделей в вашем отряде.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "PRESERVATION IMPERATIVE",
      cpCost: 1,
      when: "Фаза Shooting вашего оппонента, сразу после того как вражеский отряд выбрал цели",
      target: "Один отряд ENDLESS MULTITUDE вашей армии, выбранный целью одной или нескольких атак атакующего отряда",
      effect: "До конца фазы ваш отряд считается состоящим из менее чем пяти моделей для целей способности [BLAST].",
      categories: [StratagemCategory.shooting],
    ),
  ],
);