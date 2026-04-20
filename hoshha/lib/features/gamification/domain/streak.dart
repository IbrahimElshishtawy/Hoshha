enum StreakType { expenseLogging }

class Streak {
  const Streak({
    required this.type,
    required this.currentCount,
    required this.bestCount,
    required this.createdAt,
    required this.updatedAt,
    this.lastQualifiedAt,
  });

  final StreakType type;
  final int currentCount;
  final int bestCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastQualifiedAt;
}
