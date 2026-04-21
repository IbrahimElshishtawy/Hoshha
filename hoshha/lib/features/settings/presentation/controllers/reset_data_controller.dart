import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';
import '../../../budget/presentation/controllers/budget_controller.dart';
import '../../../budgets/budget_providers.dart';
import '../../../dashboard/dashboard_providers.dart';
import '../../../expenses/expenses_providers.dart';
import '../../../gamification/gamification_providers.dart';
import '../../settings_providers.dart';

final resetDataControllerProvider =
    AutoDisposeAsyncNotifierProvider<ResetDataController, void>(
      ResetDataController.new,
      name: 'resetDataControllerProvider',
    );

class ResetDataController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<Result<void>> reset() async {
    state = const AsyncLoading();

    final result = await ref.read(resetAppDataProvider).call();

    result.when(
      success: (_) {
        ref.invalidate(recentExpensesProvider);
        ref.invalidate(expenseHistoryProvider);
        ref.invalidate(monthlySummaryProvider);
        ref.invalidate(currentMonthSummaryProvider);
        ref.invalidate(budgetStatusProvider);
        ref.invalidate(currentBudgetProvider);
        ref.invalidate(gamificationSnapshotProvider);
        ref.invalidate(dashboardSnapshotProvider);
        ref.invalidate(dashboardControllerProvider);
        ref.invalidate(budgetControllerProvider);
        state = const AsyncData(null);
      },
      failure: (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
    );

    return result;
  }
}
