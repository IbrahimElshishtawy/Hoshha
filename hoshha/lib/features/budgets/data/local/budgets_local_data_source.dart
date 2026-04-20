import 'package:isar_db/isar_db.dart';

import '../../domain/budget.dart';
import 'budget_mapper.dart';
import 'budget_record.dart';

class BudgetsLocalDataSource {
  BudgetsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, BudgetRecord> get collection => _isar.budgetRecords;

  Future<void> put(Budget budget) async {
    final existing = await collection
        .where()
        .monthKeyEqualTo(budget.monthKey)
        .findFirstAsync();
    final record = mapBudgetToRecord(budget, current: existing);
    if (record.id == 0) {
      record.id = collection.autoIncrement();
    }

    await _isar.writeAsync((isar) {
      isar.budgetRecords.put(record);
    });
  }

  Future<Budget?> getByMonthKey(String monthKey) async {
    final record = await collection
        .where()
        .monthKeyEqualTo(monthKey)
        .findFirstAsync();
    return record == null ? null : mapBudgetRecordToDomain(record);
  }
}
