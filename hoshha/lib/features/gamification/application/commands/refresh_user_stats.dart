import '../../../expenses/application/models/expense_query.dart';
import '../../../expenses/domain/expense_repository.dart';
import '../../domain/user_stats.dart';
import '../../domain/user_stats_repository.dart';
import '../services/user_stats_projector.dart';

class RefreshUserStats {
  const RefreshUserStats({
    required ExpensesRepository expensesRepository,
    required UserStatsRepository userStatsRepository,
    required UserStatsProjector userStatsProjector,
    required DateTime Function() now,
  }) : _expensesRepository = expensesRepository,
       _userStatsRepository = userStatsRepository,
       _userStatsProjector = userStatsProjector,
       _now = now;

  final ExpensesRepository _expensesRepository;
  final UserStatsRepository _userStatsRepository;
  final UserStatsProjector _userStatsProjector;
  final DateTime Function() _now;

  Future<UserStats> call() async {
    final expenses = await _expensesRepository.getExpenses(const ExpenseQuery());
    final stats = _userStatsProjector.projectFromExpenses(
      expenses: expenses,
      now: _now(),
    );
    return _userStatsRepository.saveUserStats(stats);
  }
}
