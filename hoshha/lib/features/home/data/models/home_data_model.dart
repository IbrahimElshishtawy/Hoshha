import '../../../transaction/data/models/transaction_model.dart';
import '../../domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.currentBalance,
    required super.balanceTrend,
    required super.income,
    required super.expenses,
    required super.savings,
    required super.healthScore,
    required super.savingsGoalTitle,
    required super.savingsGoalCurrent,
    required super.savingsGoalTarget,
    required super.aiInsight,
    required super.recentTransactions,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    var list = json['recentTransactions'] as List? ?? [];
    List<TransactionModel> txList =
        list.map((i) => TransactionModel.fromJson(i as Map<String, dynamic>)).toList();

    return HomeDataModel(
      currentBalance: (json['currentBalance'] as num).toDouble(),
      balanceTrend: (json['balanceTrend'] as num).toDouble(),
      income: (json['income'] as num).toDouble(),
      expenses: (json['expenses'] as num).toDouble(),
      savings: (json['savings'] as num).toDouble(),
      healthScore: json['healthScore'] as int,
      savingsGoalTitle: json['savingsGoalTitle'] as String,
      savingsGoalCurrent: (json['savingsGoalCurrent'] as num).toDouble(),
      savingsGoalTarget: (json['savingsGoalTarget'] as num).toDouble(),
      aiInsight: json['aiInsight'] as String,
      recentTransactions: txList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentBalance': currentBalance,
      'balanceTrend': balanceTrend,
      'income': income,
      'expenses': expenses,
      'savings': savings,
      'healthScore': healthScore,
      'savingsGoalTitle': savingsGoalTitle,
      'savingsGoalCurrent': savingsGoalCurrent,
      'savingsGoalTarget': savingsGoalTarget,
      'aiInsight': aiInsight,
      'recentTransactions': recentTransactions
          .map((tx) => (tx as TransactionModel).toJson())
          .toList(),
    };
  }
}
