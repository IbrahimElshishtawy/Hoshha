class MonthlySummary {
  const MonthlySummary({
    required this.month,
    required this.totalSpentMinor,
    required this.expenseCount,
    this.budgetLimitMinor,
  });

  final DateTime month;
  final int totalSpentMinor;
  final int expenseCount;
  final int? budgetLimitMinor;

  int get remainingBudgetMinor =>
      (budgetLimitMinor ?? 0) - totalSpentMinor;
}
