class CategorySpending {
  final String categoryName;
  final double amount;
  final double percentage;
  final String iconDataString;
  final String colorHex;

  const CategorySpending({
    required this.categoryName,
    required this.amount,
    required this.percentage,
    required this.iconDataString,
    required this.colorHex,
  });
}

class FinancialReport {
  final DateTime month;
  final double totalIncome;
  final double totalExpense;
  final double netSavings;
  final List<CategorySpending> topCategories;
  final List<double> dailyTrend; // daily spending amounts for simple bar chart

  const FinancialReport({
    required this.month,
    required this.totalIncome,
    required this.totalExpense,
    required this.netSavings,
    required this.topCategories,
    required this.dailyTrend,
  });
}
