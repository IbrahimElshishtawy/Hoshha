class JourneyData {
  const JourneyData({
    required this.totalSavings,
    required this.totalIncome,
    required this.totalExpenses,
    required this.goalsAchievedCount,
    required this.goalsAchievedPercent,
    required this.bestSavingsMonthNameEn,
    required this.bestSavingsMonthNameAr,
    required this.bestSavingsMonthAmount,
    required this.bestSavingsMonthPercent,
    required this.lowestSavingsMonthNameEn,
    required this.lowestSavingsMonthNameAr,
    required this.lowestSavingsMonthSpendingPercent,
    required this.lowestSavingsMonthReasonEn,
    required this.lowestSavingsMonthReasonAr,
    required this.treeGrowthStageEn,
    required this.treeGrowthStageAr,
    required this.treeGrowthNextStageEn,
    required this.treeGrowthNextStageAr,
    required this.treeGrowthRankEn,
    required this.treeGrowthRankAr,
  });

  final double totalSavings;
  final double totalIncome;
  final double totalExpenses;
  final int goalsAchievedCount;
  final double goalsAchievedPercent;
  final String bestSavingsMonthNameEn;
  final String bestSavingsMonthNameAr;
  final double bestSavingsMonthAmount;
  final double bestSavingsMonthPercent;
  final String lowestSavingsMonthNameEn;
  final String lowestSavingsMonthNameAr;
  final double lowestSavingsMonthSpendingPercent;
  final String lowestSavingsMonthReasonEn;
  final String lowestSavingsMonthReasonAr;
  final String treeGrowthStageEn;
  final String treeGrowthStageAr;
  final String treeGrowthNextStageEn;
  final String treeGrowthNextStageAr;
  final String treeGrowthRankEn;
  final String treeGrowthRankAr;
}
