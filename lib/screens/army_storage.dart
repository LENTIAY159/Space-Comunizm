import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../data/z_unit_models/selected_unit_model.dart';
import '../data/z_unit_models/unit_model.dart';

// Extension для работы с firstOrNull
extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      return iterator.current;
    }
    return null;
  }
}

class ArmyStorage {
  // Сохранённая фракция
  static const String _keyCurrentFaction = 'current_faction';

  // Выбранные юниты (с экземплярами)
  static const String _keySelectedUnitsPrefix = 'selected_units_';

  // Детачмент на фракцию
  static const String _keyDetachmentPrefix = 'detachment_';

  // ===== WARLORD =====
  static const String _keyWarlordPrefix = 'warlord_';

  // ===== MISSIONS =====
  // Сохранённая основная миссия
  static const String _keyGeneratedMission = 'generated_mission';
  // Сохранённые вторичные миссии
  static const String _keyCurrentSecondaries = 'current_secondaries';
  // Использованные ID вторичных миссий (для уникального рандома)
  static const String _keyUsedSecondaryIds = 'used_secondary_ids';
  // Текущий индекс пака миссий
  static const String _keyMissionPackIndex = 'mission_pack_index';

  /// Сохранить instanceId варлорда для фракции
  static Future<void> saveWarlordInstanceId(String faction, String instanceId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_keyWarlordPrefix$faction', instanceId);
  }

  /// Загрузить instanceId варлорда для фракции
  static Future<String?> loadWarlordInstanceId(String faction) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('$_keyWarlordPrefix$faction');
  }

  /// Очистить варлорда для фракции
  static Future<void> clearWarlordInstanceId(String faction) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_keyWarlordPrefix$faction');
  }

  // ===== SELECTED UNITS =====

  /// Сохранить список выбранных юнитов
  static Future<void> saveSelectedUnits(String faction, List<SelectedUnit> selectedUnits) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keySelectedUnitsPrefix$faction';
    final jsonList = selectedUnits.map((u) => u.toJson()).toList();
    await prefs.setString(key, jsonEncode(jsonList));
  }

  /// Загрузить список выбранных юнитов
  static Future<List<SelectedUnit>> loadSelectedUnits(
      String faction,
      List<Unit> allAvailableUnits,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keySelectedUnitsPrefix$faction';

    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];

    try {
      final jsonList = (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();
      return jsonList.map((j) {
        final unitId = j['unitId'] as String;
        final unit = allAvailableUnits.firstWhere((u) => u.id == unitId);
        return SelectedUnit.fromJson(j, unit);
      }).toList();
    } catch (e) {
      // в случае несовместимых данных просто вернём пустой список
      return [];
    }
  }

  static Future<void> addSelectedUnit(String faction, SelectedUnit selectedUnit, List<Unit> allAvailableUnits) async {
    final list = await loadSelectedUnits(faction, allAvailableUnits);
    list.add(selectedUnit);
    await saveSelectedUnits(faction, list);
  }

  static Future<void> removeSelectedUnit(String faction, String instanceId, List<Unit> allAvailableUnits) async {
    final list = await loadSelectedUnits(faction, allAvailableUnits);
    list.removeWhere((u) => u.instanceId == instanceId);
    await saveSelectedUnits(faction, list);

    // если удалили текущего варлорда — подчистим
    final wl = await loadWarlordInstanceId(faction);
    if (wl == instanceId) {
      await clearWarlordInstanceId(faction);
    }
  }

  static Future<void> updateSelectedUnitComposition(
      String faction,
      String instanceId,
      String newCompositionId,
      List<Unit> allAvailableUnits,
      ) async {
    final list = await loadSelectedUnits(faction, allAvailableUnits);
    final i = list.indexWhere((u) => u.instanceId == instanceId);
    if (i != -1) {
      list[i] = list[i].copyWith(selectedCompositionId: newCompositionId);
      await saveSelectedUnits(faction, list);
    }
  }

  static Future<void> clearSelectedUnits(String faction) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_keySelectedUnitsPrefix$faction');
    await clearWarlordInstanceId(faction);
  }

  // ===== FACTION / DETACHMENT =====

  static Future<void> saveCurrentFaction(String faction) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCurrentFaction, faction);
  }

  static Future<String> loadCurrentFaction() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCurrentFaction) ?? '';
  }

  static Future<void> saveSelectedDetachment(String faction, String detachmentName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_keyDetachmentPrefix$faction', detachmentName);
  }

  static Future<String?> loadSelectedDetachment(String faction) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('$_keyDetachmentPrefix$faction');
  }

  // ===== MISSIONS =====

  /// Сохранить сгенерированную основную миссию
  static Future<void> saveGeneratedMission(Map<String, String> mission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyGeneratedMission, jsonEncode(mission));
  }

  /// Загрузить сгенерированную основную миссию
  /// Возвращает Map с ключами: 'mapId', 'ruleId', 'primaryId'
  static Future<Map<String, String>?> loadGeneratedMission() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyGeneratedMission);
    if (jsonString == null) return null;

    try {
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return Map<String, String>.from(map);
    } catch (e) {
      return null;
    }
  }

  /// Очистить сохранённую основную миссию
  static Future<void> clearGeneratedMission() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyGeneratedMission);
  }

  /// Сохранить текущие вторичные миссии
  static Future<void> saveCurrentSecondaries(List<String> secondaryIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCurrentSecondaries, jsonEncode(secondaryIds));
  }

  /// Загрузить текущие вторичные миссии
  static Future<List<String>> loadCurrentSecondaries() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyCurrentSecondaries);
    if (jsonString == null) return [];

    try {
      final list = jsonDecode(jsonString) as List;
      return List<String>.from(list);
    } catch (e) {
      return [];
    }
  }

  /// Очистить текущие вторичные миссии
  static Future<void> clearCurrentSecondaries() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCurrentSecondaries);
  }

  /// Сохранить использованные ID вторичных миссий (для уникального рандома)
  static Future<void> saveUsedSecondaryIds(Set<String> usedIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsedSecondaryIds, jsonEncode(usedIds.toList()));
  }

  /// Загрузить использованные ID вторичных миссий
  static Future<Set<String>> loadUsedSecondaryIds() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUsedSecondaryIds);
    if (jsonString == null) return <String>{};

    try {
      final list = jsonDecode(jsonString) as List;
      return Set<String>.from(list);
    } catch (e) {
      return <String>{};
    }
  }

  /// Очистить использованные ID вторичных миссий (перезапуск системы уникального рандома)
  static Future<void> clearUsedSecondaryIds() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsedSecondaryIds);
  }

  /// Сохранить индекс выбранного пака миссий
  static Future<void> saveMissionPackIndex(int packIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyMissionPackIndex, packIndex);
  }

  /// Загрузить индекс выбранного пака миссий
  static Future<int> loadMissionPackIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyMissionPackIndex) ?? 0;
  }

  /// Очистить все данные миссий (полный сброс)
  static Future<void> clearAllMissionData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyGeneratedMission);
    await prefs.remove(_keyCurrentSecondaries);
    await prefs.remove(_keyUsedSecondaryIds);
    // pack index оставляем, так как это пользовательское предпочтение
  }

  /// Перезапустить систему вторичных миссий (очистить вторичные и использованные ID)
  static Future<void> restartSecondariesSystem() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCurrentSecondaries);
    await prefs.remove(_keyUsedSecondaryIds);
  }
}