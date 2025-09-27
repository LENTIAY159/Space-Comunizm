import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';
import '../../z_unit_models/keyword_list.dart';


final Detachment carnivalOfExcess = Detachment(
  name: "Carnival of Excess",

  additionalRules: [
    AdditionalRule(
      name: "Daemonic Empowerment",
      description:
      "Пока юнит EMPEROR'S CHILDREN из вашей армии находится в пределах 6\" от одного или более дружественных юнитов LEGIONS OF EXCESS, он получает состояние Empowered.\nПока юнит LEGIONS OF EXCESS из вашей армии находится в пределах 6\" от одного или более дружественных юнитов EMPEROR'S CHILDREN, он получает состояние Empowered.\n\nПока юнит из вашей армии имеет состояние Empowered, оружие, которым экипированы модели в этом юните, имеет способность [sustained hits 1]. Если такое оружие уже имеет эту способность, каждый раз, когда совершается атака этим оружием, немодифицированный бросок Hit 5+ засчитывается как Critical Hit.",
    ),
    AdditionalRule(
      name: "LEGIONS OF EXCESS",
      description:
      "Вы можете включать юниты LEGIONS OF EXCESS в свою армию, даже если у них нет ключевого слова фракции EMPEROR'S CHILDREN. Общая стоимость в очках таких юнитов, которые вы можете включить в свою армию:\nIncursion: До 500 очков\nStrike Force: До 1000 очков\nOnslaught: До 1500 очков\nНи одна модель LEGIONS OF EXCESS из вашей армии не может быть вашим WARLORD.",
    ),
  ],

  enhancements: [
    Enhancement(
      name: "Empyric Suffusion",
      description:
      "Только модель EMPEROR'S CHILDREN. Один раз за раунд боя вы можете выбрать целью один дружественный юнит SLAANESH в пределах 6\" от носителя для стратагемы Heroic Intervention за 0CP.",
    ),
    Enhancement(
      name: "Dark Blessings",
      description:
      "Только модель EMPEROR'S CHILDREN INFANTRY. Один раз за бой, сразу после того, как вражеский юнит выбрал свои цели, носитель может использовать это улучшение. Если он это делает, до конца фазы носитель имеет неуязвимый спас 3+.",
    ),
    Enhancement(
      name: "Possessed Blade",
      description:
      "Только модель EMPEROR'S CHILDREN. В начале боя выберите одно оружие ближнего боя, которым экипирован носитель; добавьте 1 к характеристике Attacks этого оружия. Кроме того, каждый раз, когда носитель выбран для сражения, он может использовать это улучшение. Если он это делает, при разрешении этих атак добавьте 1 к характеристике Damage этого оружия и это оружие имеет способности [devastating wounds] и [hazardous].",
    ),
    Enhancement(
      name: "Warp Walker",
      description:
      "Только модель EMPEROR'S CHILDREN или KEEPER OF SECRETS. Каждый раз, когда юнит носителя совершает Advance, не делайте бросок Advance. Вместо этого до конца фазы добавьте 6\" к характеристике Move моделей в этом юните. Каждый раз, когда модель в юните носителя совершает движение Normal, Advance или Fall Back, она может двигаться через вражеские модели. При этом она может двигаться в пределах Engagement Range таких моделей, но не может закончить это движение в пределах Engagement Range от них, и любой тест Desperate Escape автоматически проходит.",
    ),
  ],

  stratagems: [
    Stratagem(
      name: "SUSTAINED BY AGONY",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when:
      "Фаза Fight, сразу после того, как юнит EMPEROR'S CHILDREN из вашей армии уничтожает вражеский юнит.",
      target: "Этот юнит EMPEROR'S CHILDREN.",
      effect:
      "Выберите один дружественный юнит LEGIONS OF EXCESS в пределах 6\" от вашего юнита. Одна модель в этом юните LEGIONS OF EXCESS восстанавливает до 3 потерянных ран или, если это юнит DAEMONETTES, вместо этого верните в него до D3+3 уничтоженных моделей.",
    ),
    Stratagem(
      name: "ECSTATIC SLAUGHTER",
      cpCost: 1,
      categories: [StratagemCategory.fight],
      when:
      "Фаза Fight, сразу после того, как юнит LEGIONS OF EXCESS из вашей армии уничтожает вражеский юнит.",
      target:
      "Этот юнит LEGIONS OF EXCESS и один дружественный юнит EMPEROR'S CHILDREN в пределах 6\" от него, который не находится в пределах Engagement Range от одного или более вражеских юнитов.",
      effect:
      "Ваш юнит EMPEROR'S CHILDREN может объявить атаку. Если он это делает и уже был выбран для сражения в эту фазу, он не может сражаться снова в эту фазу.",
    ),
    Stratagem(
      name: "VIOLENT CRESCENDO",
      cpCost: 2,
      categories: [StratagemCategory.fight],
      when: "Фаза Fight.",
      target:
      "Один юнит SLAANESH BEASTS, SLAANESH INFANTRY или SLAANESH MOUNTED из вашей армии, который не был выбран для сражения в эту фазу.",
      effect:
      "До конца фазы каждый раз, когда модель в вашем юните совершает движение Pile-in или Consolidation, она может двигаться до 6\" вместо до 3\". При этом она не обязана заканчивать это движение ближе к ближайшей вражеской модели, при условии, что она заканчивает это движение как можно ближе к ближайшему вражескому юниту.",
    ),
    Stratagem(
      name: "SYCOPHANTIC SURGE",
      cpCost: 1,
      categories: [StratagemCategory.charge],
      when: "Ваша фаза Charge.",
      target: "Один юнит LEGIONS OF EXCESS из вашей армии.",
      effect:
      "До конца фазы ваш юнит может объявить атаку в ход, в который он совершил Advance или Fall Back, при условии, что по крайней мере одна из целей этой атаки находится в пределах Engagement Range от одного или более юнитов EMPEROR'S CHILDREN из вашей армии.",
    ),
    Stratagem(
      name: "UNCANNY REACTIONS",
      cpCost: 1,
      categories: [StratagemCategory.shooting],
      when:
      "Фаза Shooting вашего противника, сразу после того, как вражеский юнит выбрал свои цели.",
      target:
      "Один юнит SLAANESH из вашей армии, который был выбран в качестве цели одной или более атак атакующего юнита.",
      effect:
      "До конца фазы каждый раз, когда атака нацелена на ваш юнит, вычтите 1 из броска Hit.",
    ),
    Stratagem(
      name: "DARK APPARITIONS",
      cpCost: 2,
      categories: [StratagemCategory.fight],
      when: "Конец фазы Fight вашего противника.",
      target:
      "Один юнит DAEMONETTES из вашей армии, который не находится в пределах Engagement Range от одного или более вражеских юнитов.",
      effect:
      "Уберите ваш юнит с поля боя и поместите его в Strategic Reserves. Если он возвращается на поле боя в шаге Reinforcements вашей следующей фазы Movement, используя способность Deep Strike, он может быть размещен в любом месте, которое находится более чем в 6\" по горизонтали от всех вражеских юнитов (вместо более чем в 9\"), при условии, что он также размещается полностью в пределах 9\" от одного или более дружественных юнитов EMPEROR'S CHILDREN.",
    ),
  ],

  restrictions: [],
);