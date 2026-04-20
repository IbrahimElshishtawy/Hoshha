import '../../application/models/date_range.dart';
import '../../application/models/expense_query.dart';
import '../../application/models/expense_sort_option.dart';
import '../../domain/expense.dart';
import '../../domain/expense_repository.dart';
import '../local/expense_mapper.dart';
import '../local/expenses_local_data_source.dart';

class LocalExpensesRepository implements ExpensesRepository {
  LocalExpensesRepository(this._localDataSource);

  final ExpensesLocalDataSource _localDataSource;

  @override
  Future<Expense?> getById(String expenseId) async {
    final record = await _localDataSource.findByEntityId(expenseId);
    return record == null ? null : mapExpenseRecordToDomain(record);
  }

  @override
  Future<List<Expense>> getExpenses(ExpenseQuery query) async {
    final records = await _localDataSource.getAll();
    return _applyQuery(records.map(mapExpenseRecordToDomain), query);
  }

  @override
  Stream<List<Expense>> watchExpenses(ExpenseQuery query) {
    return _localDataSource.watchAll().map(
      (records) => _applyQuery(records.map(mapExpenseRecordToDomain), query),
    );
  }

  @override
  Future<List<Expense>> getExpensesByDateRange(DateRange range) {
    return getExpenses(ExpenseQuery(dateRange: range));
  }

  @override
  Future<List<Expense>> getRecentExpenses({int limit = 5}) {
    return getExpenses(ExpenseQuery.recent(limit: limit));
  }

  @override
  Future<Expense> saveExpense(Expense expense) async {
    final existing = await _localDataSource.findByEntityId(expense.id);
    final record = mapExpenseToRecord(expense, current: existing);
    await _localDataSource.putRecord(record);
    return mapExpenseRecordToDomain(record);
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    await _localDataSource.deleteByEntityId(expenseId);
  }

  List<Expense> _applyQuery(Iterable<Expense> expenses, ExpenseQuery query) {
    final normalizedQuery = query.normalized;
    final filtered =
        expenses
            .where((expense) => _matchesQuery(expense, normalizedQuery))
            .toList(growable: false)
          ..sort(
            (left, right) =>
                _compareExpenses(left, right, normalizedQuery.sort),
          );

    final limit = normalizedQuery.normalizedLimit;
    if (limit == null || limit >= filtered.length) {
      return filtered;
    }

    return filtered.take(limit).toList(growable: false);
  }

  bool _matchesQuery(Expense expense, ExpenseQuery query) {
    final categoryId = query.normalizedCategoryId;
    if (categoryId != null && expense.categoryId != categoryId) {
      return false;
    }

    final dateRange = query.dateRange;
    if (dateRange != null && !dateRange.contains(expense.occurredAt)) {
      return false;
    }

    return true;
  }

  int _compareExpenses(Expense left, Expense right, ExpenseSortOption sort) {
    return switch (sort) {
      ExpenseSortOption.latest => right.occurredAt.compareTo(left.occurredAt),
      ExpenseSortOption.oldest => left.occurredAt.compareTo(right.occurredAt),
      ExpenseSortOption.highest => right.amountMinor.compareTo(
        left.amountMinor,
      ),
      ExpenseSortOption.lowest => left.amountMinor.compareTo(right.amountMinor),
    };
  }
}
