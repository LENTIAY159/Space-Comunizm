import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_sm.dart';

List<Unit> getBattlelineSM() {
  return [
    Unit(
      id: 'SM_BTL_01',
      name: 'Intercessor Squad',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        boltRifle,
        handFlamer,
        plasmaPistol,
        astartesGrenadeLauncher,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(hit: 'WS3+'),
        astartesChainsword,
        powerFist,
        powerWeapon.copyWithModifiedProfile(hit: '3+', strength: '5'),
        thunderHammer,
      ],
      factionAbilities: [
        oathOfMoment,
      ],
      abilities: [
        'Objective Secured: Если вы контролируете objective marker в конце вашей Command фазы и этот юнит находится в дальности действия этого objective marker, этот objective marker остается под вашим контролем, даже если у вас нет моделей в его дальности действия, до тех пор, пока ваш противник не получит контроль над ним в начале или конце любого хода.',
        'Target Elimination: Каждый раз, когда этот юнит выбирается для стрельбы, он может использовать эту способность. Если он это делает, до конца фазы добавьте 2 к характеристике Атак bolt rifles, которыми экипированы модели в этом юните, и вы можете выбрать только один вражеский юнит в качестве цели для всех атак этого юнита.',
      ],
      wargearOptions: '''
Bolt rifle Intercessor Sergeant может быть заменена на одно из следующего:
- 1 Astartes chainsword
- 1 hand flamer
- 1 plasma pistol
- 1 power weapon

Close combat weapon Intercessor Sergeant может быть заменено на одно из следующего:
- 1 Astartes chainsword
- 1 power fist
- 1 power weapon
- 1 thunder hammer

За каждые 5 моделей в этом юните 1 модель, экипированная bolt rifle, может быть экипирована 1 Astartes grenade launcher.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 80),
        UnitCompositionOption(id: '2', modelCount: 10, points: 160),
      ],
      unitCompositionDescription: 'Каждая модель оснащена: bolt pistol; bolt rifle; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.imperium,
        Keyword.tacticus,
        Keyword.intercessorSquad,
      ],
      factionKeywords: [
        FactionKeyword.adeptusAstartes,
      ],
      damaged: {},
    ),
  ];
}