import 'unit_model.dart';

/// Модель для выбранного юнита в армии с уникальным ID экземпляра
class SelectedUnit {
  /// Уникальный ID данного экземпляра юнита в армии
  final String instanceId;

  /// Базовый юнит
  final Unit unit;

  /// ID выбранного состава для данного экземпляра
  final String selectedCompositionId;

  /// Временная метка создания для сортировки
  final DateTime createdAt;

  const SelectedUnit({
    required this.instanceId,
    required this.unit,
    required this.selectedCompositionId,
    required this.createdAt,
  });

  /// Получает выбранную опцию состава
  UnitCompositionOption? get selectedComposition {
    return unit.findCompositionById(selectedCompositionId);
  }

  /// Получает стоимость данного экземпляра юнита
  int get points {
    return selectedComposition?.points ?? 0;
  }

  /// Получает количество моделей в данном экземпляре юнита
  int get modelCount {
    return selectedComposition?.modelCount ?? 0;
  }

  /// Создает копию с новыми параметрами
  SelectedUnit copyWith({
    String? instanceId,
    Unit? unit,
    String? selectedCompositionId,
    DateTime? createdAt,
  }) {
    return SelectedUnit(
      instanceId: instanceId ?? this.instanceId,
      unit: unit ?? this.unit,
      selectedCompositionId: selectedCompositionId ?? this.selectedCompositionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Конвертация в JSON для сохранения
  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'unitId': unit.id,
      'selectedCompositionId': selectedCompositionId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Создание из JSON (требует отдельной передачи Unit)
  static SelectedUnit fromJson(Map<String, dynamic> json, Unit unit) {
    return SelectedUnit(
      instanceId: json['instanceId'],
      unit: unit,
      selectedCompositionId: json['selectedCompositionId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SelectedUnit &&
        other.instanceId == instanceId &&
        other.unit.id == unit.id &&
        other.selectedCompositionId == selectedCompositionId;
  }

  @override
  int get hashCode => Object.hash(instanceId, unit.id, selectedCompositionId);

  @override
  String toString() {
    return 'SelectedUnit(instanceId: $instanceId, unit: ${unit.name}, composition: $selectedCompositionId, points: $points)';
  }
}