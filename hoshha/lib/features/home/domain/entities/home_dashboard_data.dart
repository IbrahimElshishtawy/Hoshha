class HomeDashboardData {
  const HomeDashboardData({
    required this.currentBalance,
    required this.todayExpenses,
    required this.monthExpenses,
    required this.budgetPercentage,
    required this.smartTipEn,
    required this.smartTipAr,
  });

  final double currentBalance;
  final double todayExpenses;
  final double monthExpenses;
  final double budgetPercentage;
  final String smartTipEn;
  final String smartTipAr;

  HomeDashboardData copyWith({
    double? currentBalance,
    double? todayExpenses,
    double? monthExpenses,
    double? budgetPercentage,
    String? smartTipEn,
    String? smartTipAr,
  }) {
    return HomeDashboardData(
      currentBalance: currentBalance ?? this.currentBalance,
      todayExpenses: todayExpenses ?? this.todayExpenses,
      monthExpenses: monthExpenses ?? this.monthExpenses,
      budgetPercentage: budgetPercentage ?? this.budgetPercentage,
      smartTipEn: smartTipEn ?? this.smartTipEn,
      smartTipAr: smartTipAr ?? this.smartTipAr,
    );
  }
}
