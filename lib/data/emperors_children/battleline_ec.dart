import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../z_unit_models/core_abilities.dart';
import 'army_rule/army_rule_ec.dart';


List<Unit> getBattlelineEC(){
  return[
    Unit(
      id: 'EC_BTL_01',
      name: 'Daemonettes',
      move: '9',
      toughness: '3',
      save: '7+',
      wounds: '1',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: '5+',
      rangedWeapons: [],
      meleeWeapons: [
        slashingClaws,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.fightsFirst,
      ],
      factionAbilities: [
        pactOfExcess,
      ],
      abilities: [
        'Horrifying Beauty: В начале фазы Fight phase каждый вражеский отряд в пределах Engagement Range одного или более отрядов из вашей армии с этой способностью должен пройти тест Battle-shock, вычитая 1 из результата, если этот вражеский отряд находится Below Half-strength.',
      ],
      wargearOptions: '''
1 Daemonette, которая не оснащена daemonic icon, может быть оснащена 1 instrument of Chaos.
1 Daemonette, которая не оснащена instrument of Chaos, может быть оснащена 1 daemonic icon.
''',
      wargearAbilities: '''
Daemonic Icon: Модели в отряде носителя имеют характеристику Leadership 6+.
Instrument of Chaos: Добавьте 1 к броскам Charge, сделанным для отряда носителя.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 90),
      ],
      unitCompositionDescription: '1 Alluress, 9 Daemonettes. Каждая модель вооружена: slashing claws.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.chaos,
        Keyword.daemon,
        Keyword.summoned,
        Keyword.slaanesh,
        Keyword.daemonettes,
      ],
      factionKeywords: [
        FactionKeyword.legionsOfExcess,
      ],
      damaged: {},
    ),
    Unit(
      id: 'EC_BTL_02',
      name: 'Infractors',
      move: '7',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        plasmaPistol,
      ],
      meleeWeapons: [
        duellingSabre,
        powerSword,
        raptureLash,
      ],
      coreAbilities: [
        CoreAbility.scouts,
      ],
      coreRuleDetails: {
        CoreAbility.scouts: {'value': '6'},
      },
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Excessive Assault: Каждый раз когда модель в этом отряде нацеливается на вражеский отряд атакой ближнего боя, перебросьте бросок Wound равный 1. Если этот вражеский отряд находится в пределах дальности от маркера цели, вы можете вместо этого переброситьброс Wound.',
      ],
      wargearOptions: '''
Bolt pistol Obsessionist может быть заменён 1 plasma pistol.
Power sword Obsessionist может быть заменён 1 rapture lash.
1 Infractor может быть оснащён 1 icon of excess.
''',
      wargearAbilities: '''
Icon of Excess: В конце вашей фазы Shooting phase или фазы Fight phase, если отряд носителя уничтожил один или более вражеских отрядов в эту фазу, отряд носителя проходит тест Leadership. Если этот тест пройден, вы получаете 1CP.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 85),
        UnitCompositionOption(id: '2', modelCount: 10, points: 160),
      ],
      unitCompositionDescription: '1 Obsessionist, 4–9 Infractors. Obsessionist вооружён: bolt pistol; power sword. Каждый Infractor вооружён: bolt pistol; duelling sabre.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.infractors,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
    Unit(
      id: 'EC_BTL_03',
      name: 'Tormentors',
      move: '7',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      rangedWeapons: [
        boltPistol,
        boltgun.copyWithModifiedProfile(specialRules: [WeaponAbility.precision]),
        meltagun.copyWithModifiedProfile(specialRules: [
          WeaponAbility.melta, WeaponAbility.precision],
          specialRuleDetails: {WeaponAbility.melta: {'value': '2'}},
        ),
        tormentorsPlasmaGun,
        tormentorsPlasmaPistol,
      ],
      meleeWeapons: [
        closeCombatWeapon,
        powerSword,
        raptureLash,
      ],
      coreAbilities: [
        CoreAbility.infiltrators,
      ],
      factionAbilities: [
        thrillSeekers,
      ],
      abilities: [
        'Objective Defiled: В конце вашей фазы Command phase, если этот отряд находится в пределах дальности от маркера цели, который вы контролируете, этот маркер цели остаётся под вашим контролем до тех пор, пока Level of Control вашего противника над этим маркером цели не станет больше вашего в конце фазы.',
      ],
      wargearOptions: '''
Bolt pistol Obsessionist может быть заменён 1 plasma pistol.
Power sword Obsessionist может быть заменён 1 rapture lash.
За каждые 5 моделей в этом отряде, boltgun 1 Tormentor может быть заменён 1 meltagun.
За каждые 5 моделей в этом отряде, boltgun 1 Tormentor может быть заменён 1 plasma gun.
1 Tormentor может быть оснащён 1 icon of excess.
''',
      wargearAbilities: '''
Icon of Excess: В конце вашей фазы Shooting phase или фазы Fight phase, если отряд носителя уничтожил один или более вражеских отрядов в эту фазу, отряд носителя проходит тест Leadership. Если этот тест пройден, вы получаете 1CP.
''',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 85),
        UnitCompositionOption(id: '2', modelCount: 10, points: 170),
      ],
      unitCompositionDescription: '1 Obsessionist, 4–9 Tormentors. Obsessionist вооружён: bolt pistol; power sword. Каждый Tormentor вооружён: boltgun; close combat weapon.',
      leader: [],
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.slaanesh,
        Keyword.tormentors,
      ],
      factionKeywords: [
        FactionKeyword.emperorsChildren,
      ],
      damaged: {},
    ),
  ];
}