import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/result/result.dart';
import '../../budgets/budget_providers.dart';
import '../../dashboard/dashboard_providers.dart';
import '../../gamification/gamification_providers.dart';
import '../expenses_providers.dart';
import 'models/record_expense_input.dart';
import 'models/record_expense_result.dart';

class RecordExpenseController extends AsyncNotifier<RecordExpenseResult?> {
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
