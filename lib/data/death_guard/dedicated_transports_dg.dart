import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_dg.dart';

List<Unit> getDedicatedTransportsDG() {
  return[
    Unit(
      id: 'DG_DT_1',
      name: 'Chaos Rhino',
      move: '12"',
      toughness: '9',
      save: '3+',
      wounds: '10',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: 'Use model',
      rangedWeapons: [
        combiBolter.copyWithModifiedProfile(
          specialRules: [WeaponAbility.lethalHits, WeaponAbility.rapidFire,],
          specialRuleDetails: {WeaponAbility.rapidFire: {'value': 2},},),
        combiWeapon,
        havocLauncher,
      ],
      meleeWeapons: [
        armouredTracks,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.firingDeck,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: { 'value': 'D3' },
        CoreAbility.firingDeck: { 'value': '2' },
      },
      factionAbilities: [
        nurglesGift,
      ],
      abilities: [
        'Fire Support: В вашей Shooting phase, после того как эта модель выстрелила, выберите один вражеский юнит, пораженный одной или несколькими из этих атак. До конца фазы каждый раз, когда дружественная модель, которая высадилась из этого TRANSPORT в этом ходу, совершает атаку, нацеленную на этот вражеский юнит, вы можете перебросить бросок на Ранение.',
      ],
      specialName: '',
      specialText: '',
      commander: [],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 85),
      ],
      unitCompositionDescription: 'Эта модель экипирована: combi-bolter; armoured tracks.',
      keywords: [
        Keyword.vehicle,
        Keyword.smoke,
        Keyword.chaos,
        Keyword.nurgle,
        Keyword.transport,
        Keyword.dedicatedTransport,
        Keyword.rhino,
      ],
      factionKeywords: [
        FactionKeyword.deathGuard,
      ],
      wargearAbilities: '',
      wargearOptions: '''
Эта модель может быть экипирована одним из следующих вариантов: 1 дополнительный combi-bolter; 1 combi-weapon.
Эта модель может быть экипирована 1 havoc launcher или может заменить 1 combi-bolter на 1 havoc launcher.
''',
      transport: 'Эта модель имеет транспортную вместимость 12 моделей DEATH GUARD INFANTRY. Она не может транспортировать модели TERMINATOR.',
      damaged: {},
    )
  ];
}