import 'package:flutter/material.dart';
import '../data/z_unit_models/unit_model.dart';
import '../data/z_unit_models/selected_unit_model.dart';
import '../data/z_unit_models/keyword_list.dart';
import '../data/z_datachment_model/restriction_engine.dart';
import '../data/z_datachment_model/restriction_model.dart';
import 'army_storage.dart';
import 'dart:math';

class UnitManager {
  static String _generateUniqueInstanceId() {
    final ts = DateTime.now().millisecondsSinceEpoch;
    final rnd = Random().nextInt(10000);
    return '${ts}_$rnd';
  }

  static Future<bool> addUnit({
    required Unit unit,
    required List<SelectedUnit> selectedUnits,
    required List<Restriction> factionRestrictions,
    required List<Restriction> detachmentRestrictions,
    required BuildContext context,
    required Function(SelectedUnit) onUnitAdded,
  }) async {
    try {
      // Глобальное ограничение: один экземпляр КАЖДОГО эпического героя
      if (unit.hasKeyword(Keyword.epicHero)) {
        final alreadyTaken = selectedUnits.any((su) => su.unit.id == unit.id);
        if (alreadyTaken) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Эпический герой "${unit.name}" может быть только в одном экземпляре.'),
                backgroundColor: Colors.orange,
                duration: const Duration(seconds: 2),
              ),
            );
          }
          return false;
        }
      }
    } catch (_) {
      // на случай, если старые юниты без метода/кейворда попадутся — просто молча продолжаем
    }

    final selected = SelectedUnit(
      instanceId: _generateUniqueInstanceId(),
      unit: unit,
      selectedCompositionId: unit.defaultComposition?.id ?? '',
      createdAt: DateTime.now(),
    );

    final allRestrictions = <Restriction>[
      ...factionRestrictions,
      ...detachmentRestrictions,
    ];

    final canEngine = RestrictionEngine(allRestrictions, selectedUnits);
    if (!canEngine.canAdd(unit)) {
      final reason = canEngine.getRestrictionReason(unit);
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(reason ?? 'Cannot add this unit'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    onUnitAdded(selected);

    if (!context.mounted) return true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${unit.name}'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );

    return true;
  }

  static Future<void> removeUnit({
    required SelectedUnit selectedUnit,
    required List<SelectedUnit> selectedUnits,
    required Function() onUnitsChanged,
  }) async {
    selectedUnits.removeWhere((u) => u.instanceId == selectedUnit.instanceId);
    onUnitsChanged();
  }

  static Future<void> updateUnitComposition({
    required String instanceId,
    required String compositionId,
    required List<SelectedUnit> selectedUnits,
    required Function() onUnitsChanged,
  }) async {
    final i = selectedUnits.indexWhere((u) => u.instanceId == instanceId);
    if (i != -1) {
      selectedUnits[i] = selectedUnits[i].copyWith(selectedCompositionId: compositionId);
      onUnitsChanged();
    }
  }
}