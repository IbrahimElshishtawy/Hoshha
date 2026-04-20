import '../../domain/user_stats.dart';
import '../../../expenses/domain/expense.dart';

class UserStatsProjector {
  const UserStatsProjector();

  UserStats projectAfterExpense({
    required UserStats? current,
    required Expense expense,
  }) {
    final now = expense.updatedAt;
    final base = current ?? _initial(now);
    final totalExpensesCount = base.totalExpensesCount + 1;
    final totalSpentMinor = base.totalSpentMinor + expense.amountMinor;
    final totalXp = _xpForExpenseCount(totalExpensesCount);

    return UserStats(
      totalXp: totalXp,
      level: _levelFromXp(totalXp),
      totalExpensesCount: totalExpensesCount,
      totalSpentMinor: totalSpentMinor,
      createdAt: base.createdAt,
      updatedAt: now,
      lastExpenseAt: expense.occurredAt,
    );
  }

  UserStats projectFromExpenses({
    required List<Expense> expenses,
    required DateTime now,
  }) {
    if (expenses.isEmpty) {
      return _initial(now);
    }

    final totalExpensesCount = expenses.length;
    final totalSpentMinor = expenses.fold<int>(
      0,
      (sum, expense) => sum + expense.amountMinor,
    );
    final lastExpense = expenses.reduce(
      (latest, current) =>
          current.occurredAt.isAfter(latest.occurredAt) ? current : latest,
    );
    final firstExpense = expenses.reduce(
      (earliest, current) =>
          current.createdAt.isBefore(earliest.createdAt) ? current : earliest,
    );
    final totalXp = _xpForExpenseCount(totalExpensesCount);

    return UserStats(
      totalXp: totalXp,
      level: _levelFromXp(totalXp),
      totalExpensesCount: totalExpensesCount,
      totalSpentMinor: totalSpentMinor,
      createdAt: firstExpense.createdAt,
      updatedAt: now,
      lastExpenseAt: lastExpense.occurredAt,
    );
  }

  UserStats initial(DateTime now) => _initial(now);

  UserStats _initial(DateTime now) {
    return UserStats(
      totalXp: 0,
      level: 1,
      totalExpensesCount: 0,
      totalSpentMinor: 0,
      createdAt: now,
      updatedAt: now,
    );
  }

  int _xpForExpenseCount(int totalExpensesCount) => totalExpensesCount * 10;

  int _levelFromXp(int xp) => (xp ~/ 100) + 1;
}
