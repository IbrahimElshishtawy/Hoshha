import '../../domain/entities/home_transaction.dart';

class HomeTransactionModel extends HomeTransaction {
  const HomeTransactionModel({
    required super.id,
    required super.titleEn,
    required super.titleAr,
    required super.date,
    required super.amount,
    required super.category,
    required super.isIncome,
  });

  factory HomeTransactionModel.fromJson(Map<String, dynamic> json) {
    return HomeTransactionModel(
      id: json['id'] as String,
      titleEn: json['titleEn'] as String,
      titleAr: json['titleAr'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      isIncome: json['isIncome'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'date': date.toIso8601String(),
      'amount': amount,
      'category': category,
      'isIncome': isIncome,
    };
  }

  factory HomeTransactionModel.fromEntity(HomeTransaction entity) {
    return HomeTransactionModel(
      id: entity.id,
      titleEn: entity.titleEn,
      titleAr: entity.titleAr,
      date: entity.date,
      amount: entity.amount,
      category: entity.category,
      isIncome: entity.isIncome,
    );
  }
}
