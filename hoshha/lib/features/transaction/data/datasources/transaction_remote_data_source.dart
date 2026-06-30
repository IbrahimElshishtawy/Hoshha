import '../models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<bool> addTransaction(TransactionModel transaction);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  @override
  Future<bool> addTransaction(TransactionModel transaction) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
