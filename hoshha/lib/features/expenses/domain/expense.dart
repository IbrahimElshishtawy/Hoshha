class Expense {
  const Expense({
    required this.id,
    required this.amountMinor,
    required this.categoryId,
    required this.occurredAt,
    required this.createdAt,
    required this.updatedAt,
    this.note,
  });

  final String id;
  final int amountMinor;
  final String categoryId;
  final DateTime occurredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? note;
}
