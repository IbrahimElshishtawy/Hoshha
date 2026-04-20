import '../../../../core/errors/app_failure.dart';
import '../../../../core/result/result.dart';
import '../../../gamification/application/commands/evaluate_achievements.dart';
import '../../../gamification/application/commands/refresh_streak.dart';
import '../../../gamification/application/commands/refresh_user_stats.dart';
import '../../domain/expense_repository.dart';

class DeleteExpense {
  const DeleteExpense({
    required ExpensesRepository expensesRepository,
    required RefreshUserStats refreshUserStats,
    required RefreshStreak refreshStreak,
    required EvaluateAchievements evaluateAchievements,
  }) : _expensesRepository = expensesRepository,
       _refreshUserStats = refreshUserStats,
       _refreshStreak = refreshStreak,
       _evaluateAchievements = evaluateAchievements;

  final ExpensesRepository _expensesRepository;
  final RefreshUserStats _refreshUserStats;
  final RefreshStreak _refreshStreak;
  final EvaluateAchievements _evaluateAchievements;

  Future<Result<String>> call(String expenseId) async {
    try {
      final current = await _expensesRepository.getById(expenseId);
      if (current == null) {
        return const Failure(
          AppFailure(
            type: AppFailureType.notFound,
            message: 'Expense was not found.',
          ),
        );
      }

      await _expensesRepository.deleteExpense(expenseId);
      await _refreshUserStats();
      await _refreshStreak();
      await _evaluateAchievements(month: current.occurredAt);

      return Success(expenseId);
    } catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.storage,
          message: 'Failed to delete expense.',
          cause: error,
        ),
      );
    }
  }
}
