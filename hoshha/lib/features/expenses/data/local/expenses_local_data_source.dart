import 'package:isar/isar.dart';

import 'expense_record.dart';

class ExpensesLocalDataSource {
  ExpensesLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, ExpenseRecord> get collection => _isar.expenseRecords;

  Future<List<ExpenseRecord>> getAll() => collection.where().findAllAsync();

  Stream<List<ExpenseRecord>> watchAll() {
    return collection.where().watch(fireImmediately: true);
  }

  Future<ExpenseRecord?> findByEntityId(String expenseId) {
    return collection.where().entityIdEqualTo(expenseId).findFirstAsync();
  }

  Future<void> putRecord(ExpenseRecord record) async {
    await _isar.writeAsync((isar) {
      putRecordInTransaction(isar, record);
    });
  }

  Future<bool> deleteByEntityId(String expenseId) async {
    final existing = await findByEntityId(expenseId);
    if (existing == null) {
      return false;
    }

    await _isar.writeAsync((isar) {
      isar.expenseRecords.delete(existing.id);
    });

    return true;
  }

  void putRecordInTransaction(Isar isar, ExpenseRecord record) {
    if (record.id == 0) {
      record.id = isar.expenseRecords.autoIncrement();
    }
    isar.expenseRecords.put(record);
  }

  void deleteRecordInTransaction(Isar isar, int id) {
    isar.expenseRecords.delete(id);
  }

  void clearInTransaction(Isar isar) {
    isar.expenseRecords.clear();
  }
}
