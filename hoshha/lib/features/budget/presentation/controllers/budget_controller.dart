import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/app_providers.dart';
import '../../../../core/result/result.dart';
import '../../../budgets/budget_providers.dart';
import '../../../budgets/domain/budget.dart';
import '../../../dashboard/dashboard_providers.dart';
import '../../../expenses/expenses_providers.dart';
import '../../../gamification/gamification_providers.dart';

final budgetControllerProvider =
    AutoDisposeAsyncNotifierProvider<BudgetController, void>(
      BudgetController.new,
      name: 'budgetControllerProvider',
    );

class BudgetController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<Result<Budget>> submit({required int limitMinor}) async {
    state = const AsyncLoading();

    final result = await ref
        .read(setMonthlyBudgetProvider)
        .call(month: ref.read(clockProvider).now(), limitMinor: limitMinor);

    result.when(
      success: (_) {
        ref.invalidate(monthlySummaryProvider);
        ref.invalidate(currentMonthSummaryProvider);
        ref.invalidate(currentBudgetProvider);
        ref.invalidate(gamificationSnapshotProvider);
        ref.invalidate(dashboardSnapshotProvider);
        state = const AsyncData(null);
      },
      failure: (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
    );

    return result;
  }
}
