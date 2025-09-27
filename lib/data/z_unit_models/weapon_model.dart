import 'core_abilities.dart';

class WeaponProfile {
  final String? name; // null если у оружия только один профиль
  final String range;
  final String attacks;
  final String hit; // BS/WS
  final String strength;
  final String ap;
  final String damage;
  final List<dynamic> specialRules; // Может содержать WeaponAbility или WeaponAbilityKey

  /// Параметры для специальных правил (Anti-X X+, Melta X, и т.п.)
  final Map<dynamic, Map<String, dynamic>>? specialRuleDetails; // Ключи могут быть WeaponAbility или WeaponAbilityKey

  const WeaponProfile({
    this.name,
    required this.range,
    required this.attacks,
    required this.hit,
    required this.strength,
    required this.ap,
    required this.damage,
    this.specialRules = const [],
    this.specialRuleDetails,
  });

  WeaponProfile copyWith({
    String? name,
    String? range,
    String? attacks,
    String? hit,
    String? strength,
    String? ap,
    String? damage,
    List<dynamic>? specialRules,
    Map<dynamic, Map<String, dynamic>>? specialRuleDetails,
  }) {
    return WeaponProfile(
      name: name ?? this.name,
      range: range ?? this.range,
      attacks: attacks ?? this.attacks,
      hit: hit ?? this.hit,
      strength: strength ?? this.strength,
      ap: ap ?? this.ap,
      damage: damage ?? this.damage,
      specialRules: specialRules ?? this.specialRules,
      specialRuleDetails: specialRuleDetails ?? this.specialRuleDetails,
    );
  }

  /// Преобразовать элемент специального правила в WeaponAbilityKey
  WeaponAbilityKey _toWeaponAbilityKey(dynamic rule) {
    if (rule is WeaponAbilityKey) {
      return rule;
    } else if (rule is WeaponAbility) {
      return rule.key; // Используем расширение для автоматического преобразования
    } else {
      throw ArgumentError('Invalid rule type: ${rule.runtimeType}. Expected WeaponAbility or WeaponAbilityKey');
    }
  }

  // Получить читаемые названия правил с параметрами
  List<String> get readableSpecialRules {
    return specialRules.map((rule) {
      final abilityKey = _toWeaponAbilityKey(rule);
      return WeaponAbilityConverter.toReadable(abilityKey, specialRuleDetails?[rule]);
    }).toList();
  }

  @override
  String toString() {
    final profileName = name != null ? ' ($name)' : '';
    final rules = specialRules.isNotEmpty
        ? ' [${readableSpecialRules.join(', ')}]'
        : '';
    return '$range, $attacks, $hit, $strength, $ap, $damage$rules$profileName';
  }
}

class Weapon {
  final String name;
  final List<WeaponProfile> profiles;

  const Weapon({
    required this.name,
    required this.profiles,
  });

  /// Получить профиль по имени (если name == null, то берёт первый профиль)
  WeaponProfile? getProfile([String? profileName]) {
    if (profileName == null) {
      return profiles.isNotEmpty ? profiles.first : null;
    }

    try {
      return profiles.firstWhere((profile) => profile.name == profileName);
    } catch (e) {
      return profiles.isNotEmpty ? profiles.first : null;
    }
  }

  /// Создание новой копии оружия с возможностью заменить имя или профили
  Weapon copyWith({
    String? name,
    List<WeaponProfile>? profiles,
  }) {
    return Weapon(
      name: name ?? this.name,
      profiles: profiles ?? this.profiles,
    );
  }

  /// Создание копии оружия с модификацией конкретного профиля
  Weapon copyWithModifiedProfile({
    String? profileName, // null для единственного профиля
    String? range,
    String? attacks,
    String? hit,
    String? strength,
    String? ap,
    String? damage,
    List<dynamic>? specialRules,
    Map<dynamic, Map<String, dynamic>>? specialRuleDetails,
  }) {
    final newProfiles = profiles.map((profile) {
      // Если profileName не указан и это единственный профиль, или имена совпадают
      if ((profileName == null && profiles.length == 1) ||
          profile.name == profileName) {
        return profile.copyWith(
          range: range,
          attacks: attacks,
          hit: hit,
          strength: strength,
          ap: ap,
          damage: damage,
          specialRules: specialRules,
          specialRuleDetails: specialRuleDetails,
        );
      }
      return profile;
    }).toList();

    return Weapon(
      name: name,
      profiles: newProfiles,
    );
  }

  /// Создание копии оружия с модификацией ВСЕХ профилей
  Weapon copyWithModifiedAllProfiles({
    String? range,
    String? attacks,
    String? hit,
    String? strength,
    String? ap,
    String? damage,
    List<dynamic>? specialRules,
    Map<dynamic, Map<String, dynamic>>? specialRuleDetails,
  }) {
    final newProfiles = profiles.map((profile) {
      return profile.copyWith(
        range: range ?? profile.range,
        attacks: attacks ?? profile.attacks,
        hit: hit ?? profile.hit,
        strength: strength ?? profile.strength,
        ap: ap ?? profile.ap,
        damage: damage ?? profile.damage,
        specialRules: specialRules ?? profile.specialRules,
        specialRuleDetails: specialRuleDetails ?? profile.specialRuleDetails,
      );
    }).toList();

    return Weapon(
      name: name,
      profiles: newProfiles,
    );
  }

  @override
  String toString() {
    if (profiles.length == 1 && profiles.first.name == null) {
      // Если у оружия один профиль без имени
      return '$name (${profiles.first})';
    } else {
      // Если у оружия несколько профилей с именами
      final profilesStr = profiles.map((p) => '${p.name}: $p').join('; ');
      return '$name [$profilesStr]';
    }
  }
}