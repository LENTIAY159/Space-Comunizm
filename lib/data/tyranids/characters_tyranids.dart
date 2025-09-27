import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_tyranids.dart';

List<Unit> getCharactersTyranids() {
  return [
    Unit(
      id: 'TYR_CHAR_01',
      name: 'Hive Tyrant',
      move: '8"',
      toughness: '10',
      save: '2+',
      wounds: '10',
      leadership: '7+',
      objectiveControl: '3',
      invulnerableSave: '4+',
      baseSize: '60mm',
      rangedWeapons: [
        heavyVenomCannon,
        stranglethornCannon,
      ],
      meleeWeapons: [
        monstrousBoneswordAndLashWhip,
        monstrousScythingTalons,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.leader,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': 'D3'},
      },
      factionAbilities: [
        shadowInTheWarp,
        synapse,
      ],
      abilities: [
        'Will of the Hive Mind: Один раз в раунд битвы, одна модель из вашей армии с этой способностью может использовать её, когда дружественный отряд TYRANIDS в пределах 12" от этой модели становится целью стратагемы. Если она это делает, снизьте стоимость CP этого использования стратагемы на 1CP.',
        'Onslaught (Aura, Psychic): Пока дружественный отряд TYRANIDS находится в пределах 6" от этой модели, дальнобойное оружие, экипированное моделями в том отряде, имеет способности [ASSAULT] и [LETHAL HITS].',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.tyrantGuard,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующему отряду: Tyrant Guard',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 195),
      ],
      unitCompositionDescription: 'Эта модель экипирована: monstrous bonesword and lash whip; monstrous scything talons.',
      keywords: [
        Keyword.monster,
        Keyword.character,
        Keyword.psyker,
        Keyword.greatDevourer,
        Keyword.synapse,
        Keyword.hiveTyrant,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '''
Monstrous bonesword and lash whip этой модели может быть заменен на одно из следующего:
• 1 heavy venom cannon
• 1 stranglethorn cannon
• 1 monstrous scything talons

Monstrous scything talons этой модели могут быть заменены на одно из следующего:
• 1 heavy venom cannon*
• 1 stranglethorn cannon*

*Эта модель не может быть экипирована одновременно stranglethorn cannon и heavy venom cannon. Эта модель не может быть экипирована более чем 1 heavy venom cannon, и она не может быть экипирована более чем 1 stranglethorn cannon.
''',
      damaged: {},
    ),
    Unit(
      id: 'TYR_CHAR_02',
      name: 'Neurotyrant',
      move: '6"',
      toughness: '8',
      save: '4+',
      wounds: '9',
      leadership: '7+',
      objectiveControl: '3',
      invulnerableSave: '4+',
      baseSize: '50mm',
      rangedWeapons: [
        psychicScream,
      ],
      meleeWeapons: [
        neurotyrantClawsAndLashes,
      ],
      coreAbilities: [
        CoreAbility.leader,
      ],
      factionAbilities: [
        synapse,
        shadowInTheWarp,
      ],
      abilities: [
        'Node Lash (Psychic): Пока эта модель ведет отряд, каждый раз, когда модель в том отряде совершает атаку, добавьте 1 к броску на попадание. Если цель Battle-shocked, также добавьте 1 к броску на ранение.',
        'Psychic Terror (Psychic): Если одна или более моделей из вашей армии с этой способностью находятся на поле боя, когда вы unleash the Shadow in the Warp, вычтите 1 из теста Battle-shock, который каждый вражеский отряд на поле боя должен пройти в результате.',
        'Neuroloids: В вашей Command фазе вы можете выбрать до двух дружественных отрядов TYRANIDS в пределах 18" от отряда этой модели. До начала вашей следующей Command фазы выбранные отряды всегда считаются находящимися в Synapse Range вашей армии.\n\nDesigner\'s Note: Поместите маркер Neuroloid рядом с каждым выбранным отрядом, чтобы напомнить вам.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.neurogaunts,
        Keyword.tyrantGuard,
        Keyword.zoanthropes,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Neurogaunts, Tyrant Guard, Zoanthropes',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 105),
      ],
      unitCompositionDescription: 'Эта модель экипирована: Psychic Scream; Neurotyrant claws and lashes.',
      keywords: [
        Keyword.monster,
        Keyword.character,
        Keyword.fly,
        Keyword.psyker,
        Keyword.greatDevourer,
        Keyword.synapse,
        Keyword.neurotyrant,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_CHAR_03',
      name: 'Winged Tyranid Prime',
      move: '12"',
      toughness: '5',
      save: '4+',
      wounds: '6',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '50mm',
      rangedWeapons: [],
      meleeWeapons: [
        primeTalons,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        shadowInTheWarp,
        synapse,
      ],
      abilities: [
        'Alpha Warrior: Пока эта модель ведет отряд, оружие, экипированное моделями в том отряде, имеет способность [SUSTAINED HITS 1].',
        'Death Blow: Если эта модель уничтожается рукопашной атакой, если она не сражалась в эту фазу, бросьте одну D6: на 4+ не убирайте её из игры. Уничтоженная модель может сражаться после того, как отряд атакующей модели завершит свои атаки, и затем убирается из игры.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        Keyword.gargoyles,
        Keyword.tyranidWarriorsWithMeleeBioWeapons,
        Keyword.tyranidWarriorsWithRangedBioWeapons,
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующим отрядам: Gargoyles, Tyranid Warriors With Melee Bio-weapons, Tyranid Warriors With Ranged Bio-weapons',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 65),
      ],
      unitCompositionDescription: 'Эта модель экипирована: Prime talons.',
      keywords: [
        Keyword.infantry,
        Keyword.character,
        Keyword.fly,
        Keyword.greatDevourer,
        Keyword.synapse,
        Keyword.vanguardInvader,
        Keyword.wingedTyranidPrime,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_CHAR_04',
      name: 'Hyperadapted Raveners',
      move: '10"',
      toughness: '5',
      save: '4+',
      wounds: '6',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '40mm',
      modelProfiles: [
        ModelProfile(
          name: 'Ravener Prime',
          move: '10"',
          toughness: '5',
          save: '4+',
          wounds: '6',
          leadership: '7+',
          objectiveControl: '1',
          invulnerableSave: null,
          baseSize: '40mm',
        ),
        ModelProfile(
          name: 'Raveners',
          move: '10"',
          toughness: '5',
          save: '4+',
          wounds: '3',
          leadership: '8+',
          objectiveControl: '1',
          invulnerableSave: null,
          baseSize: '40mm',
        ),
      ],
      rangedWeapons: [
        venomBolt,
      ],
      meleeWeapons: [
        primeClawsAndTalons,
        ravenerHeavyClawsAndTalons,
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
        CoreAbility.leader,
      ],
      factionAbilities: [
        shadowInTheWarpWith('Tyranid Prime only'),
        synapse,
      ],
      abilities: [
        'Alpha Invader: Оружие, экипированное моделями в этом отряде, имеет способность [SUSTAINED HITS 1].',
        'Hypersensory Aura: Один раз в раунд битвы вы можете применить к этому отряду стратагему Rapid Ingress или Heroic Intervention за 0CP, и можете сделать это, даже если вы уже применили другой отряд к этой стратагеме в этом ходе.',
      ],
      specialName: '',
      specialText: '',
      leader: [
        'Raveners',
      ],
      leaderDescription: 'Эта модель может быть присоединена к следующему отряду: Raveners',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 165),
      ],
      unitCompositionDescription: '1 Ravener Prime экипирован: Prime claws and talons.\n\n3 Raveners экипированы: Ravener heavy claws and talons.\n\n1 Ravener экипирован: venom bolt; Ravener heavy claws and talons.',
      keywords: [
        'ALL MODELS: ',
        Keyword.infantry,
        Keyword.greatDevourer,
        Keyword.vanguardInvader,
        Keyword.burrowers,
        Keyword.hyperadaptedRaveners,
        'RAVENER PRIME: ',
        Keyword.character,
        Keyword.synapse,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    )

  ];
}