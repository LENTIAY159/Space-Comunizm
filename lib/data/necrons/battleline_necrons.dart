import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_necrons.dart';

List<Unit> getBattlelineNecrons() {
  return [
    Unit(
      id: 'NEC_BTL_01',
      name: 'Immortals',
      move: '5"',
      toughness: '5',
      save: '3+',
      wounds: '1',
      leadership: '7+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        gaussBlaster,
        teslaCarbine,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '2',),
      ],
      coreAbilities: [],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Implacable Eradication: Каждый раз, когда модель в этом отряду совершает атаку, перебросьте бросок на ранение 1. Если цель этой атаки - вражеский отряд в пределах досягаемости объективного маркера, вместо этого вы можете перебросить бросок на ранение.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 70),
        UnitCompositionOption(id: '2', modelCount: 10, points: 150),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: gauss blaster; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.immortals,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: 'Все модели в этом отряду могут заменить свой gauss blaster на 1 tesla carbine.',
      damaged: {},
    ),
    Unit(
      id: 'NEC_BTL_02',
      name: 'Necron Warriors',
      move: '5"',
      toughness: '4',
      save: '4+',
      wounds: '1',
      leadership: '7+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        gaussFlayer,
        gaussReaper,
      ],
      meleeWeapons: [
        closeCombatWeapon,
      ],
      coreAbilities: [],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Their Number is Legion: Каждый раз, когда активируется Reanimation Protocols этого отряда, вы можете перебросить кости, чтобы увидеть, сколько ран восстанавливается.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 90),
        UnitCompositionOption(id: '2', modelCount: 20, points: 200),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: gauss flayer; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.necronWarriors,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: 'Любое количество моделей может заменить свой gauss flayer на 1 gauss reaper.',
      damaged: {},
    )

  ];
}