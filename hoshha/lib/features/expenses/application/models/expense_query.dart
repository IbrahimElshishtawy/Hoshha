import 'date_range.dart';
import 'expense_sort_option.dart';

class ExpenseQuery {
  const ExpenseQuery({
    this.dateRange,
    this.categoryId,
    this.limit,
    this.sort = ExpenseSortOption.latest,
  });

  const ExpenseQuery.recent({this.limit = 5})
    : dateRange = null,
      categoryId = null,
      sort = ExpenseSortOption.latest;

  final DateRange? dateRange;
  final String? categoryId;
  final int? limit;
  final ExpenseSortOption sort;

  String? get normalizedCategoryId {
    final value = categoryId?.trim();
    return value == null || value.isEmpty ? null : value;
  }

  int? get normalizedLimit {
    if (limit == null) {
      return null;
    }
    return limit! < 0 ? 0 : limit;
  }

  ExpenseQuery get normalized => ExpenseQuery(
    dateRange: dateRange?.normalized,
    categoryId: normalizedCategoryId,
    limit: normalizedLimit,
    sort: sort,
  );

  ExpenseQuery copyWith({
    DateRange? dateRange,
    String? categoryId,
    int? limit,
    ExpenseSortOption? sort,
  }) {
    return ExpenseQuery(
      dateRange: dateRange ?? this.dateRange,
      categoryId: categoryId ?? this.categoryId,
      limit: limit ?? this.limit,
      sort: sort ?? this.sort,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ExpenseQuery &&
            other.dateRange == dateRange &&
            other.categoryId == categoryId &&
            other.limit == limit &&
            other.sort == sort;
  }

  @override
  int get hashCode => Object.hash(dateRange, categoryId, limit, sort);
}
