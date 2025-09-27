// army_rule_model.dart
class ArmyRule {
  final String name;
  final String description;
  final String? additionalText; // Новое поле для дополнительного текста

  const ArmyRule({
    required this.name,
    required this.description,
    this.additionalText,
  });

  /// Возвращает полное отформатированное название правила
  String get displayName {
    if (additionalText != null && additionalText!.isNotEmpty) {
      return '$name ($additionalText)';
    }
    return name;
  }

  /// Создает копию правила с дополнительным текстом
  ArmyRule withAdditionalText(String text) {
    return ArmyRule(
      name: name,
      description: description,
      additionalText: text,
    );
  }

  /// Создает копию правила без дополнительного текста
  ArmyRule withoutAdditionalText() {
    return ArmyRule(
      name: name,
      description: description,
      additionalText: null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArmyRule &&
        other.name == name &&
        other.description == description &&
        other.additionalText == additionalText;
  }

  @override
  int get hashCode => Object.hash(name, description, additionalText);

  @override
  String toString() {
    return 'ArmyRule(name: $name, additionalText: $additionalText)';
  }
}