import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';
import '../../../budgets/budget_providers.dart';
import '../../../dashboard/dashboard_providers.dart';
import '../../../gamification/gamification_providers.dart';
import '../../application/models/record_expense_input.dart';
import '../../application/models/record_expense_result.dart';
import '../../expenses_providers.dart';

final addExpenseControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      AddExpenseController,
      RecordExpenseResult?
    >(AddExpenseController.new, name: 'addExpenseControllerProvider');

final expenseCategoryOptionsProvider = Provider<List<ExpenseCategoryOption>>(
  (ref) => ExpenseCategoryOption.defaults,
  name: 'expenseCategoryOptionsProvider',
);

class AddExpenseController
    extends AutoDisposeAsyncNotifier<RecordExpenseResult?> {
  @override
  Future<RecordExpenseResult?> build() async => null;

  Future<Result<RecordExpenseResult>> submit(RecordExpenseInput input) async {
    state = const AsyncLoading();
    final result = await ref.read(recordExpenseProvider).call(input);

    result.when(
      success: (value) {
        ref.invalidate(recentExpensesProvider);
        ref.invalidate(currentMonthSummaryProvider);
        ref.invalidate(currentBudgetProvider);
        ref.invalidate(gamificationSnapshotProvider);
        ref.invalidate(dashboardSnapshotProvider);
        state = AsyncData(value);
      },
      failure: (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
    );

    return result;
  }
}

@immutable
class ExpenseCategoryOption {
  const ExpenseCategoryOption({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;

  static const defaults = <ExpenseCategoryOption>[
    ExpenseCategoryOption(
      id: 'طعام',
      label: 'طعام',
      icon: Icons.restaurant_rounded,
    ),
    ExpenseCategoryOption(
      id: 'مواصلات',
      label: 'مواصلات',
      icon: Icons.directions_car_filled_rounded,
    ),
    ExpenseCategoryOption(
      id: 'فواتير',
      label: 'فواتير',
      icon: Icons.receipt_long_rounded,
    ),
    ExpenseCategoryOption(
      id: 'تسوق',
      label: 'تسوق',
      icon: Icons.shopping_bag_rounded,
    ),
    ExpenseCategoryOption(id: 'منزل', label: 'منزل', icon: Icons.home_rounded),
    ExpenseCategoryOption(
      id: 'صحة',
      label: 'صحة',
      icon: Icons.favorite_rounded,
    ),
    ExpenseCategoryOption(
      id: 'ترفيه',
      label: 'ترفيه',
      icon: Icons.movie_rounded,
    ),
    ExpenseCategoryOption(
      id: 'أخرى',
      label: 'أخرى',
      icon: Icons.category_rounded,
    ),
  ];
}
