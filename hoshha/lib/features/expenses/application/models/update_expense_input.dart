class UpdateExpenseInput {
  const UpdateExpenseInput({
    required this.expenseId,
    required this.amountMinor,
    required this.categoryId,
    required this.occurredAt,
    this.note,
  });

  final String expenseId;
  final int amountMinor;
  final String categoryId;
  final DateTime occurredAt;
  final String? note;
}
