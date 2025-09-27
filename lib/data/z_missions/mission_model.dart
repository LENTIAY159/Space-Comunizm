// lib/data/z_missions/mission_model.dart

enum MissionType {
  primary,
  secondary,
  gambit,
  rule,
  map,
}

class MissionRef {
  final String id;
  const MissionRef(this.id);
}

/// -------------------- RULE --------------------
class MissionRule {
  final String id;         // уникальный ключ
  final String name;
  final String short;      // краткое описание/эффект
  const MissionRule({
    required this.id,
    required this.name,
    required this.short,
  });
}

/// -------------------- PRIMARY --------------------
class PrimaryMission {
  final String id;         // уникальный ключ
  final String name;
  final List<String> appliesRules; // ids MissionRule
  final String description;        // что делать в миссии
  const PrimaryMission({
    required this.id,
    required this.name,
    this.appliesRules = const [],
    required this.description,
  });
}

/// -------------------- SECONDARY --------------------
class SecondaryMission {
  final String id;         // уникальный ключ
  final String name;
  final String description; // условия выполнения
  const SecondaryMission({
    required this.id,
    required this.name,
    required this.description,
  });
}

/// -------------------- GAMBIT --------------------
class Gambit {
  final String id;         // уникальный ключ
  final String name;
  final String description; // как разыгрывается гамбит и как скорится
  const Gambit({
    required this.id,
    required this.name,
    required this.description,
  });
}

/// -------------------- MAP POINT --------------------
class MapPoint {
  final String id;         // уникальный ключ для точки
  final double x;          // координата X в дюймах
  final double y;          // координата Y в дюймах
  final String type;       // 'objective', 'attacker_zone', 'defender_zone'
  final String? label;     // опциональная метка
  const MapPoint({
    required this.id,
    required this.x,
    required this.y,
    required this.type,
    this.label,
  });
}

/// -------------------- MISSION MAP --------------------
class MissionMap {
  final String id;         // уникальный ключ
  final String name;

  /// Точки (objectives, маркеры и т.п.)
  final List<MapPoint> points;

  /// Полигоны зон игроков
  final List<List<MapPoint>> attackerZones;
  final List<List<MapPoint>> defenderZones;

  /// Радиус нейтральной зоны в дюймах от центра стола (опционально).
  final double? specialNumber;

  /// Базовый размер миссии (дефолт 44×60).
  final double baseW;
  final double baseH;

  const MissionMap({
    required this.id,
    required this.name,
    required this.points,
    this.attackerZones = const [],
    this.defenderZones = const [],
    this.specialNumber,
    this.baseW = 44,
    this.baseH = 60,
  });
}

/// -------------------- PACK --------------------
class MissionPack {
  final String id;         // 'leviathan'
  final String title;      // 'Leviathan'
  final List<PrimaryMission> primaries;
  final List<SecondaryMission> secondaries;
  final List<Gambit> gambits;
  final List<MissionRule> rules;
  final List<MissionMap> maps; // карты миссий

  const MissionPack({
    required this.id,
    required this.title,
    required this.primaries,
    required this.secondaries,
    required this.gambits,
    required this.rules,
    this.maps = const [],
  });
}
