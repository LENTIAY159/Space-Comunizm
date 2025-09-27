import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_model.dart';
import '../z_unit_models/weapon_data.dart';
import 'army_rule/army_rule_tyranids.dart';

List<Unit> getBattlelineTyranids() {
  return [
    Unit(
      id: 'TYR_BTL_01',
      name: 'Hormagaunts',
      move: '10"',
      toughness: '3',
      save: '5+',
      wounds: '1',
      leadership: '8+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '28mm',
      rangedWeapons: [],
      meleeWeapons: [
        hormagauntTalons,
      ],
      coreAbilities: [],
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Bounding Leap: Этот отряд имеет право объявить атаку в ходе, в котором он Advanced.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 65),
        UnitCompositionOption(id: '2', modelCount: 20, points: 130),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: Hormagaunt talons.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.greatDevourer,
        Keyword.endlessMultitude,
        Keyword.hormagaunts,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: '',
      damaged: {},
    ),
    Unit(
      id: 'TYR_BTL_02',
      name: 'Termagants',
      move: '6"',
      toughness: '3',
      save: '5+',
      wounds: '1',
      leadership: '8+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '28mm',
      rangedWeapons: [
        fleshborer,
        shardlauncher,
        spikeRifle,
        strangleweb,
        termagantDevourer,
        termagantSpinefists,
      ],
      meleeWeapons: [
        chitinousClawsAndTeeth,
      ],
      coreAbilities: [],
      factionAbilities: [
        synapse,
      ],
      abilities: [
        'Skulking Horrors: Один раз за ход, когда вражеский отряд заканчивает движение Normal, Advance или Fall Back в пределах 9" от этого отряда, если этот отряд не находится в Engagement Range одного или более вражеских отрядов, он может совершить движение Normal до D6".',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 60),
        UnitCompositionOption(id: '2', modelCount: 20, points: 120),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: fleshborer; chitinous claws and teeth.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.greatDevourer,
        Keyword.endlessMultitude,
        Keyword.termagants,
      ],
      factionKeywords: [
        FactionKeyword.tyranids,
      ],
      wargearAbilities: '',
      wargearOptions: 'Все модели в этом отряде могут заменить свой fleshborer на 1 Termagant devourer.\n'
          'Все модели в этом отряде могут заменить свой fleshborer на 1 Termagant spinefists.\n'
          'За каждые 10 моделей в этом отряде, дальнобойное оружие 1 модели может быть заменено на 1 shardlauncher.\n'
          'За каждые 10 моделей в этом отряде, дальнобойное оружие 1 модели может быть заменено на 1 spike rifle.\n'
          'За каждые 10 моделей в этом отряде, дальнобойное оружие 1 модели может быть заменено на 1 strangleweb.',
      damaged: {},
    ),
  ];
}