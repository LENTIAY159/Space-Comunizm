import 'detachment_rule.dart';
import 'enhancement_model.dart';
import 'restriction_model.dart';
import 'stratagem_model.dart';

/// Модель данных для Detachment в Warhammer 40k (10-е издание)
class Detachment {
  /// Название детачмента
  final String name;

  /// Дополнительные правила для этого детачмента
  final List<AdditionalRule> additionalRules;

  /// Список улучшений, доступных в этом детачменте
  final List<Enhancement> enhancements;

  /// Список стратагем для этого детачмента
  final List<Stratagem> stratagems;

  /// Ограничения, определяющие, что нельзя использовать в этом детачменте
  final List<Restriction> restrictions;

  /// Конструктор для Detachment
  Detachment({
    required this.name,
    List<AdditionalRule>? additionalRules,
    List<Enhancement>? enhancements,
    List<Stratagem>? stratagems,
    List<Restriction>? restrictions,
  })  : additionalRules = additionalRules ?? [],
        enhancements = enhancements ?? [],
        stratagems = stratagems ?? [],
        restrictions = restrictions ?? []; // Защита от null
}