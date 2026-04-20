import 'dart:math';

import '../../../../core/errors/app_failure.dart';
import '../../../../core/result/result.dart';
import '../../../budgets/domain/budget_repository.dart';
import '../../../budgets/domain/budget.dart';
import '../../../gamification/application/services/achievement_projector.dart';
import '../../../gamification/application/services/streak_projector.dart';
import '../../../gamification/application/services/user_stats_projector.dart';
import '../../../gamification/domain/streak.dart';
import '../../../gamification/domain/streak_repository.dart';
import '../../../gamification/domain/user_stats_repository.dart';
import '../../data/local/record_expense_local_persister.dart';
import '../../domain/expense.dart';
import '../models/record_expense_input.dart';
import '../models/record_expense_result.dart';
import '../models/monthly_summary.dart';
import '../queries/get_monthly_summary.dart';
import '../../../gamification/domain/achievements_repository.dart';

class RecordExpense {
  RecordExpense({
    required BudgetRepository budgetRepository,
    required UserStatsRepository userStatsRepository,
    required StreakRepository streakRepository,
    required AchievementsRepository achievementsRepository,
    required UserStatsProjector userStatsProjector,
    required StreakProjector streakProjector,
    required AchievementProjector achievementProjector,
    required RecordExpenseLocalPersister persister,
    required GetMonthlySummary getMonthlySummary,
    required DateTime Function() now,
    Random? random,
  }) : _budgetRepository = budgetRepository,
       _userStatsRepository = userStatsRepository,
       _streakRepository = streakRepository,
       _achievementsRepository = achievementsRepository,
       _userStatsProjector = userStatsProjector,
       _streakProjector = streakProjector,
       _achievementProjector = achievementProjector,
       _persister = persister,
       _getMonthlySummary = getMonthlySummary,
       _now = now,
       _random = random ?? Random();

  final BudgetRepository _budgetRepository;
  final UserStatsRepository _userStatsRepository;
  final StreakRepository _streakRepository;
  final AchievementsRepository _achievementsRepository;
  final UserStatsProjector _userStatsProjector;
  final StreakProjector _streakProjector;
  final AchievementProjector _achievementProjector;
  final RecordExpenseLocalPersister _persister;
  final GetMonthlySummary _getMonthlySummary;
  final DateTime Function() _now;
  final Random _random;

  Future<Result<RecordExpenseResult>> call(RecordExpenseInput input) async {
    final validationError = _validate(input);
    if (validationError != null) {
      return Failure(validationError);
    }

    try {
      final now = _now();
      final expense = Expense(
        id: _buildExpenseId(now),
        amountMinor: input.amountMinor,
        categoryId: input.categoryId.trim(),
        occurredAt: input.occurredAt,
        createdAt: now,
        updatedAt: now,
        note: _normalizeNote(input.note),
      );

      final currentStats = await _userStatsRepository.getUserStats();
      final currentStreak = await _streakRepository.getStreak(
        StreakType.expenseLogging,
      );
      final currentAchievements = await _achievementsRepository.getAchievements();
      final currentBudget = await _budgetRepository.getBudgetForMonth(
        expense.occurredAt,
      );

      final projectedStats = _userStatsProjector.projectAfterExpense(
        current: currentStats,
        expense: expense,
      );
      final projectedStreak = _streakProjector.projectAfterExpense(
        current: currentStreak,
        expense: expense,
      );
      final projectedSummary = await _projectMonthlySummary(
        expense,
        currentBudget,
      );
      final projectedAchievements = _achievementProjector.project(
        now: now,
        stats: projectedStats,
        streak: projectedStreak,
        current: currentAchievements,
        budget: currentBudget,
        monthlySummary: projectedSummary,
      );

      await _persister.persist(
        expense: expense,
        stats: projectedStats,
        streak: projectedStreak,
        achievements: projectedAchievements,
        budget: currentBudget,
      );

      return Success(
        RecordExpenseResult(
          expense: expense,
          stats: projectedStats,
          streak: projectedStreak,
          achievements: projectedAchievements,
          budget: currentBudget,
        ),
      );
    } on FormatException catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.mapping,
          message: 'Failed to map expense data.',
          cause: error,
        ),
      );
    } catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.storage,
          message: 'Failed to record expense.',
          cause: error,
        ),
      );
    }
  }

  AppFailure? _validate(RecordExpenseInput input) {
    if (input.amountMinor <= 0) {
      return const AppFailure(
        type: AppFailureType.validation,
        message: 'Expense amount must be greater than zero.',
      );
    }

    if (input.categoryId.trim().isEmpty) {
      return const AppFailure(
        type: AppFailureType.validation,
        message: 'Expense category is required.',
      );
    }

    return null;
  }

  String _buildExpenseId(DateTime now) {
    final randomPart = _random.nextInt(0x7fffffff).toRadixString(16);
    return 'expense_${now.microsecondsSinceEpoch}_$randomPart';
  }

  String? _normalizeNote(String? note) {
    final trimmed = note?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Future<MonthlySummary> _projectMonthlySummary(
    Expense expense,
    Budget? currentBudget,
  ) async {
    final summary = await _getMonthlySummary(expense.occurredAt);
    return MonthlySummary(
      month: summary.month,
      totalSpentMinor: summary.totalSpentMinor + expense.amountMinor,
      expenseCount: summary.expenseCount + 1,
      budgetLimitMinor: currentBudget?.limitMinor ?? summary.budgetLimitMinor,
    );
  }
}
