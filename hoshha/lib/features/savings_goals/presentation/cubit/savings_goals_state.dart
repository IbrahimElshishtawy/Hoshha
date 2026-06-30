import 'package:equatable/equatable.dart';
import '../../domain/entities/savings_goal.dart';

abstract class SavingsGoalsState extends Equatable {
  const SavingsGoalsState();

  @override
  List<Object?> get props => [];
}

class SavingsGoalsInitial extends SavingsGoalsState {}

class SavingsGoalsLoading extends SavingsGoalsState {}

class SavingsGoalsLoaded extends SavingsGoalsState {
  final List<SavingsGoal> goals;
  final double totalSavings;

  const SavingsGoalsLoaded({
    required this.goals,
    required this.totalSavings,
  });

  @override
  List<Object?> get props => [goals, totalSavings];
}
