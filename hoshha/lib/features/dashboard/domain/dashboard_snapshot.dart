class DashboardSnapshot {
  const DashboardSnapshot({
    required this.month,
    required this.totalSpent,
    required this.budgetLimit,
    required this.remainingBudget,
    required this.transactionCount,
    required this.streakDays,
    required this.level,
    required this.xp,
  });

  final DateTime month;
  final double totalSpent;
  final double budgetLimit;
  final double remainingBudget;
  final int transactionCount;
  final int streakDays;
  final int level;
  final int xp;

  double get spentRatio => budgetLimit == 0 ? 0 : totalSpent / budgetLimit;
}
