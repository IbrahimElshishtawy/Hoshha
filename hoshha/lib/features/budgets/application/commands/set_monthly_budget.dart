import '../../../../core/errors/app_failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/time/month_key.dart';
import '../../domain/budget.dart';
import '../../domain/budget_repository.dart';
import '../../../gamification/application/commands/evaluate_achievements.dart';

class SetMonthlyBudget {
  const SetMonthlyBudget({
    required BudgetRepository budgetRepository,
    required EvaluateAchievements evaluateAchievements,
    required DateTime Function() now,
  }) : _budgetRepository = budgetRepository,
       _evaluateAchievements = evaluateAchievements,
       _now = now;

  final BudgetRepository _budgetRepository;
  final EvaluateAchievements _evaluateAchievements;
  final DateTime Function() _now;

  Future<Result<Budget>> call({
    required DateTime month,
    required int limitMinor,
  }) async {
    if (limitMinor <= 0) {
      return const Failure(
        AppFailure(
          type: AppFailureType.validation,
          message: 'Budget limit must be greater than zero.',
        ),
      );
    }

    try {
      final now = _now();
      final normalizedMonth = DateTime(month.year, month.month);
      final budget = await _budgetRepository.saveBudget(
        Budget(
          id: 'budget_${monthKeyFromDate(normalizedMonth)}',
          monthKey: monthKeyFromDate(normalizedMonth),
          limitMinor: limitMinor,
          createdAt: now,
          updatedAt: now,
        ),
      );
      await _evaluateAchievements(
        budgetOverride: budget,
        month: normalizedMonth,
      );
      return Success(budget);
    } catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.storage,
          message: 'Failed to save monthly budget.',
          cause: error,
        ),
      );
    }
  }
}
