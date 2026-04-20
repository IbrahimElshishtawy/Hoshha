import '../../../expenses/application/models/expense_query.dart';
import '../../../expenses/domain/expense_repository.dart';
import '../../domain/streak.dart';
import '../../domain/streak_repository.dart';
import '../services/streak_projector.dart';

class RefreshStreak {
  const RefreshStreak({
    required ExpensesRepository expensesRepository,
    required StreakRepository streakRepository,
    required StreakProjector streakProjector,
    required DateTime Function() now,
  }) : _expensesRepository = expensesRepository,
       _streakRepository = streakRepository,
       _streakProjector = streakProjector,
       _now = now;

  final ExpensesRepository _expensesRepository;
  final StreakRepository _streakRepository;
  final StreakProjector _streakProjector;
  final DateTime Function() _now;

  Future<Streak> call() async {
    final expenses = await _expensesRepository.getExpenses(
      const ExpenseQuery(),
    );
    final streak = _streakProjector.projectFromExpenses(
      expenses: expenses,
      now: _now(),
    );
    return _streakRepository.saveStreak(streak);
  }
}
