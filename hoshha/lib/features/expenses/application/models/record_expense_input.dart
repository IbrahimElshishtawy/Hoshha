class RecordExpenseInput {
  const RecordExpenseInput({
    required this.amountMinor,
    required this.categoryId,
    required this.occurredAt,
    this.note,
  });

  final int amountMinor;
  final String categoryId;
  final DateTime occurredAt;
  final String? note;
}
