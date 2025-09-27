import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_dg.dart';

List<Unit> getBattlelineDG() {
  return [
    Unit(
      id: 'DG_BTL_1',
      name: 'Plague Marines',
      move: '5"',
      toughness: '6',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        blightLauncher,
        boltgun.copyWithModifiedProfile(specialRules: [WeaponAbility.lethalHits],),
        boltPistol.copyWithModifiedProfile(specialRules: [WeaponAbility.lethalHits],),
        meltagun,
        plagueBelcher,
        plagueSpewer,
        plasmaGun,
        plasmaPistol,
      ],
      meleeWeapons: [
        buboticWeapons,
        heavyPlagueWeapon,
        plagueKnives,
        powerFist.copyWithModifiedProfile(specialRules: [WeaponAbility.lethalHits],),
      ],
      coreAbilities: [

      ],
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Infused with the Blessings of Nurgle: В вашей Shooting phase каждый раз, когда этот юнит выбран для стрельбы, после того как этот юнит выстрелил, выберите один вражеский юнит, пораженный одной или несколькими из этих атак. До начала вашего следующего хода этот вражеский юнит находится под воздействием Afflicted.',
      ],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 95),
        UnitCompositionOption(id: '2', modelCount: 7, points: 130),
        UnitCompositionOption(id: '3', modelCount: 10, points: 190),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: boltgun; plague knives.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.plagueMarines,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: 'Icon of Despair (Aura): Пока вражеский юнит находится в пределах 6" от носителя, ухудшите характеристику Leadership моделей в этом юните на 1.',
      wargearOptions: '''
- Boltgun Plague Champion может быть заменен на один из следующих вариантов:
  - 1 bolt pistol
  - 1 plasma gun
  - 1 plasma pistol
- Plague knives Plague Champion могут быть заменены на один из следующих вариантов:
  - 1 bubotic weapons
  - 1 power fist
- На каждые 5 моделей в этом юните boltgun одного Plague Marine может быть заменен на 1 blight launcher.
- На каждые 5 моделей в этом юните boltgun одного Plague Marine может быть заменен на 1 plague spewer.
- На каждые 5 моделей в этом юните boltgun одного Plague Marine может быть заменен на один из следующих вариантов:
  - 1 meltagun
  - 1 plague belcher
  - 1 plasma gun
- На каждые 5 моделей в этом юните до 2 Plague Marines могут каждый заменить свой boltgun на 1 bubotic weapons.
- На каждые 5 моделей в этом юните до 2 Plague Marines могут каждый заменить свой boltgun на 1 heavy plague weapon.
- Один Plague Marine, экипированный boltgun, может быть экипирован 1 icon of despair. Boltgun этой модели не может быть заменен.
''',
      damaged: {},
    ),
  ];
}