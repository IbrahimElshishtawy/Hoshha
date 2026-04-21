import 'package:isar/isar.dart';

import 'budget_record.dart';

class BudgetsLocalDataSource {
  BudgetsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, BudgetRecord> get collection => _isar.budgetRecords;

  Future<BudgetRecord?> findByMonthKey(String monthKey) {
    return collection.where().monthKeyEqualTo(monthKey).findFirstAsync();
  }

  Stream<BudgetRecord?> watchByMonthKey(String monthKey) {
    return collection.where().monthKeyEqualTo(monthKey).watch(
      fireImmediately: true,
    ).map((records) => records.isEmpty ? null : records.first);
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

  void clearInTransaction(Isar isar) {
    