import '../../../../transaction/domain/entities/transaction.dart';

class CalendarEvent {
  final DateTime date;
  final double totalIncome;
  final double totalExpense;
  final List<Transaction> transactions;

  const CalendarEvent({
    required this.date,
    required this.totalIncome,
    required this.totalExpense,
    required this.transactions,
  });
}
