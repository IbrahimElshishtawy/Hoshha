import '../../../../core/errors/app_failure.dart';
import '../../../../core/result/result.dart';
import '../../../gamification/application/commands/evaluate_achievements.dart';
import '../../../gamification/application/commands/refresh_streak.dart';
import '../../../gamification/application/commands/refresh_user_stats.dart';
import '../../domain/expense.dart';
import '../../domain/expense_repository.dart';
import '../models/update_expense_input.dart';

class UpdateExpense {
  const UpdateExpense({
    required ExpensesRepository expensesRepository,
    required RefreshUserStats refreshUserStats,
    required RefreshStreak refreshStreak,
    required EvaluateAchievements evaluateAchievements,
    required DateTime Function() now,
  }) : _expensesRepository = expensesRepository,
       _refreshUserStats = refreshUserStats,
       _refreshStreak = refreshStreak,
       _evaluateAchievements = evaluateAchievements,
       _now = now;

  final ExpensesRepository _expensesRepository;
  final RefreshUserStats _refreshUserStats;
  final RefreshStreak _refreshStreak;
  final EvaluateAchievements _evaluateAchievements;
  final DateTime Function() _now;

  Future<Result<Expense>> call(UpdateExpenseInput input) async {
    if (input.amountMinor <= 0) {
      return const Failure(
        AppFailure(
          type: AppFailureType.validation,
          message: 'Expense amount must be greater than zero.',
        ),
      );
    }

    if (input.categoryId.trim().isEmpty) {
      return const Failure(
        AppFailure(
          type: AppFailureType.validation,
          message: 'Expense category is required.',
        ),
      );
    }

    try {
      final current = await _expensesRepository.getById(input.expenseId);
      if (current == null) {
        return const Failure(
          AppFailure(
            type: AppFailureType.notFound,
            message: 'Expense was not found.',
          ),
        );
      }

      final updated = Expense(
        id: current.id,
        amountMinor: input.amountMinor,
        categoryId: input.categoryId.trim(),
        occurredAt: input.occurredAt,
        createdAt: current.createdAt,
        updatedAt: _now(),
        note: _normalizeNote(input.note),
      );

      final saved = await _expensesRepository.saveExpense(updated);
      await _refreshUserStats();
      await _refreshStreak();
      await _evaluateAchievements(month: saved.occurredAt);

      return Success(saved);
    } catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.storage,
          message: 'Failed to update expense.',
          cause: error,
        ),
      );
    }
  }

  String? _normalizeNote(String? note) {
    final trimmed = note?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
