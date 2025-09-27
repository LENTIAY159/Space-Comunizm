import '../z_unit_models/unit_model.dart';
import '../z_unit_models/selected_unit_model.dart';
import '../z_unit_models/keyword_list.dart';
import 'restriction_model.dart';

/// Движок для проверки ограничений при добавлении юнитов
class RestrictionEngine {
  final List<Restriction> restrictions;
  final List<SelectedUnit> selectedUnits;

  RestrictionEngine(this.restrictions, this.selectedUnits);

  /// Проверяет, можно ли отображать юнит в списке доступных
  bool canDisplay(Unit unit) {
    for (final restriction in restrictions) {
      if (restriction.type == RestrictionType.unitBan) {
        if (restriction.unitNames.contains(unit.name)) {
          return false;
        }
      }

      if (restriction.type == RestrictionType.keywordBan) {
        for (final keyword in restriction.keywords) {
          if (unit.keywords.contains(keyword)) {
            return false;
          }
        }

        for (final factionKeyword in restriction.factionKeywords) {
          if (unit.factionKeywords.contains(factionKeyword)) {
            return false;
          }
        }
      }

      if (restriction.type == RestrictionType.exclusiveKeywordBan) {
        if (_hasExactKeywords(unit, restriction)) {
          return false;
        }
      }
    }

    return true;
  }

  /// Проверяет, можно ли добавить юнит в армию
  bool canAdd(Unit unit) {
    print('🔍 DEBUG: Checking if can add unit: ${unit.name}');
    print('🔍 DEBUG: Unit keywords: ${unit.keywords}');
    print('🔍 DEBUG: Unit faction keywords: ${unit.factionKeywords}');
    print('🔍 DEBUG: Total restrictions: ${restrictions.length}');
    print('🔍 DEBUG: Selected units count: ${selectedUnits.length}');

    if (!canDisplay(unit)) {
      print('❌ DEBUG: Unit cannot be displayed');
      return false;
    }

    for (int i = 0; i < restrictions.length; i++) {
      final restriction = restrictions[i];
      print('🔍 DEBUG: Checking restriction $i: ${restriction.type} - ${restriction.description}');

      if (restriction.type == RestrictionType.unitLimit) {
        if (restriction.unitNames.contains(unit.name)) {
          final currentCount = _countUnitsByName(unit.name);
          final maxCount = restriction.maxCount ?? 0;
          print('🔍 DEBUG: Unit limit check - current: $currentCount, max: $maxCount');
          if (currentCount + 1 > maxCount) {
            print('❌ DEBUG: Unit limit would be exceeded (${currentCount + 1} > $maxCount)');
            return false;
          }
        }
      }

      if (restriction.type == RestrictionType.keywordLimit) {
        print('🔍 DEBUG: Keyword limit restriction found');
        print('🔍 DEBUG: Restriction keywords: ${restriction.keywords}');
        print('🔍 DEBUG: Restriction faction keywords: ${restriction.factionKeywords}');
        print('🔍 DEBUG: Max count: ${restriction.maxCount}');

        if (_hasAnyKeyword(unit, restriction)) {
          print('✅ DEBUG: Unit has matching keyword, checking count');
          final currentCount = _countUnitsByKeywords(restriction);
          final maxCount = restriction.maxCount ?? 0;
          print('🔍 DEBUG: Current keyword count: $currentCount, max allowed: $maxCount');
          if (currentCount + 1 > maxCount) {
            print('❌ DEBUG: Keyword limit would be exceeded (${currentCount + 1} > $maxCount)');
            return false;
          } else {
            print('✅ DEBUG: Keyword limit OK, can add (${currentCount + 1} <= $maxCount)');
          }
        } else {
          print('ℹ️ DEBUG: Unit does not have matching keyword for this restriction');
        }
      }
    }

    print('✅ DEBUG: All checks passed, can add unit');
    return true;
  }

  /// Возвращает причину, по которой юнит нельзя добавить
  String? getRestrictionReason(Unit unit) {
    if (canAdd(unit)) {
      return null;
    }

    for (final restriction in restrictions) {
      if (restriction.type == RestrictionType.unitBan) {
        if (restriction.unitNames.contains(unit.name)) {
          return 'Unit is banned: ${restriction.description}';
        }
      }

      if (restriction.type == RestrictionType.keywordBan) {
        for (final keyword in restriction.keywords) {
          if (unit.keywords.contains(keyword)) {
            return 'Keyword banned: ${restriction.description}';
          }
        }

        for (final factionKeyword in restriction.factionKeywords) {
          if (unit.factionKeywords.contains(factionKeyword)) {
            return 'Faction keyword banned: ${restriction.description}';
          }
        }
      }

      if (restriction.type == RestrictionType.exclusiveKeywordBan) {
        if (_hasExactKeywords(unit, restriction)) {
          return 'Unit banned (exclusive keyword match): ${restriction.description}';
        }
      }

      if (restriction.type == RestrictionType.unitLimit) {
        if (restriction.unitNames.contains(unit.name)) {
          final currentCount = _countUnitsByName(unit.name);
          final maxCount = restriction.maxCount ?? 0;
          if (currentCount + 1 > maxCount) {
            return 'Unit limit would be exceeded: ${currentCount + 1}/$maxCount - ${restriction.description}';
          }
        }
      }

      if (restriction.type == RestrictionType.keywordLimit) {
        if (_hasAnyKeyword(unit, restriction)) {
          final currentCount = _countUnitsByKeywords(restriction);
          final maxCount = restriction.maxCount ?? 0;
          if (currentCount + 1 > maxCount) {
            final keywordNames = _getKeywordNames(restriction);
            return 'Keyword limit would be exceeded: ${currentCount + 1}/$maxCount for $keywordNames - ${restriction.description}';
          }
        }
      }
    }

    return 'Cannot add unit';
  }

  /// Проверяет, имеет ли юнит точно указанные ключевые слова (без дополнительных)
  bool _hasExactKeywords(Unit unit, Restriction restriction) {
    print('🔍 DEBUG: Checking exact keywords match...');

    // Собираем все требуемые ключевые слова
    final Set<Keyword> requiredKeywords = restriction.keywords.toSet();
    final Set<FactionKeyword> requiredFactionKeywords = restriction.factionKeywords.toSet();

    print('🔍 DEBUG: Required keywords: $requiredKeywords');
    print('🔍 DEBUG: Required faction keywords: $requiredFactionKeywords');
    print('🔍 DEBUG: Unit keywords: ${unit.keywords}');
    print('🔍 DEBUG: Unit faction keywords: ${unit.factionKeywords}');

    // Проверяем, что у юнита есть все требуемые ключевые слова
    bool hasAllKeywords = requiredKeywords.every((keyword) => unit.keywords.contains(keyword));
    bool hasAllFactionKeywords = requiredFactionKeywords.every((factionKeyword) => unit.factionKeywords.contains(factionKeyword));

    if (!hasAllKeywords || !hasAllFactionKeywords) {
      print('❌ DEBUG: Unit does not have all required keywords');
      return false;
    }

    // Проверяем, что у юнита нет дополнительных фракционных ключевых слов
    // (обычные ключевые слова не проверяем, так как их может быть много)
    final Set<FactionKeyword> unitFactionKeywords = unit.factionKeywords.toSet();
    final bool hasOnlyRequiredFactionKeywords = unitFactionKeywords.length == requiredFactionKeywords.length;

    print('🔍 DEBUG: Unit has only required faction keywords: $hasOnlyRequiredFactionKeywords');

    if (!hasOnlyRequiredFactionKeywords) {
      print('❌ DEBUG: Unit has additional faction keywords, not banned');
      return false;
    }

    print('✅ DEBUG: Unit has exact keyword match, should be banned');
    return true;
  }

  /// Подсчитывает количество выбранных юнитов с определенным именем
  int _countUnitsByName(String unitName) {
    final count = selectedUnits
        .where((selectedUnit) => selectedUnit.unit.name == unitName)
        .length;
    print('🔍 DEBUG: Count units by name "$unitName": $count');
    return count;
  }

  /// Подсчитывает количество выбранных юнитов с определенными ключевыми словами
  int _countUnitsByKeywords(Restriction restriction) {
    print('🔍 DEBUG: Starting keyword count...');
    int count = 0;

    for (int i = 0; i < selectedUnits.length; i++) {
      final selectedUnit = selectedUnits[i];
      final unit = selectedUnit.unit;

      print('🔍 DEBUG: Checking selected unit $i: ${unit.name}');
      print('🔍 DEBUG: Unit keywords: ${unit.keywords}');
      print('🔍 DEBUG: Unit faction keywords: ${unit.factionKeywords}');

      bool hasMatchingKeyword = false;

      for (final keyword in restriction.keywords) {
        print('🔍 DEBUG: Checking keyword: $keyword');
        if (unit.keywords.contains(keyword)) {
          print('✅ DEBUG: Found matching keyword: $keyword');
          hasMatchingKeyword = true;
          break;
        }
      }

      if (!hasMatchingKeyword) {
        for (final factionKeyword in restriction.factionKeywords) {
          print('🔍 DEBUG: Checking faction keyword: $factionKeyword');
          if (unit.factionKeywords.contains(factionKeyword)) {
            print('✅ DEBUG: Found matching faction keyword: $factionKeyword');
            hasMatchingKeyword = true;
            break;
          }
        }
      }

      if (hasMatchingKeyword) {
        count++;
        print('✅ DEBUG: Unit matches, count now: $count');
      } else {
        print('❌ DEBUG: Unit does not match');
      }
    }

    print('🔍 DEBUG: Final keyword count: $count');
    return count;
  }

  /// Проверяет, есть ли у юнита какие-либо из указанных ключевых слов
  bool _hasAnyKeyword(Unit unit, Restriction restriction) {
    print('🔍 DEBUG: Checking if unit has any keyword...');

    for (final keyword in restriction.keywords) {
      print('🔍 DEBUG: Checking keyword: $keyword in ${unit.keywords}');
      if (unit.keywords.contains(keyword)) {
        print('✅ DEBUG: Found matching keyword: $keyword');
        return true;
      }
    }

    for (final factionKeyword in restriction.factionKeywords) {
      print('🔍 DEBUG: Checking faction keyword: $factionKeyword in ${unit.factionKeywords}');
      if (unit.factionKeywords.contains(factionKeyword)) {
        print('✅ DEBUG: Found matching faction keyword: $factionKeyword');
        return true;
      }
    }

    print('❌ DEBUG: No matching keywords found');
    return false;
  }

  /// Вспомогательный метод для получения названий ключевых слов для сообщения об ошибке
  String _getKeywordNames(Restriction restriction) {
    final List<String> names = [];

    for (final keyword in restriction.keywords) {
      names.add(keyword.toString());
    }

    for (final factionKeyword in restriction.factionKeywords) {
      names.add(factionKeyword.toString());
    }

    return names.join(', ');
  }
}