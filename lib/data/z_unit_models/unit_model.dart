import 'keyword_list.dart';
import 'weapon_model.dart';
import 'core_abilities.dart';
import '../z_datachment_model/army_rule_model.dart';

/// Профиль отдельной модели в юните
class ModelProfile {
  final String name;
  final String move;
  final String toughness;
  final String save;
  final String wounds;
  final String leadership;
  final String objectiveControl;
  final String? invulnerableSave;
  final String? baseSize; // 🔸 ИЗМЕНЕНО: тип изменен с int? на String?

  const ModelProfile({
    required this.name,
    required this.move,
    required this.toughness,
    required this.save,
    required this.wounds,
    required this.leadership,
    required this.objectiveControl,
    this.invulnerableSave,
    this.baseSize,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModelProfile &&
        other.name == name &&
        other.move == move &&
        other.toughness == toughness &&
        other.save == save &&
        other.wounds == wounds &&
        other.leadership == leadership &&
        other.objectiveControl == objectiveControl &&
        other.invulnerableSave == invulnerableSave &&
        other.baseSize == baseSize;
  }

  @override
  int get hashCode => Object.hash(
      name, move, toughness, save, wounds,
      leadership, objectiveControl, invulnerableSave, baseSize
  );

  @override
  String toString() {
    return 'ModelProfile(name: $name, move: $move, toughness: $toughness, save: $save, wounds: $wounds)';
  }
}

/// Профиль состава отряда: количество моделей, очки и идентификатор
class UnitCompositionOption {
  final String id; // Добавлен ID (например: "1", "2", "3")
  final int modelCount;
  final int points;

  const UnitCompositionOption({
    required this.id,
    required this.modelCount,
    required this.points,
  });

  /// Вспомогательный метод для отображения состава
  String get displayText => '$modelCount models - $points pts';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnitCompositionOption &&
        other.id == id &&
        other.modelCount == modelCount &&
        other.points == points;
  }

  @override
  int get hashCode => Object.hash(id, modelCount, points);
}

class Unit {
  final String id;
  final String name;
  final String move;
  final String toughness;
  final String save;
  final String wounds;
  final String leadership;
  final String objectiveControl;
  final String? invulnerableSave;

  final List<Weapon> rangedWeapons;
  final List<Weapon> meleeWeapons;
  final List<String> abilities;

  final List<Object>? leader;
  final String? leaderDescription;
  final List<UnitCompositionOption> unitComposition;
  final String? unitCompositionDescription;
  final List<Object> keywords;
  final List<FactionKeyword> factionKeywords;
  final List<CoreAbility> coreAbilities;
  final Map<CoreAbility, Map<String, dynamic>>? coreRuleDetails;
  final List<ArmyRule> factionAbilities;
  final String? wargearAbilities;
  final String? wargearOptions;
  final Map<String, String> damaged;

  final String? specialName;
  final String? specialText;
  final String? baseSize;
  final List<ModelProfile>? modelProfiles;
  final String? transport;

  /// 🔸 НОВОЕ ПОЛЕ: Commander (заголовок + ограничение)
  /// Пример: ['Warlord Only', true]
  final List<dynamic>? commander;

  const Unit({
    required this.id,
    required this.name,
    required this.move,
    required this.toughness,
    required this.save,
    required this.wounds,
    required this.leadership,
    required this.objectiveControl,
    this.invulnerableSave,
    this.rangedWeapons = const [],
    this.meleeWeapons = const [],
    this.abilities = const [],
    this.leader,
    this.leaderDescription,
    this.unitComposition = const [],
    this.unitCompositionDescription,
    this.keywords = const [],
    this.factionKeywords = const [],
    this.coreAbilities = const [],
    this.coreRuleDetails,
    this.factionAbilities = const [],
    this.wargearAbilities,
    this.wargearOptions,
    this.damaged = const {},
    this.specialName,
    this.specialText,
    this.baseSize,
    this.modelProfiles,
    this.transport,
    this.commander, // 🔸 добавлено
  });


  /// 🔸 НОВЫЙ МЕТОД: Получить только ключевые слова (Keyword) из смешанного списка
  List<Keyword> get keywordObjects {
    return keywords.whereType<Keyword>().toList();
  }

  /// 🔸 НОВЫЙ МЕТОД: Получить только текстовые описания из смешанного списка
  List<String> get keywordTexts {
    return keywords.whereType<String>().toList();
  }

  /// 🔸 НОВЫЙ МЕТОД: Форматированное отображение keywords с текстом
  String get formattedKeywords {
    if (keywords.isEmpty) return '';

    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < keywords.length; i++) {
      final item = keywords[i];

      if (item is String) {
        buffer.write(item);
      } else if (item is Keyword) {
        // Предполагаем, что у Keyword есть метод toString() или name
        buffer.write(item.toString());

        // Добавляем запятую после ключевого слова, если это не последний элемент
        // и следующий элемент тоже Keyword
        if (i < keywords.length - 1 && keywords[i + 1] is Keyword) {
          buffer.write(', ');
        }
      }
    }

    return buffer.toString();
  }

  /// 🔸 НОВЫЙ МЕТОД: Проверить, содержит ли список определенное ключевое слово
  bool hasKeyword(Keyword keyword) {
    return keywordObjects.contains(keyword);
  }

  /// 🔸 НОВЫЙ МЕТОД: Проверить, содержит ли список определенный текст
  bool hasKeywordText(String text) {
    return keywordTexts.any((keywordText) => keywordText.contains(text));
  }

  /// 🔸 НОВЫЙ МЕТОД: Проверить, есть ли у юнита транспортная способность
  bool get hasTransport => transport != null && transport!.isNotEmpty;

  /// Возвращает эффективные профили моделей:
  /// - Если modelProfiles задан, возвращает его
  /// - Иначе создает один профиль на основе основных характеристик юнита
  List<ModelProfile> get effectiveProfiles {
    if (modelProfiles != null && modelProfiles!.isNotEmpty) {
      return modelProfiles!;
    }

    // Создаем единственный профиль на основе основных характеристик
    return [
      ModelProfile(
        name: name,
        move: move,
        toughness: toughness,
        save: save,
        wounds: wounds,
        leadership: leadership,
        objectiveControl: objectiveControl,
        invulnerableSave: invulnerableSave,
        baseSize: baseSize,
      ),
    ];
  }

  /// Проверяет, использует ли юнит множественные профили
  bool get hasMultipleProfiles => modelProfiles != null && modelProfiles!.length > 1;

  /// Возвращает основной профиль (первый в списке или созданный из основных характеристик)
  ModelProfile get primaryProfile => effectiveProfiles.first;

  /// Находит профиль модели по имени
  ModelProfile? findProfileByName(String profileName) {
    try {
      return effectiveProfiles.firstWhere((profile) => profile.name == profileName);
    } catch (e) {
      return null;
    }
  }

  /// Находит опцию состава по ID
  UnitCompositionOption? findCompositionById(String compositionId) {
    try {
      return unitComposition.firstWhere((comp) => comp.id == compositionId);
    } catch (e) {
      return null;
    }
  }

  /// Находит индекс опции состава по ID
  int findCompositionIndexById(String compositionId) {
    for (int i = 0; i < unitComposition.length; i++) {
      if (unitComposition[i].id == compositionId) {
        return i;
      }
    }
    return -1;
  }

  /// Проверяет, существует ли опция состава с данным ID
  bool hasCompositionId(String compositionId) {
    return unitComposition.any((comp) => comp.id == compositionId);
  }

  /// Возвращает первую доступную опцию состава (для использования по умолчанию)
  UnitCompositionOption? get defaultComposition {
    return unitComposition.isNotEmpty ? unitComposition.first : null;
  }

  /// Получить читаемые названия core-способностей с параметрами
  List<String> get readableCoreAbilities {
    return coreAbilities.map((ability) =>
        CoreAbilityConverter.toReadable(ability, coreRuleDetails?[ability])
    ).toList();
  }

  Unit copyWith({
    String? id,
    String? name,
    String? move,
    String? toughness,
    String? save,
    String? wounds,
    String? leadership,
    String? objectiveControl,
    String? invulnerableSave,
    List<Weapon>? rangedWeapons,
    List<Weapon>? meleeWeapons,
    List<String>? abilities,
    List<Object>? leader,
    String? leaderDescription,
    List<UnitCompositionOption>? unitComposition,
    String? unitCompositionDescription,
    List<Object>? keywords,
    List<FactionKeyword>? factionKeywords,
    List<CoreAbility>? coreAbilities,
    Map<CoreAbility, Map<String, dynamic>>? coreRuleDetails,
    List<ArmyRule>? factionAbilities,
    String? wargearAbilities,
    String? wargearOptions,
    Map<String, String>? damaged,
    String? specialName,
    String? specialText,
    String? baseSize,
    List<ModelProfile>? modelProfiles,
    String? transport,
    List<dynamic>? commander, // 🔸 ADD THIS LINE
  }) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
      move: move ?? this.move,
      toughness: toughness ?? this.toughness,
      save: save ?? this.save,
      wounds: wounds ?? this.wounds,
      leadership: leadership ?? this.leadership,
      objectiveControl: objectiveControl ?? this.objectiveControl,
      invulnerableSave: invulnerableSave ?? this.invulnerableSave,
      rangedWeapons: rangedWeapons ?? this.rangedWeapons,
      meleeWeapons: meleeWeapons ?? this.meleeWeapons,
      abilities: abilities ?? this.abilities,
      leader: leader ?? this.leader,
      leaderDescription: leaderDescription ?? this.leaderDescription,
      unitComposition: unitComposition ?? this.unitComposition,
      unitCompositionDescription: unitCompositionDescription ?? this.unitCompositionDescription,
      keywords: keywords ?? this.keywords,
      factionKeywords: factionKeywords ?? this.factionKeywords,
      coreAbilities: coreAbilities ?? this.coreAbilities,
      coreRuleDetails: coreRuleDetails ?? this.coreRuleDetails,
      factionAbilities: factionAbilities ?? this.factionAbilities,
      wargearAbilities: wargearAbilities ?? this.wargearAbilities,
      wargearOptions: wargearOptions ?? this.wargearOptions,
      damaged: damaged ?? this.damaged,
      specialName: specialName ?? this.specialName,
      specialText: specialText ?? this.specialText,
      baseSize: baseSize ?? this.baseSize,
      modelProfiles: modelProfiles ?? this.modelProfiles,
      transport: transport ?? this.transport,
      commander: commander ?? this.commander, // 🔸 ADD THIS LINE
    );
  }

  @override
  String toString() {
    return 'Unit(name: $name, move: $move, toughness: $toughness, save: $save, wounds: $wounds)';
  }
}