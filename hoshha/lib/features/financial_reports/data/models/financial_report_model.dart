import '../../domain/entities/financial_report.dart';

class CategorySpendingModel extends CategorySpending {
  const CategorySpendingModel({
    required super.categoryName,
    required super.amount,
    required super.percentage,
    required super.iconDataString,
    required super.colorHex,
  });

  factory CategorySpendingModel.fromJson(Map<String, dynamic> json) {
    return CategorySpendingModel(
      categoryName: json['categoryName'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
      iconDataString: json['iconDataString'] as String,
      colorHex: json['colorHex'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'amount': amount,
      'percentage': percentage,
      'iconDataString': iconDataString,
      'colorHex': colorHex,
    };
  }
}

class FinancialReportModel extends FinancialReport {
  const FinancialReportModel({
    required super.month,
    required super.totalIncome,
    required super.totalExpense,
    required super.netSavings,
    required super.topCategories,
    required super.dailyTrend,
  });

  factory FinancialReportModel.fromJson(Map<String, dynamic> json) {
    return FinancialReportModel(
      month: DateTime.parse(json['month'] as String),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      netSavings: (json['netSavings'] as num).toDouble(),
      topCategories: (json['topCategories'] as List<dynamic>)
          .map((e) => CategorySpendingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyTrend: (json['dailyTrend'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month.toIso8601String(),
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
      'netSavings': netSavings,
      'topCategories': topCategories.map((e) => (e as CategorySpendingModel).toJson()).toList(),
      'dailyTrend': dailyTrend,
    };
  }
}
