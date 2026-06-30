import 'package:equatable/equatable.dart';

class SavingsGoal extends Equatable {
  final String title;
  final double current;
  final double target;
  final String deadline;

  const SavingsGoal({
    required this.title,
    required this.current,
    required this.target,
    required this.deadline,
  });

  @override
  List<Object?> get props => [title, current, target, deadline];
}
