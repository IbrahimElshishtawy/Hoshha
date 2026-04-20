import 'date_range.dart';
import 'sort_option.dart';

enum ExpenseSortField { occurredAt, createdAt, amountMinor }

class ExpenseQuery {
  const ExpenseQuery({
    this.dateRange,
    this.categoryId,
    this.limit,
    this.sort = const SortOption(field: ExpenseSortField.occurredAt),
  });

  final DateRange? dateRange;
  final String? categoryId;
  final int? limit;
  final SortOption<ExpenseSortField> sort;
}
