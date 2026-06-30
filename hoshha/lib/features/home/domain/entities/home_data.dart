import 'package:equatable/equatable.dart';
import '../../../transaction/domain/entities/transaction_entity.dart';

class HomeData extends Equatable {
  final double currentBalance;
  final double balanceTrend; // e.g. 12.5
  final double income;
  final double expenses;
  final double savings;
  final int healthScore;
  final String savingsGoalTitle;
  final double savingsGoalCurrent;
  final double savingsGoalTarget;
  final String aiInsight;
  final List<TransactionEntity> recentTransactions;

  const HomeData({
    required this.currentBalance,
    required this.balanceTrend,
    required this.income,
    required this.expenses,
    required this.savings,
    required this.healthScore,
    required this.savingsGoalTitle,
    required this.savingsGoalCurrent,
    required this.savingsGoalTarget,
    required this.aiInsight,
    required this.recentTransactions,
  });

  @override
  List<Object?> get props => [
        currentBalance,
        balanceTrend,
        income,
        expenses,
        savings,
        healthScore,
        savingsGoalTitle,
        savingsGoalCurrent,
        savingsGoalTarget,
        aiInsight,
        recentTransactions,
      ];
}
