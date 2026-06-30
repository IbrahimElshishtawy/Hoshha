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
}
