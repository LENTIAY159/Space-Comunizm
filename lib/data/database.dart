import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
part 'database.g.dart';


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = Platform.isAndroid
        ? (await getExternalStorageDirectory()) ?? await getApplicationDocumentsDirectory()
        : await getApplicationDocumentsDirectory();

    final appDir = Directory(p.join(dir.path, 'files'));
    if (!await appDir.exists()) {
      await appDir.create(recursive: true);
    }

    final file = File(p.join(appDir.path, 'warhammer.db'));
    return NativeDatabase(file);
  });
}

// ─────────────────────────────────────────────────────────────
// Фракции (например, Space Marines, Tyranids)
// ─────────────────────────────────────────────────────────────
class Factions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get description => text().nullable()();
}

// ─────────────────────────────────────────────────────────────
// Юниты (юнит принадлежит фракции)
// ─────────────────────────────────────────────────────────────
class Units extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get factionId => integer().references(Factions, #id)();

  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get unitComposition => text()();

  TextColumn get move => text()();
  TextColumn get toughness => text()();
  TextColumn get save => text()();
  TextColumn get invulnerableSave => text().nullable()();
  TextColumn get wounds => text()();
  TextColumn get leadership => text()();
  TextColumn get objectiveCost => text()();
}

// ─────────────────────────────────────────────────────────────
// Оружие
// ─────────────────────────────────────────────────────────────
class Weapons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get weaponType => text()();

  TextColumn get range => text()();
  TextColumn get attacks => text()();
  TextColumn get ballisticSkill => text()();
  TextColumn get strength => text()();
  TextColumn get armorPen => text()();
  TextColumn get damage => text()();
  TextColumn get specialRules => text().nullable()();
}

// ─────────────────────────────────────────────────────────────
// Способности (Abilities)
// ─────────────────────────────────────────────────────────────
class Abilities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get description => text()();
}

// ─────────────────────────────────────────────────────────────
// Ключевые слова (Keywords)
// ─────────────────────────────────────────────────────────────
class Keywords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

// ─────────────────────────────────────────────────────────────
// Юнит ↔ Оружие
// ─────────────────────────────────────────────────────────────
class UnitWeapons extends Table {
  IntColumn get unitId => integer().references(Units, #id)();
  IntColumn get weaponId => integer().references(Weapons, #id)();

  @override
  Set<Column<Object>> get primaryKey => {unitId, weaponId};
}

// ─────────────────────────────────────────────────────────────
// Юнит ↔ Способности
// ─────────────────────────────────────────────────────────────
class UnitAbilities extends Table {
  IntColumn get unitId => integer().references(Units, #id)();
  IntColumn get abilityId => integer().references(Abilities, #id)();

  @override
  Set<Column<Object>> get primaryKey => {unitId, abilityId};
}

// ─────────────────────────────────────────────────────────────
// Юнит ↔ Ключевые слова
// ─────────────────────────────────────────────────────────────
class UnitKeywords extends Table {
  IntColumn get unitId => integer().references(Units, #id)();
  IntColumn get keywordId => integer().references(Keywords, #id)();

  @override
  Set<Column<Object>> get primaryKey => {unitId, keywordId};
}

// ─────────────────────────────────────────────────────────────
// Основной класс базы данных
// ─────────────────────────────────────────────────────────────
@DriftDatabase(tables: [
  Factions,
  Units,
  Weapons,
  Abilities,
  Keywords,
  UnitWeapons,
  UnitAbilities,
  UnitKeywords,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}