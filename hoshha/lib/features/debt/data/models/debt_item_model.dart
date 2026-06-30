import '../../domain/entities/debt_item.dart';

class DebtItemModel extends DebtItem {
  const DebtItemModel({
    required super.personName,
    required super.amount,
    required super.dueDate,
    required super.description,
  });

  factory DebtItemModel.fromJson(Map<String, dynamic> json) {
    return DebtItemModel(
      personName: json['personName'] as String,
      amount: (json['amount'] as num).toDouble(),
      dueDate: json['dueDate'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personName': personName,
      'amount': amount,
      'dueDate': dueDate,
      'description': description,
    };
  }
}
