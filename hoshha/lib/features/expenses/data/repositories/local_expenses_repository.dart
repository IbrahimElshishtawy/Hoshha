import '../../application/models/date_range.dart';
import '../../application/models/expense_query.dart';
import '../../application/models/sort_option.dart';
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
    final expenses = records
        .map(mapExpenseRecordToDomain)
        .where((expense) => _matchesQuery(expense, query))
        .toList(growable: false);

    final sorted = expenses.toList(growable: false)..sort(
      (left, right) => _compareExpenses(left, right, query.sort),
    );

    final limit = query.limit;
    if (limit == null || limit >= sorted.length) {
      return sorted;
    }

    return sorted.take(limit).toList(growable: false);
  }

  @override
  Future<List<Expense>> getExpensesByDateRange(DateRange range) {
    return getExpenses(ExpenseQuery(dateRange: range));
  }

  @override
  Future<List<Expense>> getRecentExpenses({int limit = 5}) {
    return getExpenses(ExpenseQuery(limit: limit));
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

  bool _matchesQuery(Expense expense, ExpenseQuery query) {
    final categoryId = query.categoryId;
    if (categoryId != null && expense.categoryId != categoryId) {
      return false;
    }

    final dateRange = query.dateRange;
    if (dateRange != null && !dateRange.contains(expense.occurredAt)) {
      return false;
    }

    return true;
  }

  int _compareExpenses(
    Expense left,
    Expense right,
    SortOption<ExpenseSortField> sort,
  ) {
    final comparison = switch (sort.field) {
      ExpenseSortField.occurredAt =>
        left.occurredAt.compareTo(right.occurredAt),
      ExpenseSortField.createdAt => left.createdAt.compareTo(right.createdAt),
      ExpenseSortField.amountMinor => left.amountMinor.compareTo(right.amountMinor),
    };

    return sort.direction == SortDirection.ascending
        ? comparison
        : -comparison;
  }
}
