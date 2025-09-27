import '../../z_datachment_model/detachment_model.dart';
import '../../z_datachment_model/detachment_rule.dart';
import '../../z_datachment_model/enhancement_model.dart';
import '../../z_datachment_model/restriction_model.dart';
import '../../z_datachment_model/stratagem_model.dart';


final awakenedDynasty = Detachment(
  name: "Awakened Dynasty",
  additionalRules: [
    AdditionalRule(
      name: "Command Protocols",
      description: "Пока NECRONS CHARACTER модель возглавляет этот юнит, каждый раз, когда модель в этом юните совершает атаку, добавляйте 1 к броску на попадание.",
    ),
  ],
  enhancements: [
    Enhancement(
      name: "Veil of Darkness",
      description: "Только для NECRONS модели. Один раз за сражение, в конце хода противника, если юнит носителя не находится в Engagement Range с вражескими юнитами, носитель может использовать это Enhancement. Если он это делает, уберите этот юнит с поля боя. Затем, на шаге Reinforcements вашей следующей Movement фазы, разместите этот юнит в любом месте поля боя на расстоянии более 9\" по горизонтали от всех вражеских моделей.",
    ),
    Enhancement(
      name: "Nether-realm Casket",
      description: "Только для NECRONS модели. Пока носитель возглавляет юнит, модели в этом юните имеют способность Stealth.",
    ),
    Enhancement(
      name: "Phasal Subjugator (Aura)",
      description: "Только для NECRONS модели. Пока дружественный NECRONS юнит (кроме CHARACTER юнитов) находится в пределах 6\" от носителя, каждый раз, когда модель в этом юните совершает атаку, добавляйте 1 к броску на попадание.",
    ),
    Enhancement(
      name: "Enaegic Dermal Bond",
      description: "Только для NECRONS модели. Носитель получает способность Feel No Pain 4+.",
    ),
  ],
  stratagems: [
    Stratagem(
      name: "PROTOCOL OF THE ETERNAL REVENANT",
      cpCost: 1,
      when: "Любая фаза.",
      target: "Одна NECRONS INFANTRY CHARACTER модель из вашей армии, которая только что была уничтожена.",
      effect: "В конце фазы верните вашу модель на поле боя как можно ближе к месту, где она была уничтожена, но не в Engagement Range с вражескими юнитами, с половиной от своего начального количества ран.",
      restrictions: "Каждую модель можно выбрать целью этой Stratagem только один раз за сражение.",
      categories: [StratagemCategory.command, StratagemCategory.move, StratagemCategory.shooting, StratagemCategory.charge, StratagemCategory.fight],
    ),
    Stratagem(
      name: "PROTOCOL OF THE UNDYING LEGIONS",
      cpCost: 1,
      when: "Shooting фаза противника или Fight фаза, сразу после того как вражеский юнит завершил свои атаки.",
      target: "Один NECRONS юнит из вашей армии, в котором одна или более моделей были уничтожены в результате атак атакующего юнита.",
      effect: "Ваш юнит активирует свои Reanimation Protocols и восстанавливает D3 раны (или D3+1, если NECRONS CHARACTER возглавляет ваш юнит).",
      categories: [StratagemCategory.shooting, StratagemCategory.fight],
    ),
    Stratagem(
      name: "PROTOCOL OF THE HUNGRY VOID",
      cpCost: 1,
      when: "Fight фаза.",
      target: "Один NECRONS юнит из вашей армии, который ещё не был выбран для боя в этой фазе.",
      effect: "До конца фазы добавляйте 1 к характеристике Strength оружия ближнего боя моделей в вашем юните. Кроме того, если NECRONS CHARACTER возглавляет ваш юнит, до конца фазы улучшайте характеристику Armour Penetration оружия ближнего боя на 1.",
      categories: [StratagemCategory.fight],
    ),
    Stratagem(
      name: "PROTOCOL OF THE SUDDEN STORM",
      cpCost: 1,
      when: "Ваша Movement фаза.",
      target: "Один NECRONS юнит из вашей армии.",
      effect: "До конца хода дальнобойное оружие моделей в вашем юните получает способность [ASSAULT]. Кроме того, если NECRONS CHARACTER возглавляет ваш юнит, до конца фазы вы можете перебросить броски Advance для вашего юнита.",
      categories: [StratagemCategory.move],
    ),
    Stratagem(
      name: "PROTOCOL OF THE CONQUERING TYRANT",
      cpCost: 1,
      when: "Ваша Shooting фаза.",
      target: "Один NECRONS юнит из вашей армии, который ещё не был выбран для стрельбы в этой фазе.",
      effect: "До конца фазы каждый раз, когда модель в вашем юните совершает атаку по цели в пределах половины дальности, перебрасывайте броски на попадание 1. Если NECRONS CHARACTER возглавляет ваш юнит, вместо этого можно перебросить весь бросок на попадание.",
      categories: [StratagemCategory.shooting],
    ),
    Stratagem(
      name: "PROTOCOL OF THE VENGEFUL STARS",
      cpCost: 2,
      when: "Shooting фаза противника, сразу после того как вражеский юнит уничтожил NECRONS юнит из вашей армии.",
      target: "Один NECRONS CHARACTER юнит из вашей армии, который находился в пределах 6\" от этого NECRONS юнита в момент его уничтожения.",
      effect: "После того как атакующий юнит завершил свои атаки, ваш юнит может стрелять, как если бы это была ваша Shooting фаза, но только по этому вражескому юниту и только если он является допустимой целью.",
      categories: [StratagemCategory.shooting],
    ),
  ],
);
