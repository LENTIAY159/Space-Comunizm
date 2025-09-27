import 'package:drift/drift.dart';
import '../data/database.dart';

part 'Unit_DAO.g.dart';

@DriftAccessor(tables: [Units])
class UnitDao extends DatabaseAccessor<AppDatabase> with _$UnitDaoMixin {
  UnitDao(AppDatabase db) : super(db);

  Future<List<Unit>> getAllUnits() => select(units).get();
  Stream<List<Unit>> watchAllUnits() => select(units).watch();

  Future insertUnit(Insertable<Unit> unit) => into(units).insert(unit);
  Future deleteUnit(Insertable<Unit> unit) => delete(units).delete(unit);
}
