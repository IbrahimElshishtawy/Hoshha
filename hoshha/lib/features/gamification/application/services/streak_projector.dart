import '../../domain/streak.dart';
import '../../../expenses/domain/expense.dart';

class StreakProjector {
  const StreakProjector();

  Streak projectAfterExpense({
    required Streak? current,
    required Expense expense,
  }) {
    final now = expense.updatedAt;
    final base = current ?? _initial(now);
    final expenseDay = _dayOnly(expense.occurredAt);
    final lastQualifiedDay = base.lastQualifiedAt == null
        ? null
        : _dayOnly(base.lastQualifiedAt!);

    final currentCount = switch ((lastQualifiedDay, expenseDay)) {
      (null, _) => 1,
      final pair when pair.$1 == pair.$2 => base.currentCount,
      final pair when pair.$1!.add(const Duration(days: 1)) == pair.$2 =>
        base.currentCount + 1,
      _ => 1,
    };

    return Streak(
      type: StreakType.expenseLogging,
      currentCount: currentCount,
      bestCount: currentCount > base.bestCount ? currentCount : base.bestCount,
      createdAt: base.createdAt,
      updatedAt: now,
      lastQualifiedAt: expenseDay,
    );
  }

  Streak projectFromExpenses({
    required List<Expense> expenses,
    required DateTime now,
  }) {
    if (expenses.isEmpty) {
      return _initial(now);
    }

    final uniqueDays =
        expenses
            .map((expense) => _dayOnly(expense.occurredAt))
            .toSet()
            .toList(growable: false)
          ..sort();

    var bestCount = 0;
    var currentRun = 0;
    DateTime? previousDay;

    for (final day in uniqueDays) {
      if (previousDay == null) {
        currentRun = 1;
      } else if (previousDay.add(const Duration(days: 1)) == day) {
        currentRun += 1;
      } else {
        currentRun = 1;
      }

      if (currentRun > bestCount) {
        bestCount = currentRun;
      }
      previousDay = day;
    }

    final firstExpense = expenses.reduce(
      (earliest, current) =>
          current.createdAt.isBefore(earliest.createdAt) ? current : earliest,
    );

    return Streak(
      type: StreakType.expenseLogging,
      currentCount: currentRun,
      bestCount: bestCount,
      createdAt: firstExpense.createdAt,
      updatedAt: now,
      lastQualifiedAt: uniqueDays.last,
    );
  }

  Streak initial(DateTime now) => _initial(now);

  Streak _initial(DateTime now) {
    return Streak(
      type: StreakType.expenseLogging,
      currentCount: 0,
      bestCount: 0,
      createdAt: now,
      updatedAt: now,
    );
  }

  DateTime _dayOnly(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }
}
