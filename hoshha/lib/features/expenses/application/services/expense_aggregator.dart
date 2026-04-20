import '../../../../core/time/month_key.dart';
import '../../../budgets/domain/budget.dart';
import '../../domain/expense.dart';
import '../models/category_spending_summary.dart';
import '../models/monthly_summary.dart';

class ExpenseAggregator {
  const ExpenseAggregator();

  int totalSpentMinor(Iterable<Expense> expenses) {
    return expenses.fold<int>(0, (sum, expense) => sum + expense.amountMinor);
  }

  CategorySpendingSummary? topCategory(Iterable<Expense> expenses) {
    final totals = <String, _CategoryAccumulator>{};

    for (final expense in expenses) {
      final categoryId = expense.categoryId.trim();
      if (categoryId.isEmpty) {
        continue;
      }

      final bucket = totals.putIfAbsent(categoryId, _CategoryAccumulator.new);
      bucket.spentMinor += expense.amountMinor;
      bucket.expenseCount += 1;
    }

    if (totals.isEmpty) {
      return null;
    }

    final best = totals.entries.reduce((currentBest, candidate) {
      final left = currentBest.value;
      final right = candidate.value;
      if (right.spentMinor != left.spentMinor) {
        return right.spentMinor > left.spentMinor ? candidate : currentBest;
      }
      if (right.expenseCount != left.expenseCount) {
        return right.expenseCount > left.expenseCount ? candidate : currentBest;
      }
      return candidate.key.compareTo(currentBest.key) < 0
          ? candidate
          : currentBest;
    });

    return CategorySpendingSummary(
      categoryId: best.key,
      spentMinor: best.value.spentMinor,
      expenseCount: best.value.expenseCount,
    );
  }

  MonthlySummary buildMonthlySummary({
    required DateTime month,
    required List<Expense> expenses,
    required Budget? budget,
  }) {
    final normalizedMonth = DateTime(month.year, month.month);
    final spentMinor = totalSpentMinor(expenses);
    final budgetMinor = budget?.limitMinor ?? 0;
    final remainingMinor = budget == null ? 0 : budgetMinor - spentMinor;
    final dominantCategory = topCategory(expenses);
    final daysInMonth = DateTime(
      normalizedMonth.year,
      normalizedMonth.month + 1,
      0,
    ).day;
    final averageDailySpentMinor = daysInMonth == 0
        ? 0.0
        : spentMinor / daysInMonth;

    return MonthlySummary(
      monthKey: monthKeyFromDate(normalizedMonth),
      spentMinor: spentMinor,
      budgetMinor: budgetMinor,
      remainingMinor: remainingMinor,
      expenseCount: expenses.length,
      topCategoryId: dominantCategory?.categoryId,
      averageDailySpentMinor: averageDailySpentMinor,
    );
  }
}

class _CategoryAccumulator {
  int spentMinor = 0;
  int expenseCount = 0;
}
