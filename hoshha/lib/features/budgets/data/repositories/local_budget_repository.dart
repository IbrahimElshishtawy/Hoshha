import '../../../../core/time/month_key.dart';
import '../../domain/budget.dart';
import '../../domain/budget_repository.dart';
import '../local/budget_mapper.dart';
import '../local/budgets_local_data_source.dart';

class LocalBudgetRepository implements BudgetRepository {
  LocalBudgetRepository(this._localDataSource);

  final BudgetsLocalDataSource _localDataSource;

  @override
  Future<Budget?> getBudgetForMonth(DateTime month) async {
    final record = await _localDataSource.findByMonthKey(
      monthKeyFromDate(month),
    );
    return record == null ? null : mapBudgetRecordToDomain(record);
  }

  @override
  Stream<Budget?> watchBudgetForMonth(DateTime month) {
    final monthKey = monthKeyFromDate(month);
    return _localDataSource
        .watchByMonthKey(monthKey)
        .map(
          (record) => record == null ? null : mapBudgetRecordToDomain(record),
        );
  }

  @override
  Future<Budget> saveBudget(Budget budget) async {
    final existing = await _localDataSource.findByMonthKey(budget.monthKey);
    final record = mapBudgetToRecord(budget, current: existing);
    await _localDataSource.putRecord(record);
    return mapBudgetRecordToDomain(record);
  }
}
