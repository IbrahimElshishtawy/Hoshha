import '../models/date_range.dart';
import '../../domain/expense.dart';
import '../../domain/expense_repository.dart';

class GetExpensesByDateRange {
  const GetExpensesByDateRange(this._repository);

  final ExpensesRepository _repository;

  Future<List<Expense>> call(DateRange range) {
    return _repository.getExpensesByDateRange(range);
  }
}
