import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String type; // 'expense', 'income', 'transfer'
  final String category;
  final String date;
  final String time;
  final String? notes;

  const TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.time,
    this.notes,
  });

  @override
  List<Object?> get props => [id, title, amount, type, category, date, time, notes];
}
