import '../../domain/entities/savings_goal.dart';

class SavingsGoalModel extends SavingsGoal {
  const SavingsGoalModel({
    required super.title,
    required super.current,
    required super.target,
    required super.deadline,
  });

  factory SavingsGoalModel.fromJson(Map<String, dynamic> json) {
    return SavingsGoalModel(
      title: json['title'] as String,
      current: (json['current'] as num).toDouble(),
      target: (json['target'] as num).toDouble(),
      deadline: json['deadline'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'current': current,
      'target': target,
      'deadline': deadline,
    };
  }
}
