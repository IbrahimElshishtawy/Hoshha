import '../../../../core/time/month_key.dart';

class MonthlySummary {
  const MonthlySummary({
    required this.monthKey,
    required this.spentMinor,
    required this.budgetMinor,
    required this.remainingMinor,
    required this.expenseCount,
    required this.topCategoryId,
    required this.topCategorySpentMinor,
    required this.topCategoryExpenseCount,
    required this.averageDailySpentMinor,
  });

  const MonthlySummary.empty({required this.monthKey, this.budgetMinor = 0})
    : spentMinor = 0,
      remainingMinor = budgetMinor,
      expenseCount = 0,
      topCategoryId = null,
      topCategorySpentMinor = 0,
      topCategoryExpenseCount = 0,
      averageDailySpentMinor = 0.0;

  final String monthKey;
  final int spentMinor;
  final int budgetMinor;
  final int remainingMinor;
  final int expenseCount;
  final String? topCategoryId;
  final int topCategorySpentMinor;
  final int topCategoryExpenseCount;
  final double averageDailySpentMinor;

  DateTime get month => monthStartFromKey(monthKey);

  int get totalSpentMinor => spentMinor;

  int get budgetLimitMinor => budgetMinor;

  int get remainingBudgetMinor => remainingMinor;

  bool get hasBudget => budgetMinor > 0;
}
