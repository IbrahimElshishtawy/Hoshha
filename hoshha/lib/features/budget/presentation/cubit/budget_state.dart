import 'package:equatable/equatable.dart';
import '../../domain/entities/budget_limit.dart';

abstract class BudgetState extends Equatable {
  const BudgetState();

  @override
  List<Object?> get props => [];
}

class BudgetInitial extends BudgetState {}

class BudgetLoading extends BudgetState {}

class BudgetLoaded extends BudgetState {
  final List<BudgetLimit> budgets;

  const BudgetLoaded({required this.budgets});

  @override
  List<Object?> get props => [budgets];
}
