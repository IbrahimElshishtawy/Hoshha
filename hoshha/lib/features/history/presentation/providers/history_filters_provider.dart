import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/app_providers.dart';
import '../../../expenses/application/models/date_range.dart';
import '../../../expenses/application/models/expense_query.dart';
import '../../../expenses/application/models/expense_sort_option.dart';

final historyFiltersProvider =
    AutoDisposeNotifierProvider<HistoryFiltersController, HistoryFiltersState>(
      HistoryFiltersController.new,
      name: 'historyFiltersProvider',
    );

class HistoryFiltersController
    extends AutoDisposeNotifier<HistoryFiltersState> {
  @override
  HistoryFiltersState build() {
    final now = ref.read(clockProvider).now();
    return HistoryFiltersState.initial(now);
  }

  void selectCategory(String? categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  void selectSort(ExpenseSortOption sort) {
    if (state.sort == sort) {
      return;
    }

    state = state.copyWith(sort: sort);
  }

  void selectDateRange(DateRange? dateRange) {
    state = state.copyWith(dateRange: dateRange?.normalized);
  }

  void resetToCurrentMonth() {
    final now = ref.read(clockProvider).now();
    state = state.copyWith(dateRange: DateRange.month(now));
  }

  void clearFilters() {
    state = state.copyWith(categoryId: null, dateRange: null);
  }
}

@immutable
class HistoryFiltersState {
  const HistoryFiltersState({
    this.categoryId,
    this.dateRange,
    this.sort = ExpenseSortOption.latest,
  });

  factory HistoryFiltersState.initial(DateTime now) =>
      HistoryFiltersState(dateRange: DateRange.month(now));

  final String? categoryId;
  final DateRange? dateRange;
  final ExpenseSortOption sort;

  String? get normalizedCategoryId {
    final value = categoryId?.trim();
    return value == null || value.isEmpty ? null : value;
  }

  bool get hasCategoryFilter => normalizedCategoryId != null;

  bool get hasDateFilter => dateRange != null;

  bool get hasActiveFilters => hasCategoryFilter || hasDateFilter;

  ExpenseQuery get expenseQuery => ExpenseQuery(
    dateRange: dateRange,
    categoryId: normalizedCategoryId,
    sort: sort,
  ).normalized;

  bool isCurrentMonth(DateTime now) => dateRange == DateRange.month(now);

  HistoryFiltersState copyWith({
    Object? categoryId = _noValue,
    Object? dateRange = _noValue,
    ExpenseSortOption? sort,
  }) {
    return HistoryFiltersState(
      categoryId: identical(categoryId, _noValue)
          ? this.categoryId
          : categoryId as String?,
      dateRange: identical(dateRange, _noValue)
          ? this.dateRange
          : dateRange as DateRange?,
      sort: sort ?? this.sort,
    );
  }
}

const Object _noValue = Object();
