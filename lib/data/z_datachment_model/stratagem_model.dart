enum StratagemCategory {
  command,
  move,
  shooting,
  charge,
  fight,
}

class Stratagem {
  final List<StratagemCategory> categories;
  final String name;
  final int cpCost;
  final String? when;
  final String? target;
  final String? effect;
  final String? restrictions;

  Stratagem({
    required this.name,
    required this.cpCost,
    this.when,
    this.target,
    this.effect,
    this.restrictions,
    required this.categories,
  }) : assert(categories.isNotEmpty, "Categories list cannot be empty");
}

extension StratagemCategoriesExtension on List<StratagemCategory> {
  String get displayName {
    return map((category) {
      switch (category) {
        case StratagemCategory.command:
          return 'Command Phase';
        case StratagemCategory.move:
          return 'Move Phase';
        case StratagemCategory.shooting:
          return 'Shooting Phase';
        case StratagemCategory.charge:
          return 'Charge Phase';
        case StratagemCategory.fight:
          return 'Fight Phase';
      }
    }).join(', ');
  }

  bool get isUniversal {
    return length == StratagemCategory.values.length;
  }
}