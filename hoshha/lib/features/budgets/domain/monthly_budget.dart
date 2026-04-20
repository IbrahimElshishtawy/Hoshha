class MonthlyBudget {
  const MonthlyBudget({required this.month, required this.limitMinor});

  final DateTime month;
  final int limitMinor;

  double get limit => limitMinor / 100;
}
