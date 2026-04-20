class Expense {
  const Expense({
    required this.id,
    required this.amount,
    required this.category,
    required this.occurredAt,
  });

  final String id;
  final double amount;
  final String category;
  final DateTime occurredAt;
}
