import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoshha/app/app_providers.dart';
import 'package:hoshha/app/hoshha_app.dart';
import 'package:hoshha/core/time/clock.dart';
import 'package:hoshha/features/budgets/budget_providers.dart';
import 'package:hoshha/features/budgets/domain/budget.dart';
import 'package:hoshha/features/budgets/domain/budget_repository.dart';
import 'package:hoshha/features/expenses/application/models/date_range.dart';
import 'package:hoshha/features/expenses/application/models/expense_query.dart';
import 'package:hoshha/features/expenses/domain/expense.dart';
import 'package:hoshha/features/expenses/domain/expense_repository.dart';
import 'package:hoshha/features/expenses/expenses_providers.dart';
import 'package:hoshha/features/gamification/domain/achievement_progress.dart';
import 'package:hoshha/features/gamification/domain/achievements_repository.dart';
import 'package:hoshha/features/gamification/domain/streak.dart';
import 'package:hoshha/features/gamification/domain/streak_repository.dart';
import 'package:hoshha/features/gamification/domain/user_stats.dart';
import 'package:hoshha/features/gamification/domain/user_stats_repository.dart';
import 'package:hoshha/features/gamification/gamification_providers.dart';
import 'package:hoshha/infrastructure/storage/storage_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('renders localized dashboard inside app shell', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    final clock = _TestClock(DateTime(2026, 4, 20, 12));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          clockProvider.overrideWithValue(clock),
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          expensesRepositoryProvider.overrideWithValue(
            _FakeExpensesRepository(clock.now()),
          ),
          budgetRepositoryProvider.overrideWithValue(
            _FakeBudgetRepository(clock.now()),
          ),
          userStatsRepositoryProvider.overrideWithValue(
            _FakeUserStatsRepository(clock.now()),
          ),
          streakRepositoryProvider.overrideWithValue(
            _FakeStreakRepository(clock.now()),
          ),
          achievementsRepositoryProvider.overrideWithValue(
            _FakeAchievementsRepository(),
          ),
        ],
        child: const HoshhaApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Card), findsAtLeastNWidgets(3));
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}

class _TestClock implements Clock {
  const _TestClock(this._now);

  final DateTime _now;

  @override
  DateTime now() => _now;
}

class _FakeExpensesRepository implements ExpensesRepository {
  _FakeExpensesRepository(this._now);

  final DateTime _now;

  @override
  Future<void> deleteExpense(String expenseId) async {}

  @override
  Future<Expense?> getById(String expenseId) async => _expense;

  @override
  Future<List<Expense>> getExpenses(ExpenseQuery query) async {
    final range = query.dateRange;
    if (range != null && !range.contains(_expense.occurredAt)) {
      return [];
    }

    return [_expense];
  }

  @override
  Future<List<Expense>> getExpensesByDateRange(DateRange range) async {
    return range.contains(_expense.occurredAt) ? [_expense] : [];
  }

  @override
  Future<List<Expense>> getRecentExpenses({int limit = 5}) async => [_expense];

  @override
  Future<Expense> saveExpense(Expense expense) async => expense;

  Expense get _expense => Expense(
    id: 'expense_1',
    amountMinor: 25000,
    categoryId: 'groceries',
    occurredAt: _now,
    createdAt: _now,
    updatedAt: _now,
  );
}

class _FakeBudgetRepository implements BudgetRepository {
  _FakeBudgetRepository(this._now);

  final DateTime _now;

  @override
  Future<Budget?> getBudgetForMonth(DateTime month) async {
    return Budget(
      id: 'budget_${month.year}_${month.month}',
      monthKey: '${month.year}-${month.month.toString().padLeft(2, '0')}',
      limitMinor: 400000,
      createdAt: _now,
      updatedAt: _now,
    );
  }

  @override
  Future<Budget> saveBudget(Budget budget) async => budget;
}

class _FakeUserStatsRepository implements UserStatsRepository {
  _FakeUserStatsRepository(this._now);

  final DateTime _now;

  @override
  Future<UserStats?> getUserStats() async {
    return UserStats(
      totalXp: 40,
      level: 1,
      totalExpensesCount: 1,
      totalSpentMinor: 25000,
      createdAt: _now,
      updatedAt: _now,
      lastExpenseAt: _now,
    );
  }

  @override
  Future<UserStats> saveUserStats(UserStats stats) async => stats;
}

class _FakeStreakRepository implements StreakRepository {
  _FakeStreakRepository(this._now);

  final DateTime _now;

  @override
  Future<Streak?> getStreak(StreakType type) async {
    return Streak(
      type: StreakType.expenseLogging,
      currentCount: 1,
      bestCount: 1,
      createdAt: _now,
      updatedAt: _now,
      lastQualifiedAt: _now,
    );
  }

  @override
  Future<Streak> saveStreak(Streak streak) async => streak;
}

class _FakeAchievementsRepository implements AchievementsRepository {
  @override
  Future<AchievementProgress?> getAchievement(AchievementId achievementId) async {
    return null;
  }

  @override
  Future<List<AchievementProgress>> getAchievements() async => const [];

  @override
  Future<AchievementProgress> saveAchievement(
    AchievementProgress achievement,
  ) async => achievement;

  @override
  Future<List<AchievementProgress>> saveAchievements(
    List<AchievementProgress> achievements,
  ) async => achievements;
}
