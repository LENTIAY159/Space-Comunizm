// ─────────────────────────────────────────────
// 🧬 CORE СПОСОБНОСТИ
// ─────────────────────────────────────────────
enum CoreAbility {
  deepStrike,
  scouts,
  infiltrators,
  loneOperative,
  stealth,
  deadlyDemise,
  feelNoPain,
  fightsFirst,
  leader,
  towering, firingDeck,
}

class CoreAbilityData {
  final CoreAbility id;
  final String name;
  final String description;

  const CoreAbilityData({
    required this.id,
    required this.name,
    required this.description,
  });
}


const List<CoreAbilityData> coreAbilitiesList = [
  CoreAbilityData(
    id: CoreAbility.deepStrike,
    name: 'Deep Strike',
    description: 'Во время шага Declare Battle Formations вы можете разместить этот юнит в Reserves вместо того, чтобы поместить его на поле боя. Если вы так сделали, то во время шага Reinforcements одной из ваших Movement фаз вы можете разместить этот юнит в любом месте на поле боя, находящемся более чем в 9" по горизонтали от всех вражеских моделей.',
  ),
  CoreAbilityData(
    id: CoreAbility.infiltrators,
    name: 'Infiltrators',
    description: 'Во время размещения, если каждая модель в этом юните имеет эту способность, при выставлении юнита вы можете разместить его в любом месте на поле боя, находящемся более чем в 9" по горизонтали от зоны размещения противника и всех вражеских моделей.',
  ),
  CoreAbilityData(
    id: CoreAbility.loneOperative,
    name: 'Lone Operative',
    description: 'Если юнит не является частью Attached юнита (см. Leader в разделе Deployment Abilities), он может быть выбран целью для дальней атаки только если атакующая модель находится в пределах 12".',
  ),
  CoreAbilityData(
    id: CoreAbility.stealth,
    name: 'Stealth',
    description: 'Если каждая модель в юните имеет эту способность, каждый раз, когда по нему совершается дальняя атака, вычитайте 1 из броска попадания этой атаки.',
  ),
  CoreAbilityData(
    id: CoreAbility.fightsFirst,
    name: 'Fights First',
    description: 'Юниты с этой способностью, которые могут сражаться, делают это на шаге Fights First, при условии что каждая модель в юните имеет эту способность.',
  ),
  CoreAbilityData(
    id: CoreAbility.leader,
    name: 'Leader',
    description: 'Во время шага Declare Battle Formations, для каждого Leader в вашей армии, если ваша армия также включает один или более Bodyguard юнитов этого Leader, вы можете выбрать один из этих Bodyguard юнитов. Этот Leader присоединяется к этому Bodyguard юниту на всё сражение и считается ведущим его. Каждый Bodyguard юнит может иметь только одного Leader.'
        'Пока Bodyguard юнит содержит Leader, он считается Attached юнитом и, за исключением правил, срабатывающих при уничтожении юнитов, рассматривается как один юнит для всех правил. Каждый раз, когда атака нацелена на Attached юнит, пока атакующий юнит не завершит все свои атаки, вы должны использовать характеристику Toughness моделей Bodyguard в этом юните, даже если Leader в этом юните имеет другую характеристику Toughness. Каждая успешная рана, нанесённая Attached юниту, не может быть распределена на CHARACTER модель в этом юните, даже если у этой CHARACTER модели потеряно одно или более ран или на неё уже были распределены атаки в этой фазе. Как только последняя модель Bodyguard в Attached юните уничтожена, все ещё не распределённые атаки могут быть распределены на CHARACTER моделей в этом юните.'
        'Когда последняя модель в Bodyguard юните уничтожена, каждый CHARACTER юнит, входивший в этот Attached юнит, перестаёт быть его частью. Он становится отдельным юнитом с изначальной Starting Strength. Если это произошло в результате атаки, они становятся отдельными юнитами после того, как атакующий юнит завершил все свои атаки.'
        'Когда последняя модель CHARACTER юнита, присоединённого к Bodyguard юниту, уничтожена и нет другого CHARACTER юнита, Attached юнит Bodyguard перестаёт быть Attached. Он становится отдельным юнитом с изначальной Starting Strength. Если это произошло в результате атаки, они становятся отдельными юнитами после того, как атакующий юнит завершил все свои атаки. Каждый раз, когда юнит, являющийся частью Attached юнита, уничтожен, он не имеет Keywords других юнитов, составляющих этот Attached юнит (если только он сам не имеет их на своём datasheet) для целей любых правил, срабатывающих при уничтожении юнита.',
  ),
  CoreAbilityData(
    id: CoreAbility.towering,
    name: 'Towering',
    description: 'Модели с этой способностью видимы и могут быть выбраны целью атак даже за элементами ландшафта, которые обычно блокируют линию видимости, если только атакующий также не находится в пределах элемента ландшафта или в пределах 6".',
  ),
];



// ─────────────────────────────────────────────
// 📐 ОПРЕДЕЛЕНИЯ ПРАВИЛ С ПАРАМЕТРАМИ
// ─────────────────────────────────────────────

class RuleDefinition {
  final String title;
  final String displayTemplate;
  final String description;
  final List<String> requiredParams;

  const RuleDefinition({
    required this.title,
    required this.displayTemplate,
    required this.description,
    required this.requiredParams,
  });
}

// ─────────────────────────────────────────────
// 🧬 CORE ABILITIES WITH PARAMETERS
// ─────────────────────────────────────────────


final Map<CoreAbility, RuleDefinition> coreAbilityMeta = {
  CoreAbility.deadlyDemise: RuleDefinition(
    title: 'Deadly Demise',
    displayTemplate: 'Deadly Demise \$value',
    description: 'Некоторые модели имеют способность Deadly Demise "X" в списке своих способностей. Когда такая модель уничтожается, бросьте один D6 перед тем, как убрать её с поля боя (если эта модель является TRANSPORT, бросок выполняется до того, как высадятся модели внутри). При результате 6 каждый юнит в пределах 6" от этой модели получает количество mortal wounds, указанное как "X" (если это случайное число, бросайте отдельно для каждого юнита в пределах 6").',
    requiredParams: ['value'],
  ),
  CoreAbility.feelNoPain: RuleDefinition(
    title: 'Feel No Pain',
    displayTemplate: 'Feel No Pain \$value',
    description: 'Каждый раз, когда эта модель должна потерять рану, бросьте один DX: если результат равен или больше указанного значения, эта рана не теряется.',
    requiredParams: ['value'],
  ),
  CoreAbility.scouts: RuleDefinition(
    title: 'Scouts',
    displayTemplate: 'Scouts \$value',
    description: 'Некоторые юниты имеют способность Scouts. Если каждая модель в юните имеет эту способность, то в начале первого раунда, перед тем как начнётся первый ход, этот юнит может сделать Normal move на расстояние в дюймах, указанное в скобках после названия способности, как если бы это была ваша Movement phase. Движение должно завершиться на расстоянии более чем 9" по горизонтали от всех вражеских моделей.',
    requiredParams: ['value'],
  ),
  CoreAbility.firingDeck: RuleDefinition(
    title: 'Firing Deck',
    displayTemplate: 'Firing Deck \$value',
    description: 'Некоторые TRANSPORT модели имеют способность Firing Deck "X" в списке своих способностей. Каждый раз, когда такая модель выбирается для стрельбы в Shooting phase, вы можете выбрать до "X" моделей, находящихся внутри неё, чьи юниты ещё не стреляли в этой фазе. Затем для каждой из выбранных моделей вы можете выбрать одно дальнобойное оружие, которым она оснащена (кроме оружия со способностью [ONE SHOT]). До тех пор, пока эта TRANSPORT модель не завершит все свои атаки, она считается оснащённой всеми выбранными таким образом видами оружия в дополнение к своему остальному вооружению. До конца фазы выбранные юниты моделей не могут стрелять.',
    requiredParams: ['value'],
  ),
};



// ─────────────────────────────────────────────
// 🔫 СПЕЦИАЛЬНЫЕ ПРАВИЛА ОРУЖИЯ (ПОЛНЫЕ ОПИСАНИЯ)
// ─────────────────────────────────────────────

enum WeaponAbility {
  rapidFire,
  sustainedHits,
  melta,
  anti,
  hazardous,
  ignoresCover,
  torrent,
  devastatingWounds,
  lethalHits,
  twinLinked,
  indirectFire,
  oneShot,
  pistol,
  heavy,
  assault,
  precision,
  blast,
  extraAttacks,
  lance,
  psychic,
}

// ─────────────────────────────────────────────
// 🔑 СИСТЕМА КЛЮЧЕЙ ДЛЯ ПРАВИЛ С УНИКАЛЬНЫМИ ID
// ─────────────────────────────────────────────

/// Базовый класс для ключей правил оружия
abstract class WeaponAbilityKey {
  WeaponAbility get ability;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeaponAbilityKey &&
        other.runtimeType == runtimeType &&
        other.ability == ability;
  }

  @override
  int get hashCode => Object.hash(runtimeType, ability);
}

/// Обычный ключ для простых случаев (один экземпляр правила)
class SimpleWeaponAbilityKey extends WeaponAbilityKey {
  @override
  final WeaponAbility ability;

  SimpleWeaponAbilityKey(this.ability);

  @override
  String toString() => ability.toString();
}

/// Ключ с уникальным ID для случаев множественного использования
class UniqueWeaponAbilityKey extends WeaponAbilityKey {
  @override
  final WeaponAbility ability;
  final String uniqueId;

  UniqueWeaponAbilityKey(this.ability, this.uniqueId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UniqueWeaponAbilityKey &&
        other.ability == ability &&
        other.uniqueId == uniqueId;
  }

  @override
  int get hashCode => Object.hash(ability, uniqueId);

  @override
  String toString() => '${ability}_$uniqueId';
}

/// Фабрика для создания ключей правил оружия
class WeaponAbilityKeys {
  /// Создать ключ с уникальным ID для множественного использования
  static UniqueWeaponAbilityKey createWithId(WeaponAbility ability, String id) {
    return UniqueWeaponAbilityKey(ability, id);
  }

  /// Создать простой ключ для единичного использования
  static SimpleWeaponAbilityKey create(WeaponAbility ability) {
    return SimpleWeaponAbilityKey(ability);
  }
}

// Расширение для enum WeaponAbility для совместимости
extension WeaponAbilityExtension on WeaponAbility {
  /// Неявное преобразование enum в SimpleWeaponAbilityKey
  SimpleWeaponAbilityKey get key => SimpleWeaponAbilityKey(this);
}

class WeaponAbilityData {
  final WeaponAbility id;
  final String name;
  final String description;

  const WeaponAbilityData({
    required this.id,
    required this.name,
    required this.description,
  });
}


final Map<WeaponAbility, RuleDefinition> weaponAbilityMeta = {
  WeaponAbility.rapidFire: RuleDefinition(
    title: 'Rapid Fire',
    displayTemplate: 'Rapid Fire \$value',
    description: 'Оружие с [RAPID FIRE X] в своём профиле называется Rapid Fire оружием. Каждый раз, когда такое оружие стреляет по юниту в пределах половины своей дальности, характеристика Attacks этого оружия увеличивается на значение "X".',
    requiredParams: ['value'],
  ),
  WeaponAbility.sustainedHits: RuleDefinition(
    title: 'Sustained Hits',
    displayTemplate: 'Sustained Hits \$value',
    description: 'Оружие с [SUSTAINED HITS X] в своём профиле называется Sustained Hits оружием. Каждый раз, когда выполняется атака таким оружием и выпадает Critical Hit, эта атака наносит дополнительное количество попаданий по цели, указанное как "X".',
    requiredParams: ['value'],
  ),
  WeaponAbility.melta: RuleDefinition(
    title: 'Melta',
    displayTemplate: 'Melta \$value',
    description: 'Оружие с [MELTA X] в своём профиле называется Melta оружием. Каждый раз, когда атака таким оружием направлена на юнит в пределах половины дальности этого оружия, характеристика Damage этой атаки увеличивается на значение "X".',
    requiredParams: ['value'],
  ),
  WeaponAbility.anti: RuleDefinition(
    title: 'Anti',
    displayTemplate: 'Anti-\$type \$value',
    description: 'Оружие с [ANTI-KEYWORD X+] в своём профиле называется Anti оружием. Каждый раз, когда атака таким оружием производится против цели с ключевым словом, указанным после слова "Anti-", неизменённый результат "X+" на броске Wound засчитывается как Critical Wound.',
    requiredParams: ['type', 'value'],
  ),
};




const List<WeaponAbilityData> weaponAbilitiesList = [
  WeaponAbilityData(
    id: WeaponAbility.hazardous,
    name: 'Hazardous',
    description: 'Оружие с [HAZARDOUS] в своём профиле называется Hazardous оружием. Каждый раз, когда юнит выбирается для стрельбы или ближнего боя, после того как он завершил все свои атаки, за каждое Hazardous оружие, для которого были выбраны цели при этих атаках, юнит должен пройти один Hazardous тест. Для этого бросьте один D6: при результате 1 тест провален. За каждый проваленный тест выполните следующую последовательность (каждый проваленный тест обрабатывается отдельно): если возможно, выберите одну модель в юните, потерявшую одну или более ран и оснащённую одним или более Hazardous оружием. В противном случае выберите одну модель в юните (кроме CHARACTER моделей), оснащённую одним или более Hazardous оружием. Если это невозможно, выберите одну CHARACTER модель в юните с одним или более Hazardous оружием. Если модель выбрана, юнит получает 3 mortal wounds, которые должны быть распределены на выбранную модель.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.ignoresCover,
    name: 'Ignores Cover',
    description: 'Оружие с [IGNORES COVER] в своём профиле называется Ignores Cover оружием. Каждая атака таким оружием не позволяет цели получать Benefit of Cover против этой атаки.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.torrent,
    name: 'Torrent',
    description: 'Оружие с [TORRENT] в своём профиле называется Torrent оружием. Каждая атака таким оружием автоматически попадает в цель.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.devastatingWounds,
    name: 'Devastating Wounds',
    description: 'Оружие с [DEVASTATING WOUNDS] в своём профиле называется Devastating Wounds оружием. Если атака таким оружием наносит Critical Wound, против неё нельзя совершать никакие спасброски (включая invulnerable). Такие атаки распределяются на модели только после того, как все остальные атаки атакующего юнита были распределены и разрешены. После распределения и применения модификаторов цель получает количество mortal wounds, равное характеристике Damage этой атаки, вместо обычного нанесения урона.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.lethalHits,
    name: 'Lethal Hits',
    description: 'Оружие с [LETHAL HITS] в своём профиле называется Lethal Hits оружием. Каждая атака таким оружием, получившая Critical Hit, автоматически ранит цель.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.twinLinked,
    name: 'Twin-linked',
    description: 'Оружие с [TWIN-LINKED] в своём профиле называется Twin-linked оружием. Каждая атака таким оружием позволяет перебросить бросок на Wound.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.indirectFire,
    name: 'Indirect Fire',
    description: 'Оружие с [INDIRECT FIRE] в своём профиле называется Indirect Fire оружием и может атаковать цели, даже если они не видны атакующей модели. Эти атаки могут уничтожить вражеские модели в юните цели, даже если ни одна из них не была видна при выборе цели. Если при выборе цели ни одна модель юнита цели не видна атакующему юниту, тогда каждая атака с Indirect Fire получает -1 к броску попадания, неизменённые результаты 1-3 всегда промахиваются, а цель получает Benefit of Cover против этой атаки.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.oneShot,
    name: 'One Shot',
    description: 'Оружие можно использовать для стрельбы только один раз за сражение.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.pistol,
    name: 'Pistol',
    description: 'Оружие с [PISTOL] в своём профиле называется Pistol. Если юнит содержит любую модель с Pistol, он может стрелять в свою Shooting phase, даже находясь в Engagement Range с одним или более вражескими юнитами. В этом случае он может использовать только Pistols и выбрать целью только один вражеский юнит в Engagement Range. Pistol может стрелять по врагу, даже если другие дружественные юниты также находятся в Engagement Range с той же целью. Если модель оснащена одним или более Pistols (и не является MONSTER или VEHICLE), она должна выбрать: стрелять из Pistols или из других дальнобойных оружий. Объявите выбор до выбора целей.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.heavy,
    name: 'Heavy',
    description: 'Оружие с [HEAVY] в своём профиле называется Heavy оружием. Если юнит с таким оружием в этот ход Remained Stationary, атаки получают +1 к броску попадания.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.assault,
    name: 'Assault',
    description: 'Оружие с [ASSAULT] в своём профиле называется Assault оружием. Если юнит с таким оружием сделал Advance в этот ход, он всё ещё может стрелять в Shooting phase, но только из Assault оружий, которыми оснащён.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.precision,
    name: 'Precision',
    description: 'Оружие с [PRECISION] в своём профиле называется Precision оружием. Каждая успешная атака таким оружием по Attached юниту может быть распределена на CHARACTER модель, видимую атакующей модели, вместо обычного распределения атак.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.blast,
    name: 'Blast',
    description: 'Оружие с [BLAST] в своём профиле называется Blast оружием. Если цель состоит из 6 или более моделей, характеристика Attacks увеличивается на 1. Если моделей 11 или более, увеличивается на 2.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.extraAttacks,
    name: 'Extra Attacks',
    description: 'Оружие с [EXTRA ATTACKS] в своём профиле называется Extra Attacks оружием. Каждый раз, когда модель с одним или более такими оружиями сражается, она атакует каждым Extra Attacks оружием и одним оружием ближнего боя, не имеющим этой способности (если есть). Количество атак Extra Attacks оружием не может быть изменено другими правилами, если только в них прямо не указано название оружия.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.lance,
    name: 'Lance',
    description: 'Оружие с [LANCE] в своём профиле называется Lance оружием. Если владелец сделал Charge move в этот ход, он получает +1 к броску на Wound при атаке этим оружием.',
  ),
  WeaponAbilityData(
    id: WeaponAbility.psychic,
    name: 'Psychic',
    description: 'Если Psyhic оружие или способность наносит юниту одну или более ран, каждая из этих ран считается нанесённой Psyhic атакой.',
  ),
];




// ─────────────────────────────────────────────
// 🛠 УТИЛИТЫ ДЛЯ ПРАВИЛ ОРУЖИЯ
// ─────────────────────────────────────────────

class WeaponAbilityConverter {
  static String toReadable(WeaponAbilityKey abilityKey, [Map<String, dynamic>? details]) {
    final ability = abilityKey.ability;

    // Сначала проверяем, есть ли для этой способности параметризованное определение
    if (weaponAbilityMeta.containsKey(ability)) {
      final def = weaponAbilityMeta[ability]!;
      String result = def.displayTemplate;

      // Заменяем параметры в шаблоне
      result = result.replaceAllMapped(RegExp(r'\$(\w+)'), (match) {
        final key = match.group(1)!;
        return details?[key]?.toString() ?? '?';
      });

      return result;
    }

    // Если нет параметров, ищем в обычных способностях
    final data = weaponAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Weapon ability not found: $ability'),
    );
    return data.name;
  }

  static String getDescription(WeaponAbilityKey abilityKey, [Map<String, dynamic>? details]) {
    final ability = abilityKey.ability;

    // Сначала проверяем параметризованные правила
    if (weaponAbilityMeta.containsKey(ability)) {
      final def = weaponAbilityMeta[ability]!;
      String result = def.description;

      // Заменяем параметры в описании
      result = result.replaceAllMapped(RegExp(r'\$(\w+)'), (match) {
        final key = match.group(1)!;
        return details?[key]?.toString() ?? '?';
      });

      return result;
    }

    // Ищем в обычных способностях
    final data = weaponAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Weapon ability not found: $ability'),
    );
    return data.description;
  }

  static WeaponAbilityData getData(WeaponAbility ability) {
    return weaponAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Weapon ability not found: $ability'),
    );
  }
}

// ─────────────────────────────────────────────
// 🛠 УТИЛИТЫ ДЛЯ CORE ABILITIES
// ─────────────────────────────────────────────

class CoreAbilityConverter {
  static String toReadable(CoreAbility ability, [Map<String, dynamic>? details]) {
    // Сначала проверяем параметризованные правила
    if (coreAbilityMeta.containsKey(ability)) {
      final def = coreAbilityMeta[ability]!;
      String result = def.displayTemplate;

      // Заменяем параметры в шаблоне
      result = result.replaceAllMapped(RegExp(r'\$(\w+)'), (match) {
        final key = match.group(1)!;
        return details?[key]?.toString() ?? '?';
      });

      return result;
    }

    // Ищем в обычных способностях
    final data = coreAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Core ability not found: $ability'),
    );
    return data.name;
  }

  static String getDescription(CoreAbility ability, [Map<String, dynamic>? details]) {
    // Сначала проверяем параметризованные правила
    if (coreAbilityMeta.containsKey(ability)) {
      final def = coreAbilityMeta[ability]!;
      String result = def.description;

      // Заменяем параметры в описании
      result = result.replaceAllMapped(RegExp(r'\$(\w+)'), (match) {
        final key = match.group(1)!;
        return details?[key]?.toString() ?? '?';
      });

      return result;
    }

    // Ищем в обычных способностях
    final data = coreAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Core ability not found: $ability'),
    );
    return data.description;
  }

  static CoreAbilityData getData(CoreAbility ability) {
    return coreAbilitiesList.firstWhere(
          (item) => item.id == ability,
      orElse: () => throw Exception('Core ability not found: $ability'),
    );
  }
}