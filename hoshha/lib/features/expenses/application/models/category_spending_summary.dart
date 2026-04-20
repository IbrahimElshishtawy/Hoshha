class CategorySpendingSummary {
  const CategorySpendingSummary({
    required this.categoryId,
    required this.spentMinor,
    required this.expenseCount,
  });

  final String categoryId;
  final int spentMinor;
  final int expenseCount;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CategorySpendingSummary &&
            other.categoryId == categoryId &&
            other.spentMinor == spentMinor &&
            other.expenseCount == expenseCount;
  }

  @override
  int get hashCode => Object.hash(categoryId, spentMinor, expenseCount);
}
