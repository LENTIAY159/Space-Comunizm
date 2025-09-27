import '../z_datachment_model/stratagem_model.dart';

final List<Stratagem> coreStratagems = [
  // УНИВЕРСАЛЬНЫЕ
  Stratagem(
    name: "Command Re-roll",
    categories: StratagemCategory.values,
    cpCost: 1,
    when: "Любая фаза, сразу после того как вы сделали Advance roll, Charge roll, Desperate Escape test или Hazardous test для юнита из вашей армии, или Hit roll, Wound roll, Damage roll или спасбросок для модели в этом юните, или бросок для определения количества атак оружием, которым оснащена модель в этом юните. Если вы используете быстрое бросание кубов, эта Stratagem всё равно может быть применена после выполнения нескольких бросков или спасбросков одновременно.",
    target: "Этот юнит или модель из вашей армии.",
    effect: "Вы перебрасываете этот бросок, тест или спасбросок. Если вы используете быстрое бросание кубов, выберите один из этих бросков или спасбросков для переброса.",
    restrictions: null,
  ),

  // 📗 COMMAND PHASE
  Stratagem(
    name: "Insane Bravery",
    categories: [StratagemCategory.command],
    cpCost: 1,
    when: "Шаг Battle-shock вашей Command phase, сразу перед тем как вы делаете Battle-shock test для юнита из вашей армии.",
    target: "Этот юнит из вашей армии.",
    effect: "Ваш юнит автоматически проходит этот Battle-shock test.",
    restrictions: "Вы не можете использовать эту Stratagem более одного раза за сражение.",
  ),

  // 📙 SHOOTING PHASE
  Stratagem(
    name: "Grenade",
    categories: [StratagemCategory.shooting],
    cpCost: 1,
    when: "Ваша Shooting phase.",
    target: "Один GRENADES юнит из вашей армии (кроме юнитов, которые делали Advance, Fell Back или стреляли в этом ходу) и который не находится в Engagement Range с одним или более вражескими юнитами.",
    effect: "Выберите одну GRENADES модель в вашем юните и один вражеский юнит, который не находится в Engagement Range ни с одним юнитом вашей армии и находится в пределах 8\" и в зоне видимости этой GRENADES модели. Бросьте шесть D6: за каждый результат 4+ этот вражеский юнит получает 1 mortal wound.",
    restrictions: null,
  ),

  Stratagem(
    name: "Fire Overwatch",
    categories: [StratagemCategory.shooting],
    cpCost: 1,
    when: "Movement или Charge фаза вашего противника, сразу после того как вражеский юнит был выставлен на поле или начал/закончил Normal, Advance или Fall Back перемещение, или объявил charge.",
    target: "Один юнит из вашей армии, находящийся в пределах 24\" от этого вражеского юнита и который мог бы стрелять, если бы это была ваша Shooting phase.",
    effect: "Если этот вражеский юнит находится в зоне видимости вашего юнита, ваш юнит может стрелять в этот вражеский юнит, как если бы это была ваша Shooting phase.",
    restrictions: "Вы не можете выбрать TITANIC юнит как цель этой Stratagem. До конца фазы каждая дальняя атака вашей модели попадает только при неизменённом результате 6 на Hit roll. Вы можете использовать эту Stratagem только один раз за ход.",
  ),

  Stratagem(
    name: "Go to Ground",
    categories: [StratagemCategory.shooting],
    cpCost: 1,
    when: "Shooting phase противника, сразу после того как вражеский юнит выбрал свои цели.",
    target: "Один INFANTRY юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
    effect: "До конца фазы все модели в вашем юните имеют 6+ invulnerable save и Benefit of Cover.",
    restrictions: null,
  ),

  Stratagem(
    name: "Smokescreen",
    categories: [StratagemCategory.shooting],
    cpCost: 1,
    when: "Shooting phase противника, сразу после того как вражеский юнит выбрал свои цели.",
    target: "Один SMOKE юнит из вашей армии, выбранный как цель одной или более атак атакующего юнита.",
    effect: "До конца фазы все модели в вашем юните получают Benefit of Cover и способность Stealth.",
    restrictions: null,
  ),

  // 📒 MOVE PHASE
  Stratagem(
    name: "Rapid Ingress",
    categories: [StratagemCategory.move],
    cpCost: 1,
    when: "Конец Movement фазы противника.",
    target: "Один юнит из вашей армии, находящийся в Reserves.",
    effect: "Ваш юнит может прибыть на поле боя, как если бы это был шаг Reinforcements вашей Movement phase, и если у всех моделей в этом юните есть способность Deep Strike, вы можете разместить его, как описано в способности Deep Strike (даже если это не ваша Movement phase).",
    restrictions: "Вы не можете использовать эту Stratagem, чтобы юнит прибыл на поле боя в ходе, в который он не мог бы сделать это по обычным правилам.",
  ),

  // 📕 CHARGE PHASE
  Stratagem(
    name: "Tank Shock",
    categories: [StratagemCategory.charge],
    cpCost: 1,
    when: "Ваша Charge phase, сразу после того как VEHICLE юнит из вашей армии завершил Charge move.",
    target: "Этот VEHICLE юнит.",
    effect: "Выберите один вражеский юнит в Engagement Range с вашим юнитом и одну VEHICLE модель в вашем юните, которая находится в Engagement Range с этим вражеским юнитом. Бросьте количество D6, равное Toughness выбранной VEHICLE модели. За каждый результат 5+ вражеский юнит получает 1 mortal wound (максимум 6 mortal wounds).",
    restrictions: null,
  ),

  Stratagem(
    name: "Heroic Intervention",
    categories: [StratagemCategory.charge],
    cpCost: 1,
    when: "Charge фаза противника, сразу после того как вражеский юнит завершил Charge move.",
    target: "Один юнит из вашей армии, находящийся в пределах 6\" от этого вражеского юнита и который мог бы объявить charge на этот юнит, если бы это была ваша Charge phase.",
    effect: "Ваш юнит объявляет charge, целью которого является только этот вражеский юнит, и вы разыгрываете этот charge, как если бы это была ваша Charge phase.",
    restrictions: "Вы можете выбрать VEHICLE юнит только если он является WALKER. Даже если charge успешен, ваш юнит не получает бонуса Charge в этом ходу.",
  ),

  // 📓 FIGHT PHASE
  Stratagem(
    name: "Counter-offensive",
    categories: [StratagemCategory.fight],
    cpCost: 2,
    when: "Fight фаза, сразу после того как вражеский юнит завершил свои атаки.",
    target: "Один юнит из вашей армии, находящийся в Engagement Range с одним или более вражескими юнитами и который ещё не был выбран для атаки в этой фазе.",
    effect: "Ваш юнит атакует следующим.",
    restrictions: null,
  ),

  Stratagem(
    name: "Epic Challenge",
    categories: [StratagemCategory.fight],
    cpCost: 1,
    when: "Fight фаза, когда CHARACTER юнит из вашей армии, находящийся в Engagement Range с одним или более Attached юнитами, выбран для атаки.",
    target: "Одна CHARACTER модель в вашем юните.",
    effect: "До конца фазы все melee атаки этой модели получают способность [PRECISION].",
    restrictions: null,
  ),
];
