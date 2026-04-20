import '../../domain/expense.dart';
import '../../domain/expense_repository.dart';

class GetRecentExpenses {
  const GetRecentExpenses(this._repository);

  final ExpensesRepository _repository;

  Future<List<Expense>> call({int limit = 5}) {
    return _repository.getRecentExpenses(limit: limit);
  }
}
