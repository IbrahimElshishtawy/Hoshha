import 'package:isar_db/isar_db.dart';

import '../../domain/expense.dart';
import 'expense_mapper.dart';
import 'expense_record.dart';

class ExpensesLocalDataSource {
  ExpensesLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, ExpenseRecord> get collection => _isar.expenseRecords;

  Future<void> put(Expense expense) async {
    final existing = await collection
        .where()
        .entityIdEqualTo(expense.id)
        .findFirstAsync();
    final record = mapExpenseToRecord(expense, current: existing);
    if (record.id == 0) {
      record.id = collection.autoIncrement();
    }

    await _isar.writeAsync((isar) {
      isar.expenseRecords.put(record);
    });
  }

  Future<Expense?> getById(String expenseId) async {
    final record = await collection
        .where()
        .entityIdEqualTo(expenseId)
        .findFirstAsync();
    return record == null ? null : mapExpenseRecordToDomain(record);
  }

  Future<List<Expense>> listByMonth(String monthKey) async {
    final records = await collection
        .where()
        .monthKeyEqualTo(monthKey)
        .findAllAsync();
    return records.map(mapExpenseRecordToDomain).toList(growable: false);
  }
}
