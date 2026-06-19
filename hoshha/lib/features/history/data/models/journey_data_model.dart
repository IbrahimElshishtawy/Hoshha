import '../../domain/entities/journey_data.dart';

class JourneyDataModel extends JourneyData {
  const JourneyDataModel({
    required super.totalSavings,
    required super.totalIncome,
    required super.totalExpenses,
    required super.goalsAchievedCount,
    required super.goalsAchievedPercent,
    required super.bestSavingsMonthNameEn,
    required super.bestSavingsMonthNameAr,
    required super.bestSavingsMonthAmount,
    required super.bestSavingsMonthPercent,
    required super.lowestSavingsMonthNameEn,
    required super.lowestSavingsMonthNameAr,
    required super.lowestSavingsMonthSpendingPercent,
    required super.lowestSavingsMonthReasonEn,
    required super.lowestSavingsMonthReasonAr,
    required super.treeGrowthStageEn,
    required super.treeGrowthStageAr,
    required super.treeGrowthNextStageEn,
    required super.treeGrowthNextStageAr,
    required super.treeGrowthRankEn,
    required super.treeGrowthRankAr,
  });

  factory JourneyDataModel.fromJson(Map<String, dynamic> json) {
    return JourneyDataModel(
      totalSavings: (json['totalSavings'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      goalsAchievedCount: json['goalsAchievedCount'] as int,
      goalsAchievedPercent: (json['goalsAchievedPercent'] as num).toDouble(),
      bestSavingsMonthNameEn: json['bestSavingsMonthNameEn'] as String,
      bestSavingsMonthNameAr: json['bestSavingsMonthNameAr'] as String,
      bestSavingsMonthAmount: (json['bestSavingsMonthAmount'] as num).toDouble(),
      bestSavingsMonthPercent: (json['bestSavingsMonthPercent'] as num).toDouble(),
      lowestSavingsMonthNameEn: json['lowestSavingsMonthNameEn'] as String,
      lowestSavingsMonthNameAr: json['lowestSavingsMonthNameAr'] as String,
      lowestSavingsMonthSpendingPercent: (json['lowestSavingsMonthSpendingPercent'] as num).toDouble(),
      lowestSavingsMonthReasonEn: json['lowestSavingsMonthReasonEn'] as String,
      lowestSavingsMonthReasonAr: json['lowestSavingsMonthReasonAr'] as String,
      treeGrowthStageEn: json['treeGrowthStageEn'] as String,
      treeGrowthStageAr: json['treeGrowthStageAr'] as String,
      treeGrowthNextStageEn: json['treeGrowthNextStageEn'] as String,
      treeGrowthNextStageAr: json['treeGrowthNextStageAr'] as String,
      treeGrowthRankEn: json['treeGrowthRankEn'] as String,
      treeGrowthRankAr: json['treeGrowthRankAr'] as String,
    );
  }
}
