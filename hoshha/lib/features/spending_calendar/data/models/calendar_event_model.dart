import '../../domain/entities/calendar_event.dart';
import '../../../transaction/data/models/transaction_model.dart';
import '../../../transaction/domain/entities/transaction_entity.dart';

class CalendarEventModel extends CalendarEvent {
  const CalendarEventModel({
    required super.date,
    required super.totalIncome,
    required super.totalExpense,
    required super.transactions,
  });

  factory CalendarEventModel.fromJson(Map<String, dynamic> json) {
    return CalendarEventModel(
      date: DateTime.parse(json['date'] as String),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
      'transactions': transactions.map((e) => (e as TransactionModel).toJson()).toList(),
    };
  }
}
