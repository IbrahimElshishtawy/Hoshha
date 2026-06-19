import '../../domain/entities/home_dashboard_data.dart';

class HomeDashboardDataModel extends HomeDashboardData {
  const HomeDashboardDataModel({
    required super.currentBalance,
    required super.todayExpenses,
    required super.monthExpenses,
    required super.budgetPercentage,
    required super.smartTipEn,
    required super.smartTipAr,
  });

  factory HomeDashboardDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDashboardDataModel(
      currentBalance: (json['currentBalance'] as num).toDouble(),
      todayExpenses: (json['todayExpenses'] as num).toDouble(),
      monthExpenses: (json['monthExpenses'] as num).toDouble(),
      budgetPercentage: (json['budgetPercentage'] as num).toDouble(),
      smartTipEn: json['smartTipEn'] as String,
      smartTipAr: json['smartTipAr'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentBalance': currentBalance,
      'todayExpenses': todayExpenses,
      'monthExpenses': monthExpenses,
      'budgetPercentage': budgetPercentage,
      'smartTipEn': smartTipEn,
      'smartTipAr': smartTipAr,
    };
  }

  factory HomeDashboardDataModel.fromEntity(HomeDashboardData entity) {
    return HomeDashboardDataModel(
      currentBalance: entity.currentBalance,
      todayExpenses: entity.todayExpenses,
      monthExpenses: entity.monthExpenses,
      budgetPercentage: entity.budgetPercentage,
      smartTipEn: entity.smartTipEn,
      smartTipAr: entity.smartTipAr,
    );
  }
}
