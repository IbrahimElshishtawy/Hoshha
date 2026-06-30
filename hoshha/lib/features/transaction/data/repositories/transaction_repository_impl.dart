import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_remote_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<bool, Failure>> addTransaction(TransactionEntity transaction) async {
    try {
      final model = TransactionModel(
        id: transaction.id,
        title: transaction.title,
        amount: transaction.amount,
        type: transaction.type,
        category: transaction.category,
        date: transaction.date,
        time: transaction.time,
        notes: transaction.notes,
      );
      final result = await remoteDataSource.addTransaction(model);
      return Success(result);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
