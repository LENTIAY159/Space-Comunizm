import 'keyword_list.dart';

class KeywordConverter {
  /// Преобразование обычных ключевых слов
  static String toReadable(Keyword keyword) {
    switch (keyword) {
      case Keyword.fulgrim: return 'Fulgrim';
      case Keyword.slaanesh: return 'Slaanesh';
      case Keyword.lordExultant: return 'Lord Exultant';
      case Keyword.lordKakophonist: return 'Lord Kakophonist';
      case Keyword.sorcerer: return 'Sorcerer';
      case Keyword.infractors: return 'Infractors';
      case Keyword.tormentors: return 'Tormentors';
      case Keyword.noiseMarines: return 'Noise Marines';
      case Keyword.chaosTerminators: return 'Chaos Terminators';
      case Keyword.summoned: return 'Summoned';
      case Keyword.daemonettes: return 'Daemonettes';
      case Keyword.tallyman: return 'Tallyman';
      case Keyword.typhus: return 'Typhus';
      case Keyword.blightlordTerminators: return 'Blightlord Terminators';
      case Keyword.deathshroudTerminators: return 'Deathshroud Terminators';
      case Keyword.lordOfVirulence: return 'Lord of Virulence';
      case Keyword.malignantPlaguecaster: return 'Malignant Plaguecaster';
      case Keyword.poxwalkers: return 'Poxwalkers';
      case Keyword.robouteGuilliman: return 'Roboute Guilliman';
      case Keyword.primarch: return 'Primarch';
      case Keyword.bjornTheFellHanded: return 'Bjorn the Fell-Handed';
      case Keyword.lionElJonson: return 'Lion El’Jonson';
      case Keyword.endlessMultitude: return 'Endless Multitude';
      case Keyword.hormagaunts: return 'Hormagaunts';
      case Keyword.termagants: return 'Termagants';
      case Keyword.barbgaunts: return 'Barbgaunts';
      case Keyword.neurolictor: return 'Neurolictor';
      case Keyword.harvester: return 'Harvester';
      case Keyword.psychophage: return 'Psychophage';
      case Keyword.swarm: return 'Swarm';
      case Keyword.ripperSwarms: return 'Ripper Swarms';
      case Keyword.screamerKiller: return 'Screamer-Killer';
      case Keyword.vonRyansLeapers: return 'Von Ryan’s Leapers';
      case Keyword.hiveTyrant: return 'Hive Tyrant';
      case Keyword.synapse: return 'Synapse';
      case Keyword.greatDevourer: return 'Great Devourer';
      case Keyword.tyrantGuard: return 'Tyrant Guard';
      case Keyword.neurogaunts: return 'Neurogaunts';
      case Keyword.zoanthropes: return 'Zoanthropes';
      case Keyword.neurotyrant: return 'Neurotyrant';
      case Keyword.gargoyles: return 'Gargoyles';
      case Keyword.tyranidWarriorsWithMeleeBioWeapons: return 'Tyranid Warriors With Melee Bio-weapons';
      case Keyword.tyranidWarriorsWithRangedBioWeapons: return 'Tyranid Warriors With Ranged Bio-weapons';
      case Keyword.vanguardInvader: return 'Vanguard Invader';
      case Keyword.wingedTyranidPrime: return 'Winged Tyranid Prime';
      case Keyword.burrowers: return 'Burrowers';
      case Keyword.hyperadaptedRaveners: return 'Hyperadapted Raveners';

      case Keyword.ctanShardOfTheVoidDragon: return 'C’tan Shard of the Void Dragon';
      case Keyword.destroyerCult: return 'Destroyer Cult';
      case Keyword.hexmarkDestroyer: return 'Hexmark Destroyer';
      case Keyword.cryptek: return 'Cryptek';
      case Keyword.illuminorSzeras: return 'Illuminor Szeras';
      case Keyword.immortals: return 'Immortals';
      case Keyword.lychguard: return 'Lychguard';
      case Keyword.necronWarriors: return 'Necron Warriors';
      case Keyword.noble: return 'Noble';
      case Keyword.overlord: return 'Overlord';
      case Keyword.canoptekWraiths: return 'Canoptek Wraiths';
      case Keyword.technomancer: return 'Technomancer';
      case Keyword.mounted: return 'Mounted';
      case Keyword.lokhustHeavyDestroyers: return 'Lokhust Heavy Destroyers';
      case Keyword.skorpekhDestroyers: return 'Skorpekh Destroyers';
      case Keyword.phobos: return 'Phobos';
      case Keyword.lieutenant: return 'Lieutenant';
      case Keyword.lieutenantWithCombiWeapon: return 'Lieutenant with Combi-weapon';
      case Keyword.helbrute: return 'Helbrute';
      case Keyword.obliterators: return 'Obliterators';
      case Keyword.possessed: return 'Possessed';
      case Keyword.transport: return 'Transport';
      case Keyword.dedicatedTransport: return 'Dedicated Transport';
      case Keyword.rhino: return 'Rhino';
      case Keyword.infantry: return 'Infantry';
      case Keyword.battleline: return 'Battleline';
      case Keyword.grenades: return 'Grenades';
      case Keyword.imperium: return 'Imperium';
      case Keyword.tacticus: return 'Tacticus';
      case Keyword.intercessorSquad: return 'Intercessor Squad';
      case Keyword.aggressorSquad: return 'Aggressor Squad';
      case Keyword.eradicatorSquad: return 'Eradicator Squad';
      case Keyword.heavyIntercessorSquad: return 'Heavy Intercessor Squad';
      case Keyword.character: return 'Character';
      case Keyword.gravis: return 'Gravis';
      case Keyword.apothecary: return 'Apothecary';
      case Keyword.biologis: return 'Biologis';
      case Keyword.assaultIntercessorSquad: return 'Assault Intercessor Squad';
      case Keyword.bladeguardVeteranSquad: return 'Bladeguard Veteran Squad';
      case Keyword.companyHeroes: return 'Company Heroes';
      case Keyword.hellblasterSquad: return 'Hellblaster Squad';
      case Keyword.infernusSquad: return 'Infernus Squad';
      case Keyword.sternGuardVeteranSquad: return 'Stern Guard Veteran Squad';
      case Keyword.tacticalSquad: return 'Tactical Squad';
      case Keyword.captain: return 'Captain';
      case Keyword.terminatorAssaultSquad: return 'Terminator Assault Squad';
      case Keyword.terminatorSquad: return 'Terminator Squad';
      case Keyword.terminator: return 'Terminator';
      case Keyword.chaplain: return 'Chaplain';
      case Keyword.psyker: return 'Psyker';
      case Keyword.librarian: return 'Librarian';
      case Keyword.desolationSquad: return 'Desolation Squad';
      case Keyword.devastatorSquad: return 'Devastator Squad';
      case Keyword.techmarine: return 'Techmarine';
      case Keyword.vehicle: return 'Vehicle';
      case Keyword.walker: return 'Walker';
      case Keyword.dreadnought: return 'Dreadnought';
      case Keyword.ballistusDreadnought: return 'Ballistus Dreadnought';
      case Keyword.jumpPack: return 'Jump Pack';
      case Keyword.fly: return 'Fly';
      case Keyword.inceptorSquad: return 'Inceptor Squad';
      case Keyword.redemptorDreadnought: return 'Redemptor Dreadnought';
      case Keyword.scoutSquad: return 'Scout Squad';
      case Keyword.smoke: return 'Smoke';

    // Chaos / CSM
      case Keyword.chaosTerminatorSquad: return 'Chaos Terminator Squad';
      case Keyword.chosen: return 'Chosen';
      case Keyword.epicHero: return 'Epic Hero';
      case Keyword.chaosUndivided: return 'Chaos Undivided';
      case Keyword.chaos: return 'Chaos';
      case Keyword.abaddonTheDespoiler: return 'Abaddon the Despoiler';
      case Keyword.legionaries: return 'Legionaries';
      case Keyword.nemesisClaw: return 'Nemesis Claw';
      case Keyword.chaosLord: return 'Chaos Lord';
      case Keyword.possessed: return 'Possessed';
      case Keyword.masterOfPossession: return 'Master of Possession';
      case Keyword.monster: return 'Monster';
      case Keyword.daemon: return 'Daemon';
      case Keyword.vashtorrTheArkifane: return 'Vashtorr the Arkifane';
      case Keyword.havocs: return 'Havocs';
      case Keyword.warpsmith: return 'Warpsmith';
      case Keyword.damned: return 'Damned';
      case Keyword.cultistMob: return 'Cultist Mob';

    // Chaos gods
      case Keyword.khorne: return 'Khorne';
      case Keyword.berzerkers: return 'Berzerkers';
      case Keyword.nurgle: return 'Nurgle';
      case Keyword.plagueMarines: return 'Plague Marines';
      case Keyword.tzeentch: return 'Tzeentch';
      case Keyword.rubricae: return 'Rubricae';
      case Keyword.rubricMarines: return 'Rubric Marines';


    }
  }

  /// Преобразование фракционных ключевых слов
  static String factionToReadable(FactionKeyword keyword) {
    switch (keyword) {
      case FactionKeyword.emperorsChildren: return 'Emperor’s Children';
      case FactionKeyword.legionsOfExcess: return 'Legions of Excess';
      case FactionKeyword.ultramarines: return 'Ultramarines';
      case FactionKeyword.spaceWolves: return 'Space Wolves';
      case FactionKeyword.darkAngels: return 'Dark Angels';
      case FactionKeyword.tyranids: return 'Tyranids';
      case FactionKeyword.necrons: return 'Necrons';
      case FactionKeyword.adeptusAstartes: return 'Adeptus Astartes';
      case FactionKeyword.hereticAstartes: return 'Heretic Astartes';
      case FactionKeyword.worldEaters: return 'World Eaters';
      case FactionKeyword.deathGuard: return 'Death Guard';
      case FactionKeyword.thousandSons: return 'Thousand Sons';
    }
  }
}
