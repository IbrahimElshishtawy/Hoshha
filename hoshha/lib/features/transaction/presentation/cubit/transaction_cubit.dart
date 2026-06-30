import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/usecases/add_transaction_usecase.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final AddTransactionUseCase _addTransactionUseCase;

  TransactionCubit({
    required AddTransactionUseCase addTransactionUseCase,
  })  : _addTransactionUseCase = addTransactionUseCase,
        super(TransactionInitial());

  Future<void> saveTransaction({
    required String title,
    required double amount,
    required String type,
    required String category,
    required String date,
    required String time,
    String? notes,
  }) async {
    emit(TransactionSubmitting());
    final transaction = TransactionEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      amount: amount,
      type: type,
      category: category,
      date: date,
      time: time,
      notes: notes,
    );

    final result = await _addTransactionUseCase(transaction);

    if (result.isSuccess) {
      emit(TransactionSuccess());
    } else {
      emit(TransactionFailure(result.errorValue!.message));
    }
  }

  void loadTransactions() {
    emit(TransactionLoadInProgress());
    // Simulate loading data. In real app, fetch from repository/usecase
    final dummyTransactions = [
      TransactionEntity(
        id: '1',
        title: 'ستاربكس',
        amount: 35.0,
        type: 'expense',
        category: 'قهوة',
        date: '2023-11-01',
        time: '09:41 ص',
      ),
      TransactionEntity(
        id: '2',
        title: 'إيداع راتب',
        amount: 12000.0,
        type: 'income',
        category: 'راتب',
        date: '2023-11-01',
        time: '08:15 ص',
      ),
      TransactionEntity(
        id: '3',
        title: 'أوبر',
        amount: 42.5,
        type: 'expense',
        category: 'مواصلات',
        date: '2023-10-31',
        time: '11:20 م',
      ),
      TransactionEntity(
        id: '4',
        title: 'نون للتسوق',
        amount: 189.0,
        type: 'expense',
        category: 'تسوق',
        date: '2023-10-31',
        time: '04:30 م',
      ),
    ];
    emit(TransactionLoadSuccess(dummyTransactions));
  }
}
