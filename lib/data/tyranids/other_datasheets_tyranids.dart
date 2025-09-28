import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_tyranids.dart';

List<Unit> getOtherDatasheetsTyranids() {
  return [
    Unit(
      id: 'TYR_OTH_01',
      name: 'Barbgaunts',
      move: '6"',
      toughness: '4',
      save: '4+',
      wounds: '2',
      leadership: '8+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '40mm',
      rangedWeapons: [
        barblauncher,
      ],
      meleeWeapons: [
        chitinousClawsAndTeeth.copyWithModifiedProfile(strength: '4'),
      ],
      coreAbilities: [],
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Disruption Bombardment: В вашей Shooting фазе, после того как этот отряд выстрелил, выберите один вражеский отряд INFANTRY, попавший под одну или более из этих атак. До конца следующего хода вашего противника этот вражеский отряд disrupted. Пока отряд disrupted, вычтите 2 из его характеристики Move и вычтите 2 из бросков Advance и Charge, совершенных для него.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 55),
        UnitCompositionOption(id: '2', modelCount: 10, points: 110),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: barblauncher; chitinous claws and teeth.',
      keywords: [
        Keyword.infantry,
        Keyword.greatDevourer,
        Keyword.barbgaunts,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_02',
      name: 'Neurolictor',
      move: '8"',
      toughness: '5',
      save: '4+',
      wounds: '7',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '50mm',
      rangedWeapons: [],
      meleeWeapons: [
        piercingClawsAndTalons,
      ],
      coreAbilities: [
        CoreAbility.infiltrators,
        CoreAbility.loneOperative,
        CoreAbility.stealth,
      ],
      factionAbilities: [
        shadowInTheWarp,
        synapse,
      ],
      abilities: [
        'Feeder Tendrils: Каждый раз, когда эта модель уничтожает вражескую модель CHARACTER, вы получаете 1CP.',
        'Neural Disruption: В вашей Command фазе выберите один вражеский отряд в пределах 12" от этой модели. Этот отряд должен пройти тест Battle-shock.',
        'Psychological Saboteur (Aura): Пока вражеский отряд находится в пределах 12" от этой модели, если этот отряд Battle-shocked:\n- Каждый раз, когда модель в том отряде совершает атаку, вычтите 1 из броска на попадание.\n- Каждый раз, когда дружественная модель TYRANIDS совершает атаку, нацеленную на этот отряд, добавьте 1 к броску на ранение.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 70),
      ],
      unitCompositionDescription: 'Эта модель экипирована: piercing claws and talons.',
      keywords: [
        Keyword.infantry,
        Keyword.greatDevourer,
        Keyword.vanguardInvader,
        Keyword.synapse,
        Keyword.neurolictor,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_03',
      name: 'Psychophage',
      move: '12"',
      toughness: '9',
      save: '3+',
      wounds: '10',
      leadership: '8+',
      objectiveControl: '3',
      invulnerableSave: null,
      baseSize: '120x92mm',
      rangedWeapons: [
        psychoclasticTorrent,
      ],
      meleeWeapons: [
        talonsAndBetentacledMaw,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
        CoreAbility.feelNoPain,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': '1'},
        CoreAbility.feelNoPain: {'value': '5+'},
      },
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Bio-stimulus: В вашей Shooting фазе, после того как эта модель выстрелила, выберите один вражеский отряд, попавший под одну или более из этих атак. До конца хода, каждый раз, когда дружественный отряд TYRANIDS совершает рукопашную атаку, нацеленную на этот вражеский отряд, улучшите характеристику Armour Penetration этой атаки на 1. Один и тот же вражеский отряд может быть затронут этой способностью только один раз за ход.',
        'Feeding Frenzy: Каждый раз, когда эта модель совершает рукопашную атаку, нацеленную на отряд, который ниже своей Starting Strength, добавьте 1 к броску на попадание. Если эта цель также Below Half-strength, добавьте 1 к броску на ранение.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 110),
      ],
      unitCompositionDescription: 'Эта модель экипирована: psychoclastic torrent; talons and betentacled maw.',
      keywords: [
        Keyword.monster,
        Keyword.greatDevourer,
        Keyword.harvester,
        Keyword.smoke,
        Keyword.psychophage,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_04',
      name: 'Ripper Swarms',
      move: '6"',
      toughness: '2',
      save: '6+',
      wounds: '4',
      leadership: '8+',
      objectiveControl: '0',
      invulnerableSave: null,
      baseSize: '40mm',
      rangedWeapons: [
        spinemaws,
      ],
      meleeWeapons: [
        chitinousClawsAndTeeth.copyWithModifiedProfile(
          attacks: '6', hit: '5+', strength: '2',
          specialRules: [WeaponAbility.sustainedHits],
          specialRuleDetails: {WeaponAbility.sustainedHits: {'value': 1}},
        ),
      ],
      coreAbilities: [
        CoreAbility.deepStrike,
      ],
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Chitinous Horrors (Aura): Пока вражеский отряд находится в Engagement Range этого отряда, уменьшите вдвое характеристику Objective Control моделей в том вражеском отряде.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 25),
        UnitCompositionOption(id: '2', modelCount: 2, points: 40),
        UnitCompositionOption(id: '3', modelCount: 3, points: 50),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: chitinous claws and teeth.',
      keywords: [
        Keyword.swarm,
        Keyword.greatDevourer,
        Keyword.harvester,
        Keyword.ripperSwarms,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: 'Все модели в этом отряде могут быть экипированы 1 spinemaws.',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_05',
      name: 'Screamer-Killer',
      move: '8"',
      toughness: '9',
      save: '2+',
      wounds: '10',
      leadership: '8+',
      objectiveControl: '3',
      invulnerableSave: null,
      baseSize: '90mm',
      rangedWeapons: [
        bioPlasmicScream,
      ],
      meleeWeapons: [
        screamerKillerTalons,
      ],
      coreAbilities: [
        CoreAbility.deadlyDemise,
      ],
      coreRuleDetails: {
        CoreAbility.deadlyDemise: {'value': '1'},
      },
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Death Scream: В вашей Shooting фазе, после того как эта модель выстрелила, выберите один отряд, попавший под одну или более из этих атак. Этот отряд должен пройти тест Battle-shock, вычтя 1 из этого теста.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 1, points: 135),
      ],
      unitCompositionDescription: 'Эта модель экипирована: bio-plasmic scream; Screamer-Killer talons.',
      keywords: [
        Keyword.monster,
        Keyword.greatDevourer,
        Keyword.screamerKiller,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_TRP_06',
      name: 'Tyranid Warriors with Ranged Bio-weapons',
      move: '6"',
      toughness: '5',
      save: '4+',
      wounds: '3',
      leadership: '7+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '50mm',
      rangedWeapons: [
        barbedStrangler,
        deathspitter,
        devourer,
        spinefists,
        venomCannon,
      ],
      meleeWeapons: [
        tyranidWarriorClawsAndTalons,
      ],
      coreAbilities: [],
      factionAbilities: [
        shadowInTheWarp,
        synapse,
      ],
      abilities: [
        'Adaptable Predators: Этот отряд имеет право стрелять и объявлять атаку в ходе, в котором он Fell Back.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 65),
        UnitCompositionOption(id: '2', modelCount: 6, points: 130),
      ],
      unitCompositionDescription:
      'Каждая модель экипирована: devourer; Tyranid Warrior claws and talons.',
      keywords: [
        Keyword.infantry,
        Keyword.greatDevourer,
        Keyword.synapse,
        Keyword.tyranidWarriorsWithRangedBioWeapons,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions:
      'Любое количество моделей могут заменить свой devourer на одно из следующего:\n- 1 deathspitter\n- 1 spinefists\nЗа каждые 3 модели в этом отряде, devourer 1 модели может быть заменен на 1 barbed strangler.\nЗа каждые 3 модели в этом отряде, devourer 1 модели может быть заменен на 1 venom cannon.',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_7',
      name: 'Von Ryanʼs Leapers',
      move: '10"',
      toughness: '5',
      save: '4+',
      wounds: '3',
      leadership: '8+',
      objectiveControl: '1',
      invulnerableSave: '6+',
      baseSize: '40mm',
      rangedWeapons: [],
      meleeWeapons: [
        leapersTalons,
      ],
      coreAbilities: [
        CoreAbility.fightsFirst,
        CoreAbility.infiltrators,
        CoreAbility.stealth,
      ],
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Pouncing Leap: Вы можете применить к этому отряду стратагему Heroic Intervention за 0CP, и можете сделать это, даже если вы уже использовали эту стратагему на другом отряде в эту фазу.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 70),
        UnitCompositionOption(id: '2', modelCount: 6, points: 140),
      ],
      unitCompositionDescription:
      'Каждая модель экипирована: Leaper\'s talons.',
      keywords: [
        Keyword.infantry,
        Keyword.greatDevourer,
        Keyword.vanguardInvader,
        Keyword.vonRyansLeapers,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_OTH_8',
      name: 'Zoanthropes',
      move: '5"',
      toughness: '5',
      save: '5+',
      wounds: '3',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: '4+',
      baseSize: '40mm',
      rangedWeapons: [
        warpBlast,
      ],
      meleeWeapons: [
        chitinousClawsAndTeeth.copyWithModifiedProfile(attacks: '2', hit: '5+',),
      ],
      coreAbilities: [],
      factionAbilities: [
        shadowInTheWarp,
        synapse,
      ],
      abilities: [
        'Spirit Leech (Aura, Psychic): Пока вражеский отряд находится в пределах 6" от этого отряда, если этот отряд содержит Neurothrope, каждый раз, когда этот вражеский отряд проваливает тест Battle-shock, он получает D3 mortal wounds и одна модель в этом отряде восстанавливает до D3 потерянных ран.',
        'Warp Field (Aura, Psychic): Пока дружественный отряд TYRANIDS находится в пределах 6" от этого отряда, модели в том отряде имеют invulnerable save 6+.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 3, points: 100),
        UnitCompositionOption(id: '2', modelCount: 6, points: 200),
      ],
      unitCompositionDescription:
      'Каждая модель экипирована: Warp Blast; chitinous claws and teeth.',
      keywords: [
        Keyword.infantry,
        Keyword.psyker,
        Keyword.fly,
        Keyword.greatDevourer,
        Keyword.synapse,
        Keyword.zoanthropes,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),

  ];
}