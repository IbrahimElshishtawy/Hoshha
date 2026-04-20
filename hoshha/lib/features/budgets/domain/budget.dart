class Budget {
  const Budget({
    required this.id,
    required this.monthKey,
    required this.limitMinor,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String monthKey;
  final int limitMinor;
  final DateTime createdAt;
  final DateTime updatedAt;
}
