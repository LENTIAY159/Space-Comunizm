import '../z_unit_models/core_abilities.dart';
import '../z_unit_models/unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import '../z_unit_models/weapon_data.dart';
import '../chaos_space_marines/army_rule/army_rule_csm.dart';

List<Unit> getBattlelineCSM() {
  return [
    Unit(
      id: 'CSM_BTL_1',
      name: 'Cultist Mob',
      move: '6"',
      toughness: '3',
      save: '6+',
      wounds: '1',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: null,
      baseSize: '25mm',
      rangedWeapons: [
        autopistol,
        boltPistol,
      ],
      meleeWeapons: [
        brutalAssaultWeapon,
      ],
      coreAbilities: [],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'For the Dark Gods: В конце вашей Command phase, если этот отряд находится в радиусе действия маркера цели, которую вы контролируете, этот маркер цели остается под вашим контролем, даже если у вас нет моделей в его радиусе действия, до тех пор, пока ваш противник не возьмет его под контроль в начале или конце любого хода.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 50),
        UnitCompositionOption(id: '2', modelCount: 20, points: 100),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: autopistol; brutal assault weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.damned,
        Keyword.cultistMob,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities: '',
      wargearOptions: '''
• Autopistol у Cultist Champion может быть заменен на 1 bolt pistol.
''',
      damaged: {},
    ),
    Unit(
      id: 'CSM_BTL_2',
      name: 'Legionaries',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        balefireTome.copyWithModifiedProfile(attacks: '3',),
        boltPistol,
        boltgun,
        flamer,
        havocAutocannon.copyWithModifiedProfile(hit: '4+'),
        heavyBolter,
        lascannon,
        meltagun,
        missileLauncher,
        plasmaGun,
        plasmaPistol,
        reaperChaincannon,
      ],
      meleeWeapons: [
        accursedWeapon,
        astartesChainsword.copyWithModifiedProfile(attacks: '4',),
        closeCombatWeapon,
        heavyMeleeWeapon,
      ],
      coreAbilities: [],
      factionAbilities: [
        darkPacts,
      ],
      abilities: [
        'Veterans of the Long War: Каждый раз, когда модель в этом отряде целится во вражеский отряд melee атакой, перебрасывайте Wound roll с результатом 1. Если этот вражеский отряд находится в радиусе действия objective marker, вы можете вместо этого перебросить Wound roll.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 90),
        UnitCompositionOption(id: '2', modelCount: 10, points: 170),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: bolt pistol; boltgun; close combat weapon.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.chaos,
        Keyword.grenades,
        Keyword.legionaries,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
      ],
      wargearAbilities:
      'Chaos Icon: Каждый раз, когда отряд носителя проходит Leadership test для способности Dark Pacts, вы можете перебросить этот test.',
      wargearOptions: '''
• Boltgun у Aspiring Champion может быть заменен на одно из следующего:
  ◦ 1 plasma pistol*
  ◦ 1 accursed weapon
  ◦ 1 Astartes chainsword
  ◦ 1 heavy melee weapon
• Bolt pistol у Aspiring Champion может быть заменен на одно из следующего:
  ◦ 1 plasma pistol*
  ◦ 1 accursed weapon
  ◦ 1 Astartes chainsword
  ◦ 1 heavy melee weapon
• 1 модель может быть экипирована 1 Chaos icon.
• Любое количество Legionaries может заменить свой boltgun на 1 Astartes chainsword.
• Один Legionary может заменить свой boltgun на 1 heavy melee weapon.
• Один Legionary может заменить свой boltgun на 1 balefire tome.
• За каждые 5 моделей в этом отряде, 1 Legionary может заменить свой boltgun на одно из следующего (дубликаты не допускаются):
  ◦ 1 plasma pistol и 1 Astartes chainsword
  ◦ 1 flamer
  ◦ 1 havoc autocannon
  ◦ 1 heavy bolter
  ◦ 1 lascannon
  ◦ 1 meltagun
  ◦ 1 missile launcher
  ◦ 1 plasma gun
  ◦ 1 reaper chaincannon
*Максимум 1 на модель.
''',
      damaged: {},
    ),
    Unit(
      id: 'CSM_BTL_3',
      name: 'Khorne Berzerkers',
      move: '8"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '6+',
      objectiveControl: '2',
      invulnerableSave: null,
      baseSize: '32mm',
      rangedWeapons: [
        boltPistol.copyWithModifiedProfile(hit: '4+',),
        plasmaPistol.copyWithModifiedAllProfiles(hit: '4+')
      ],
      meleeWeapons: [
        chainblade,
        khornateEviscerator,
      ],
      coreAbilities: [],
      factionAbilities: [
        // blessingsOfKhorne,
      ],
      abilities: [
        'Blood Surge: В Shooting phase противника, каждый раз, когда вражеский отряд выстрелил, если любые модели из этого отряда были уничтожены в результате этих атак, этот отряд может совершить движение Blood Surge. Для этого бросьте одну D6 и добавьте 2 к броску: модели в этом отряде перемещаются на количество дюймов до этого результата, но этот отряд должен закончить это движение как можно ближе к ближайшему вражескому отряду (исключая AIRCRAFT). При этом эти модели могут быть перемещены в Engagement Range с этим вражеским отрядом. Этот отряд не может совершить движение Blood Surge, находясь в состоянии Battle-shocked или в Engagement Range с одним или несколькими вражескими отрядами, и может совершить только одно движение Blood Surge за фазу.',
      ],
      specialName: '',
      specialText: '',
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 10, points: 180),
        UnitCompositionOption(id: '2', modelCount: 20, points: 360),
      ],
      unitCompositionDescription: 'Каждая модель экипирована: bolt pistol; chainblade.',
      keywords: [
        Keyword.infantry,
        Keyword.battleline,
        Keyword.grenades,
        Keyword.chaos,
        Keyword.khorne,
        Keyword.berzerkers,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
        FactionKeyword.worldEaters,
      ],
      wargearAbilities:
      'Icon of Khorne: Если отряд носителя содержит одну или более Icon of Khorne, каждый раз, когда отряд носителя уничтожает вражеский отряд, вы получаете 1 очко Bloodshed. Каждый раз, когда вы делаете бросок Blessings of Khorne, бросьте одну дополнительную D6 за каждое очко Bloodshed, которое у вас есть, после чего все ваши очки Bloodshed теряются.',
      wargearOptions: '''
• Bolt pistol у Khorne Berzerker Champion может быть заменен на 1 plasma pistol.
• За каждые 5 моделей в этом отряде, 1 Khorne Berzerker может заменить свой bolt pistol на 1 plasma pistol.
• За каждые 5 моделей в этом отряде, 1 Khorne Berzerker может заменить свой chainblade на 1 Khornate eviscerator.
• 1 модель может быть экипирована 1 icon of Khorne.
''',
      damaged: {},
    ),
    Unit(
      id: 'CSM_BTL_4',
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
        // nurglesGift,
      ],
      abilities: [
        'Infused with the Blessings of Nurgle: В вашу Shooting phase, каждый раз, когда этот отряд выбран для стрельбы, после того как этот отряд выстрелил, выберите один вражеский отряд, попавший под одну или несколько из этих атак. До начала вашего следующего хода этот вражеский отряд считается Afflicted.',
      ],
      specialName: 'Icon of Despair (Aura)',
      specialText: 'Пока вражеский отряд находится в пределах 6" от носителя, ухудшите Leadership characteristic моделей в этом отряду на 1.',
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
      wargearAbilities: '',
      wargearOptions: '''
- Boltgun у Plague Champion может быть заменен на одно из следующего:
  - 1 bolt pistol
  - 1 plasma gun
  - 1 plasma pistol
- Plague knives у Plague Champion могут быть заменены на одно из следующего:
  - 1 bubotic weapons
  - 1 power fist
- За каждые 5 моделей в этом отряде, 1 Plague Marine может заменить свой boltgun на 1 blight launcher.
- За каждые 5 моделей в этом отряде, 1 Plague Marine может заменить свой boltgun на 1 plague spewer.
- За каждые 5 моделей в этом отряде, 1 Plague Marine может заменить свой boltgun на одно из следующего:
  - 1 meltagun
  - 1 plague belcher
  - 1 plasma gun
- За каждые 5 моделей в этом отряде, до 2 Plague Marines могут заменить свой boltgun на 1 bubotic weapons.
- За каждые 5 моделей в этом отряде, до 2 Plague Marines могут заменить свой boltgun на 1 heavy plague weapon.
- Один Plague Marine, экипированный boltgun, может быть экипирован 1 icon of despair. Boltgun этой модели не может быть заменен.
''',
      damaged: {},
    ),
    Unit(
      id: 'TS_BTL_5',
      name: 'Rubric Marines',
      move: '6"',
      toughness: '4',
      save: '3+',
      wounds: '2',
      leadership: '7+',
      objectiveControl: '1',
      invulnerableSave: '5+',
      baseSize: '32mm',
      modelProfiles: [
        ModelProfile(
          name: 'Aspiring Sorcerer',
          move: '6"',
          toughness: '4',
          save: '3+',
          wounds: '3',
          leadership: '6+',
          objectiveControl: '1',
          invulnerableSave: '5+',
          baseSize: '32mm',
        ),
        ModelProfile(
          name: 'Rubric Marine',
          move: '6"',
          toughness: '4',
          save: '3+',
          wounds: '2',
          leadership: '7+',
          objectiveControl: '1',
          invulnerableSave: '5+',
          baseSize: '32mm',
        ),
      ],
      rangedWeapons: [
        infernoBoltPistol,
        infernoBoltgun,
        maleficCurse,
        soulreaperCannon,
        warpflamePistol,
        warpflamer,
      ],
      meleeWeapons: [
        closeCombatWeapon.copyWithModifiedProfile(attacks: '2',),
        forceWeapon.copyWithModifiedProfile(attacks: '3',),
      ],
      coreAbilities: [],
      factionAbilities: [
        // cabalOfSorcerers,
      ],
      abilities: [
        'Bringers of Change: Каждый раз, когда модель в этом отряде совершает ranged атаку, перебрасывайте Wound roll с результатом 1. Если эта атака нацелена на отряд в радиусе действия objective marker, который вы не контролируете, вы можете вместо этого перебросить Wound roll.',
      ],
      leader: [],
      leaderDescription: '',
      unitComposition: [
        UnitCompositionOption(id: '1', modelCount: 5, points: 100),
        UnitCompositionOption(id: '2', modelCount: 10, points: 190),
      ],
      unitCompositionDescription: '''
1 Aspiring Sorcerer
4-9 Rubric Marines

Aspiring Sorcerer экипирован: inferno bolt pistol; Malefic Curse; force weapon.
Каждый Rubric Marine экипирован: inferno boltgun; close combat weapon.''',
      keywords: [
        'ВСЕ МОДЕЛИ: ',
        Keyword.infantry,
        Keyword.battleline,
        Keyword.chaos,
        Keyword.tzeentch,
        Keyword.rubricae,
        Keyword.rubricMarines,
        'ТОЛЬКО ASPIRING SORCERER: ',
        Keyword.psyker,
      ],
      factionKeywords: [
        FactionKeyword.hereticAstartes,
        FactionKeyword.thousandSons,
      ],
      wargearAbilities: 'Icon of Flame: Ranged weapons, экипированные моделями в отряде носителя (исключая CHARACTERS), имеют способность [IGNORES COVER].',
      wargearOptions: '''
- Inferno bolt pistol у Aspiring Sorcerer может быть заменен на 1 warpflame pistol.
- 1 Rubric Marine может заменить свой inferno boltgun на 1 soulreaper cannon.
- Любое количество Rubric Marines могут заменить свой inferno boltgun на 1 warpflamer.
- 1 Rubric Marine может быть экипирован 1 icon of flame.
''',
      damaged: {},
    ),


  ];
}