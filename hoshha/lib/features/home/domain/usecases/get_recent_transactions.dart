import 'package:hoshha/core/result/result.dart';
import '../entities/home_transaction.dart';
import '../repositories/home_repository.dart';

class GetRecentTransactionsUseCase {
  const GetRecentTransactionsUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<List<HomeTransaction>>> call() {
    return _repository.getRecentTransactions();
  }
}
