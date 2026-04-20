class DashboardSnapshot {
  const DashboardSnapshot({
    required this.month,
    required this.totalSpentMinor,
    required this.budgetLimitMinor,
    required this.remainingBudgetMinor,
    required this.transactionCount,
    required this.streakDays,
    required this.level,
    required this.xp,
  });

  final DateTime month;
  final int totalSpentMinor;
  final int budgetLimitMinor;
  final int remainingBudgetMinor;
  final int transactionCount;
  final int streakDays;
  final int level;
  final int xp;

  double get totalSpent => totalSpentMinor / 100;

  double get budgetLimit => budgetLimitMinor / 100;

  double get remainingBudget => remainingBudgetMinor / 100;

  double get spentRatio =>
      budgetLimitMinor == 0 ? 0 : totalSpentMinor / budgetLimitMinor;
}
