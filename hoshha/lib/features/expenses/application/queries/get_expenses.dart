import '../models/expense_query.dart';
import '../../domain/expense.dart';
import '../../domain/expense_repository.dart';

class GetExpenses {
  const GetExpenses(this._repository);

  final ExpensesRepository _repository;

  Future<List<Expense>> call(ExpenseQuery query) {
    return _repository.getExpenses(query.normalized);
  }

  Stream<List<Expense>> watch(ExpenseQuery query) {
    return _repository.watchExpenses(query.normalized);
  }
}
