import 'package:isar_db/isar_db.dart';

import 'budget_record.dart';

class BudgetsLocalDataSource {
  BudgetsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, BudgetRecord> get collection => _isar.budgetRecords;

  Future<BudgetRecord?> findByMonthKey(String monthKey) {
    return collection.where().monthKeyEqualTo(monthKey).findFirstAsync();
  }

  Stream<BudgetRecord?> watchByMonthKey(String monthKey) async* {
    yield await findByMonthKey(monthKey);
    yield* collection.watch().asyncMap((_) => findByMonthKey(monthKey));
  }

  Future<void> putRecord(BudgetRecord record) async {
    await _isar.writeAsync((isar) {
      putRecordInTransaction(isar, record);
    });
  }

  void putRecordInTransaction(Isar isar, BudgetRecord record) {
    if (record.id == 0) {
      record.id = isar.budgetRecords.autoIncrement();
    }
    isar.budgetRecords.put(record);
  }
}
