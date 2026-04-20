class UserStats {
  const UserStats({
    required this.totalXp,
    required this.level,
    required this.totalExpensesCount,
    required this.totalSpentMinor,
    required this.createdAt,
    required this.updatedAt,
    this.lastExpenseAt,
  });

  final int totalXp;
  final int level;
  final int totalExpensesCount;
  final int totalSpentMinor;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastExpenseAt;
}
