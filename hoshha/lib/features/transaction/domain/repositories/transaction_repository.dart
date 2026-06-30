import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Result<bool, Failure>> addTransaction(TransactionEntity transaction);
}
