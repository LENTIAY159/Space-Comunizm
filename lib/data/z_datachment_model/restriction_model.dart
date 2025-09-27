import '../z_unit_models/keyword_list.dart';

/// Типы ограничений
enum RestrictionType {
  unitBan,        // Полный запрет юнита
  keywordBan,     // Полный запрет ключевого слова
  unitLimit,      // Лимит на количество конкретных юнитов
  keywordLimit,   // Лимит на количество юнитов с ключевым словом
  exclusiveKeywordBan,  // Запрет только для юнитов с определенными ключевыми словами (без дополнительных)
}

/// Модель ограничения
class Restriction {
  final RestrictionType type;
  final String description;
  final int? maxCount;
  final List<String> unitNames;
  final List<Keyword> keywords;
  final List<FactionKeyword> factionKeywords;

  const Restriction({
    required this.type,
    required this.description,
    this.maxCount,
    this.unitNames = const [],
    this.keywords = const [],
    this.factionKeywords = const [],
  });

  /// Фабричный метод для создания запрета на юнит
  factory Restriction.unitBan({
    required List<String> unitNames,
    required String description,
  }) {
    return Restriction(
      type: RestrictionType.unitBan,
      description: description,
      unitNames: unitNames,
    );
  }

  /// Фабричный метод для создания запрета на ключевое слово
  factory Restriction.keywordBan({
    List<Keyword> keywords = const [],
    List<FactionKeyword> factionKeywords = const [],
    required String description,
  }) {
    return Restriction(
      type: RestrictionType.keywordBan,
      description: description,
      keywords: keywords,
      factionKeywords: factionKeywords,
    );
  }

  /// Фабричный метод для создания исключительного запрета на ключевое слово
  /// (банит только юниты с указанными ключевыми словами, но без дополнительных)
  factory Restriction.exclusiveKeywordBan({
    List<Keyword> keywords = const [],
    List<FactionKeyword> factionKeywords = const [],
    required String description,
  }) {
    return Restriction(
      type: RestrictionType.exclusiveKeywordBan,
      description: description,
      keywords: keywords,
      factionKeywords: factionKeywords,
    );
  }

  /// Фабричный метод для создания лимита на юнит
  factory Restriction.unitLimit({
    required List<String> unitNames,
    required int maxCount,
    required String description,
  }) {
    return Restriction(
      type: RestrictionType.unitLimit,
      description: description,
      maxCount: maxCount,
      unitNames: unitNames,
    );
  }

  /// Фабричный метод для создания лимита на ключевое слово
  factory Restriction.keywordLimit({
    List<Keyword> keywords = const [],
    List<FactionKeyword> factionKeywords = const [],
    required int maxCount,
    required String description,
  }) {
    return Restriction(
      type: RestrictionType.keywordLimit,
      description: description,
      maxCount: maxCount,
      keywords: keywords,
      factionKeywords: factionKeywords,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Restriction &&
        other.type == type &&
        other.description == description &&
        other.maxCount == maxCount &&
        _listEquals(other.unitNames, unitNames) &&
        _listEquals(other.keywords, keywords) &&
        _listEquals(other.factionKeywords, factionKeywords);
  }

  @override
  int get hashCode {
    return Object.hash(
      type,
      description,
      maxCount,
      Object.hashAll(unitNames),
      Object.hashAll(keywords),
      Object.hashAll(factionKeywords),
    );
  }

  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'Restriction(type: $type, description: $description, maxCount: $maxCount, '
        'unitNames: $unitNames, keywords: $keywords, factionKeywords: $factionKeywords)';
  }
}