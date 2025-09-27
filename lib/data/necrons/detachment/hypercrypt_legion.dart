import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final hypercryptLegion = Detachment(
  name: "Hypercrypt Legion",
  additionalRules: [
    AdditionalRule(
      name: "Hyperphasing",
      description: '''
Используя фрактальные коридоры, долменные врата и древние технологии трансляции, некроны способны фазировать своё существование. Для ужаснувшегося врага нет безопасного места, когда механические охотники появляются из разворачивающихся планарных решёток, чтобы убивать или уходить от возмездия в бездны тьмы, лишь для того, чтобы материализоваться в другом месте и снова наносить удары.

В конце хода вашего противника вы можете выбрать определённое количество NECRONS юнитов из вашей армии (кроме юнитов, находящихся в Engagement Range с одним или более вражескими юнитами). Максимальное количество юнитов, которые вы можете выбрать, зависит от размера сражения:

BATTLE SIZE    NUMBER OF UNITS
Incursion      До 1 юнита
Strike Force   До 2 юнитов
Onslaught      До 3 юнитов
''',
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Dimensional Overseer",
      description: "Только для NECRONS модели. Пока носитель находится на поле боя или в Strategic Reserves, добавьте 1 к количеству юнитов из вашей армии, которые вы можете выбрать для правила Hyperphasing.",
    ),
    Enhancement(
      name: "Arisen Tyrant",
      description: "Только для NECRONS модели. Каждый раз, когда модель в юните носителя совершает атаку, перебрасывайте броски на попадание 1. Если юнит носителя был выставлен на поле боя в этом ходу, перебрасывайте весь бросок на попадание вместо этого.",
    ),
    Enhancement(
      name: "Hyperspatial Transfer Node",
      description: "Только для NECRONS модели. Каждый раз, когда юнит носителя выполняет Advance, не бросайте кубик для Advance. Вместо этого до конца фазы добавьте 6\" к характеристике Move моделей в юните носителя.",
    ),
    Enhancement(
      name: "Osteoclave Fulcrum",
      description: "Только для NECRONS модели. Модели в юните носителя получают способность Deep Strike.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "HYPERPHASIC RECALL",
      cpCost: 2,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит произвёл стрельбу или бой.",
      target: "Один NECRONS INFANTRY юнит из вашей армии, в котором одна или более моделей были уничтожены в результате атак атакующего юнита, и один дружественный MONOLITH.",
      effect: "Уберите ваш INFANTRY юнит с поля боя, затем разместите его в любом месте поля боя полностью в пределах 6\" от вашего MONOLITH и не в Engagement Range с вражескими юнитами.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "QUANTUM DEFLECTION",
      cpCost: 1,
      when: "Shooting фаза вашего противника или Fight фаза, сразу после того как вражеский юнит выбрал цели.",
      target: "Один NECRONS VEHICLE юнит из вашей армии, выбранный целью одной или более атак атакующего юнита.",
      effect: "До конца фазы модели в вашем юните получают 4+ invulnerable save.",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "REANIMATION CRYPTS",
      cpCost: 1,
      when: "Ваша Command фаза.",
      target: "Ваш NECRONS WARLORD.",
      effect: "Для каждого NECRONS юнита вашей армии, находящегося в Reserves, активируются Reanimation Protocols.",
      categories: [StratagemCategory.command],
    ),
    Stratagem(
      name: "COSMIC PRECISION",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один NECRONS юнит из вашей армии (кроме MONSTER), прибывающий на поле боя с использованием Deep Strike или Hyperphasing в этой фазе.",
      effect: "Ваш юнит может быть размещён в любом месте поля боя на расстоянии более 6\" по горизонтали от всех вражеских моделей.",
      restrictions: "Юнит, выбранный целью этой Stratagem, не может объявлять charge в том же ходу.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "DIMENSIONAL CORRIDOR",
      cpCost: 2,
      when: "Ваша Charge фаза.",
      target: "Один NECRONS юнит из вашей армии, выставленный на поле боя в этом ходу с использованием способности Eternity Gate модели MONOLITH, которая начала ход на поле боя.",
      effect: "Ваш юнит может объявлять charge в этой фазе.",
      categories: [StratagemCategory.charge],
    ),
    Stratagem(
      name: "ENTROPIC DAMPING",
      cpCost: 1,
      when: "Shooting фаза вашего противника, сразу после того как вражеский юнит выбрал цели.",
      target: "Одна TITANIC модель из вашей армии, выбранная целью одной или более атак атакующего юнита и находящаяся в пределах 18\" от него.",
      effect: "До конца фазы оружие моделей атакующего юнита получает способность [HAZARDOUS].",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
