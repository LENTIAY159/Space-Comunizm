import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_necrons.dart';

List<Unit> getOtherDatasheetsNecrons() {
  return [
    Unit(
      id: 'NEC_OTH_01',
      name: 'Lokhust Heavy Destroyers',
      move: '8"',
      toughness: '6',
      save: '3+',
      wounds: '4',
      leadership: '7+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '60mm',
      rangedWeapons: [
        enmiticExterminator,
        gaussDestructor,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '2',),
      ],
      coreAbilities: [],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Optimised for Slaughter: Каждый раз, когда модель в этом отряду совершает атаку enmitic exterminator, нацеленную на отряд (исключая MONSTERS и VEHICLES), перебросьте бросок на ранение 1. Каждый раз, когда модель в этом отряду совершает атаку gauss destructor, нацеленную на MONSTER или VEHICLE, перебросьте бросок на ранение 1.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 55),
        UnitCompositionOption(id: '2', modelCount: 2, points: 110),
        UnitCompositionOption(id: '3', modelCount: 3, points: 165),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: gauss destructor; close combat weapon.',
      keywords: [
        Keyword.mounted,
        Keyword.fly,
        Keyword.destroyerCult,
        Keyword.lokhustHeavyDestroyers,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: '',
      wargearOptions: 'Любое количество моделей может заменить свой gauss destructor на 1 enmitic exterminator.',
      damaged: {},
    ),
    Unit(
      id: 'NEC_OTH_02',
      name: 'Skorpekh Destroyers',
      move: '8"',
      toughness: '6',
      save: '3+',
      wounds: '3',
      leadership: '7+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '50mm',
      rangedWeapons: [],
      meleeWeapons: [
        skorpekhHyperphaseWeapons,
      ],
      coreAbilities: [],
      factionAbilities: [
        reanimationProtocols,
      ],
      abilities: [
        'Whirling Onslaught: Каждый раз, когда модель в этом отряду совершает атаку в ближнем бою, перебросьте бросок на попадание 1. Если этот отряд совершил движение Charge в этот ход, вместо этого вы можете перебросить бросок на попадание.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 90),
        UnitCompositionOption(id: '2', modelCount: 6, points: 180),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: Skorpekh hyperphase weapons.',
      keywords: [
        Keyword.infantry,
        Keyword.destroyerCult,
        Keyword.skorpekhDestroyers,
      ],
      factionKeywords: [
        FactionKeyword.necrons,
      ],
      wargearAbilities: 'Plasmacyte: Один раз за битву за каждый Plasmacyte, который имеет этот отряд, когда этот отряд выбирается для сражения, вы можете использовать эту способность. Если да, то до конца фазы оружие ближнего боя, которым экипированы модели в этом отряду, получает способность [DEVASTATING WOUNDS].\n\nDesignerʼs Note: Поместите соответствующее количество жетонов Plasmacyte рядом с отрядом, убирая по одному каждый раз, когда этот отряд использует эту способность.',
    wargearOptions: 'На каждые 3 модели в этом отряду, этот отряд может иметь 1 Plasmacyte.',
      damaged: {},
    )

  ];
}