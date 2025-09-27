import 'package:flutter/material.dart';
import '../data/z_unit_models/unit_model.dart';
import '../data/z_unit_models/selected_unit_model.dart';
import '../data/z_unit_models/keyword_list.dart';
import '../data/z_datachment_model/detachment_model.dart';
import '../data/z_datachment_model/restriction_model.dart';
import 'army_storage.dart';

// Dark Angels imports
import '../data/dark_angels/allied_units_da.dart';
import '../data/dark_angels/battleline_da.dart';
import '../data/dark_angels/characters_da.dart';
import '../data/dark_angels/dedicated_transports_da.dart';
import '../data/dark_angels/detachment/innerCircleTaskForce.dart';
import '../data/dark_angels/detachment/unforgivenTaskForce.dart';
import '../data/dark_angels/detachment/companyOfHunters.dart';
import '../data/dark_angels/detachment/lionsBladeTaskForce.dart';
import '../data/dark_angels/detachment/wrathOfTheRock.dart';
import '../data/dark_angels/other_datasheets_da.dart';

// Space Wolves imports
import '../data/space_wolves/allied_units_sw.dart';
import '../data/space_wolves/battleline_sw.dart';
import '../data/space_wolves/characters_sw.dart';
import '../data/space_wolves/dedicated_transports_sw.dart';
import '../data/space_wolves/other_datasheets_sw.dart';
import '../data/space_wolves/detachment/championsOfFenris.dart';
import '../data/space_wolves/detachment/sagaOfTheBeastslayer.dart';
import '../data/space_wolves/detachment/sagaOfTheBold.dart';
import '../data/space_wolves/detachment/sagaOfTheHunter.dart';

// Ultramarines imports
import '../data/ultramarines/allied_units_um.dart';
import '../data/ultramarines/battleline_um.dart';
import '../data/ultramarines/characters_um.dart';
import '../data/ultramarines/dedicated_transports_um.dart';
import '../data/ultramarines/other_datasheets_um.dart';

// Space Marines detachments
import '../data/space_marines/detachment/gladius_task_force.dart';
import '../data/space_marines/detachment/anvil_siege_forse.dart';
import '../data/space_marines/detachment/librarius_conclave.dart';
import '../data/space_marines/detachment/1st_company_task_forse.dart';
import '../data/space_marines/detachment/firestorm_assault_forse.dart';
import '../data/space_marines/detachment/ironstorm_spearhead.dart';
import '../data/space_marines/detachment/vanguard_spearhead.dart';
import '../data/space_marines/detachment/stormlance_task_forse.dart';

// Chaos Space Marines detachments
import '../data/chaos_space_marines/detachment/cabal_of_chaos.dart';
import '../data/chaos_space_marines/detachment/chaos_cult.dart';
import '../data/chaos_space_marines/detachment/creations_of_bile.dart';
import '../data/chaos_space_marines/detachment/deceptors.dart';
import '../data/chaos_space_marines/detachment/dread_talons.dart';
import '../data/chaos_space_marines/detachment/fellhammer_siege_host.dart';
import '../data/chaos_space_marines/detachment/pactbound_zealots.dart';
import '../data/chaos_space_marines/detachment/renegade_raiders.dart';
import '../data/chaos_space_marines/detachment/soulforged_warpack.dart';
import '../data/chaos_space_marines/detachment/veterans_of_the_long_war.dart';

// Necrons detachments
import '../data/necrons/detachment/annihilation_legion.dart';
import '../data/necrons/detachment/awakened_dynasty.dart';
import '../data/necrons/detachment/canoptek_court.dart';
import '../data/necrons/detachment/hypercrypt_legion.dart';
import '../data/necrons/detachment/obeisance_phalanx.dart';
import '../data/necrons/detachment/starshatter_arsenal.dart';

// Tyranids detachments
import '../data/tyranids/detachment/assimilation_swarm.dart';
import '../data/tyranids/detachment/crusher_stampede.dart';
import '../data/tyranids/detachment/invasion_fleet.dart';
import '../data/tyranids/detachment/subterranean_assault.dart';
import '../data/tyranids/detachment/synaptic_nexus.dart';
import '../data/tyranids/detachment/unending_swarm.dart';
import '../data/tyranids/detachment/vanguard_onslaught.dart';
import '../data/tyranids/detachment/warrior_bioform_onslaught.dart';

// Units imports
import '../data/space_marines/characters_sm.dart';
import '../data/space_marines/battleline_sm.dart';
import '../data/space_marines/dedicated_transports_sm.dart';
import '../data/space_marines/other_datasheets_sm.dart';
import '../data/space_marines/allied_units_sm.dart';

import '../data/chaos_space_marines/characters_csm.dart';
import '../data/chaos_space_marines/battleline_csm.dart';
import '../data/chaos_space_marines/dedicated_transports_csm.dart';
import '../data/chaos_space_marines/other_datasheets_csm.dart';
import '../data/chaos_space_marines/allied_units_csm.dart';

import '../data/tyranids/characters_tyranids.dart';
import '../data/tyranids/battleline_tyranids.dart';
import '../data/tyranids/dedicated_transports_tyranids.dart';
import '../data/tyranids/other_datasheets_tyranids.dart';
import '../data/tyranids/allied_units_tyranids.dart';

import '../data/necrons/characters_necrons.dart';
import '../data/necrons/battleline_necrons.dart';
import '../data/necrons/dedicated_transports_necrons.dart';
import '../data/necrons/other_datasheets_necrons.dart';
import '../data/necrons/allied_units_necrons.dart';

// Emperor’s Children imports
import '../data/emperors_children/allied_units_ec.dart';
import '../data/emperors_children/battleline_ec.dart';
import '../data/emperors_children/characters_ec.dart';
import '../data/emperors_children/dedicated_transports_ec.dart';
import '../data/emperors_children/other_datasheets_ec.dart';
import '../data/emperors_children/detachment/mercurial_host.dart';
import '../data/emperors_children/detachment/peerless_bladesmen.dart';
import '../data/emperors_children/detachment/rapid_evisceration.dart';
import '../data/emperors_children/detachment/carnival_of_excess.dart';
import '../data/emperors_children/detachment/coterie_of_the_conceited.dart';
import '../data/emperors_children/detachment/slaaneshs_chosen.dart';

// Death Guard imports
import '../data/death_guard/allied_units_dg.dart';
import '../data/death_guard/battleline_dg.dart';
import '../data/death_guard/characters_dg.dart';
import '../data/death_guard/dedicated_transports_dg.dart';
import '../data/death_guard/other_datasheets_dg.dart';
import '../data/death_guard/detachment/virulent_vectorium.dart';
import '../data/death_guard/detachment/mortarions_hammer.dart';
import '../data/death_guard/detachment/champions_of_contagion.dart';
import '../data/death_guard/detachment/tallyband_summoners.dart';
import '../data/death_guard/detachment/shamblerot_vectorium.dart';
import '../data/death_guard/detachment/death_lords_chosen.dart';
import '../data/death_guard/detachment/flyblown_host.dart';

class FactionData {
  final String name;
  final IconData icon;
  final Color color;

  const FactionData(this.name, this.icon, this.color);
}

class FactionManager {
  static const List<FactionData> factions = [
    FactionData('Space Marines', Icons.security, Colors.blue),
    FactionData('Dark Angels', Icons.dark_mode, Colors.green),
    FactionData('Space Wolves', Icons.wb_sunny, Colors.grey),
    FactionData('Ultramarines', Icons.shield, Colors.indigo),
    FactionData('Tyranids', Icons.bug_report, Colors.purple),
    FactionData('Chaos Space Marines', Icons.safety_check_outlined, Colors.black),
    FactionData('Necrons', Icons.android, Colors.green),
    FactionData('Emperor’s Children', Icons.music_note, Colors.pink),
    FactionData('Death Guard', Icons.coronavirus, Colors.lime),
  ];

  static List<Restriction> getFactionRestrictions(String faction) {
    switch (faction) {
      case 'Space Wolves':
        return [
          Restriction.keywordBan(
              keywords: [Keyword.apothecary],
              description: ''
          )
        ];
      default:
        return [];
    }
  }

  static List<Detachment> getFactionDetachments(String faction) {
    switch (faction) {
      case 'Emperor’s Children':
        return [
          mercurialHost,
          peerlessBladesmen,
          rapidEvisceration,
          carnivalOfExcess,
          coterieOfTheConceited,
          slaaneshsChosen,
        ];
      case 'Death Guard':
        return [
          virulentVectorium,
          mortarionsHammer,
          championsOfContagion,
          tallybandSummoners,
          shamblerotVectorium,
          deathLordsChosen,
          flyblownHost,
        ];
      case 'Space Marines':
        return [
          gladiusTaskForce,
          anvilSiegeForce,
          librariusConclave,
          firstCompanyTaskForce,
          firestormAssaultForce,
          ironstormSpearhead,
          vanguardSpearhead,
          stormlanceTaskForce,
        ];
      case 'Dark Angels':
        return [
          gladiusTaskForce,
          anvilSiegeForce,
          librariusConclave,
          firstCompanyTaskForce,
          firestormAssaultForce,
          ironstormSpearhead,
          vanguardSpearhead,
          stormlanceTaskForce,
          unforgivenTaskForce,
          innerCircleTaskForce,
          companyOfHunters,
          lionsBladeTaskForce,
          wrathOfTheRock,
        ];
      case 'Space Wolves':
        return [
          gladiusTaskForce,
          anvilSiegeForce,
          librariusConclave,
          firstCompanyTaskForce,
          firestormAssaultForce,
          ironstormSpearhead,
          vanguardSpearhead,
          stormlanceTaskForce,
          championsOfFenris,
          sagaOfTheBeastslayer,
          sagaOfTheBold,
          sagaOfTheHunter,
        ];
      case 'Ultramarines':
        return [
          gladiusTaskForce,
          anvilSiegeForce,
          librariusConclave,
          firstCompanyTaskForce,
          firestormAssaultForce,
          ironstormSpearhead,
          vanguardSpearhead,
          stormlanceTaskForce,
        ];
      case 'Chaos Space Marines':
        return [
          cabalOfChaos,
          chaosCult,
          creationsOfBile,
          deceptors,
          dreadTalons,
          fellhammerSiegeHost,
          pactboundZealots,
          renegadeRaiders,
          soulforgedWarpack,
          veteransOfTheLongWar,
        ];
      case 'Tyranids':
        return [
          assimilationSwarm,
          crusherStampede,
          invasionFleet,
          subterraneanAssault,
          synapticNexus,
          unendingSwarm,
          vanguardOnslaught,
          warriorBioformOnslaught,
        ];
      case 'Necrons':
        return [
          annihilationLegion,
          awakenedDynasty,
          canoptekCourt,
          hypercryptLegion,
          obeisancePhalanx,
          starshatterArsenal,
        ];
      default:
        return [];
    }
  }

  static Map<String, List<Unit>> getFactionUnits(String faction) {
    final Map<String, List<Unit>> units = {
      'characters': [],
      'battleline': [],
      'dedicated_transports': [],
      'other_datasheets': [],
      'allied_units': [],
    };

    switch (faction) {
      case 'Emperor’s Children':
        units['characters'] = getCharactersEC();
        units['battleline'] = getBattlelineEC();
        units['dedicated_transports'] = getDedicatedTransportsEC();
        units['other_datasheets'] = getOtherDatasheetsEC();
        units['allied_units'] = getAlliedUnitsEC();
        break;
      case 'Death Guard':
        units['characters'] = getCharactersDG();
        units['battleline'] = getBattlelineDG();
        units['dedicated_transports'] = getDedicatedTransportsDG();
        units['other_datasheets'] = getOtherDatasheetsDG();
        units['allied_units'] = getAlliedUnitsDG();
        break;
      case 'Space Marines':
        units['characters'] = getCharactersSM();
        units['battleline'] = getBattlelineSM();
        units['dedicated_transports'] = getDedicatedTransportsSM();
        units['other_datasheets'] = getOtherDatasheetsSM();
        units['allied_units'] = getAlliedUnitsSM();
        break;
      case 'Dark Angels':
        units['characters'] = [...getCharactersSM(), ...getCharactersDA()];
        units['battleline'] = [...getBattlelineSM(), ...getBattlelineDA()];
        units['dedicated_transports'] = [...getDedicatedTransportsSM(), ...getDedicatedTransportsDA()];
        units['other_datasheets'] = [...getOtherDatasheetsSM(), ...getOtherDatasheetsDA()];
        units['allied_units'] = [...getAlliedUnitsSM(), ...getAlliedUnitsDA()];
        break;
      case 'Space Wolves':
        units['characters'] = [...getCharactersSM(), ...getCharactersSW()];
        units['battleline'] = [...getBattlelineSM(), ...getBattlelineSW()];
        units['dedicated_transports'] = [...getDedicatedTransportsSM(), ...getDedicatedTransportsSW()];
        units['other_datasheets'] = [...getOtherDatasheetsSM(), ...getOtherDatasheetsSW()];
        units['allied_units'] = [...getAlliedUnitsSM(), ...getAlliedUnitsSW()];
        break;
      case 'Ultramarines':
        units['characters'] = [...getCharactersSM(), ...getCharactersUM()];
        units['battleline'] = [...getBattlelineSM(), ...getBattlelineUM()];
        units['dedicated_transports'] = [...getDedicatedTransportsSM(), ...getDedicatedTransportsUM()];
        units['other_datasheets'] = [...getOtherDatasheetsSM(), ...getOtherDatasheetsUM()];
        units['allied_units'] = [...getAlliedUnitsSM(), ...getAlliedUnitsUM()];
        break;
      case 'Chaos Space Marines':
        units['characters'] = getCharactersCSM();
        units['battleline'] = getBattlelineCSM();
        units['dedicated_transports'] = getDedicatedTransportsCSM();
        units['other_datasheets'] = getOtherDatasheetsCSM();
        units['allied_units'] = getAlliedUnitsCSM();
        break;
      case 'Tyranids':
        units['characters'] = getCharactersTyranids();
        units['battleline'] = getBattlelineTyranids();
        units['dedicated_transports'] = getDedicatedTransportsTyranids();
        units['other_datasheets'] = getOtherDatasheetsTyranids();
        units['allied_units'] = getAlliedUnitsTyranids();
        break;
      case 'Necrons':
        units['characters'] = getCharactersNecrons();
        units['battleline'] = getBattlelineNecrons();
        units['dedicated_transports'] = getDedicatedTransportsNecrons();
        units['other_datasheets'] = getOtherDatasheetsNecrons();
        units['allied_units'] = getAlliedUnitsNecrons();
        break;
    }
    return units;
  }

  static Future<FactionLoadResult> loadFaction({
    required String faction,
    required List<Unit> allFactionUnits,
  }) async {
    try {
      final unitsByCategory = getFactionUnits(faction);
      final availableDetachments = getFactionDetachments(faction);
      final factionRestrictions = getFactionRestrictions(faction);

      final newAllFactionUnits = [
        ...unitsByCategory['characters']!,
        ...unitsByCategory['battleline']!,
        ...unitsByCategory['dedicated_transports']!,
        ...unitsByCategory['other_datasheets']!,
        ...unitsByCategory['allied_units']!,
      ];

      final savedSelectedUnits = await ArmyStorage.loadSelectedUnits(faction, newAllFactionUnits);
      final savedDetachmentName = await ArmyStorage.loadSelectedDetachment(faction);

      Detachment? savedDetachment;
      if (savedDetachmentName != null && availableDetachments.isNotEmpty) {
        savedDetachment = availableDetachments.firstWhere(
              (d) => d.name == savedDetachmentName,
          orElse: () => availableDetachments.first,
        );
      }

      return FactionLoadResult(
        unitsByCategory: unitsByCategory,
        availableDetachments: availableDetachments,
        factionRestrictions: factionRestrictions,
        allFactionUnits: newAllFactionUnits,
        savedSelectedUnits: savedSelectedUnits,
        savedDetachment: savedDetachment,
      );
    } catch (e) {
      throw Exception('Failed to load faction: $e');
    }
  }

  static Future<void> saveFactionData({
    required String faction,
    required List<SelectedUnit> selectedUnits,
    required Detachment? selectedDetachment,
  }) async {
    if (faction.isEmpty) return;

    try {
      await ArmyStorage.saveSelectedUnits(faction, selectedUnits);
      await ArmyStorage.saveCurrentFaction(faction);
      if (selectedDetachment != null) {
        await ArmyStorage.saveSelectedDetachment(faction, selectedDetachment.name);
      }
    } catch (_) {}
  }
}

class FactionLoadResult {
  final Map<String, List<Unit>> unitsByCategory;
  final List<Detachment> availableDetachments;
  final List<Restriction> factionRestrictions;
  final List<Unit> allFactionUnits;
  final List<SelectedUnit> savedSelectedUnits;
  final Detachment? savedDetachment;

  const FactionLoadResult({
    required this.unitsByCategory,
    required this.availableDetachments,
    required this.factionRestrictions,
    required this.allFactionUnits,
    required this.savedSelectedUnits,
    required this.savedDetachment,
  });
}