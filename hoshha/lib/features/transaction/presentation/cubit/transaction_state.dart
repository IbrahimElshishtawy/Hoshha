import 'package:equatable/equatable.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionSubmitting extends TransactionState {}

class TransactionSuccess extends TransactionState {}

class TransactionFailure extends TransactionState {
  final String message;
  const TransactionFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class TransactionLoadInProgress extends TransactionState {}

class TransactionLoadSuccess extends TransactionState {
  final List<TransactionEntity> transactions;
  const TransactionLoadSuccess(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

class TransactionLoadFailure extends TransactionState {
  final String message;
  const TransactionLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
