import 'package:equatable/equatable.dart';

class DebtItem extends Equatable {
  final String personName;
  final double amount;
  final String dueDate;
  final String description;

  const DebtItem({
    required this.personName,
    required this.amount,
    required this.dueDate,
    required this.description,
  });

  @override
  List<Object?> get props => [personName, amount, dueDate, description];
}
