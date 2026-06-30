import '../../../transaction/domain/entities/transaction_entity.dart';

class CalendarEvent {
  final DateTime date;
  final double totalIncome;
  final double totalExpense;
  final List<TransactionEntity> transactions;

  const CalendarEvent({
    required this.date,
    required this.totalIncome,
    required this.totalExpense,
    required this.transactions,
  });
}
