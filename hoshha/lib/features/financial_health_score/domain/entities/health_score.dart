class DetailedScore {
  final String title;
  final int score;
  final String iconDataString;
  final String colorHex;

  const DetailedScore({
    required this.title,
    required this.score,
    required this.iconDataString,
    required this.colorHex,
  });
}

class HealthScore {
  final int overallScore;
  final String statusText;
  final String aiTip;
  final List<DetailedScore> detailedScores;
  final List<int> last3MonthsTrend;

  const HealthScore({
    required this.overallScore,
    required this.statusText,
    required this.aiTip,
    required this.detailedScores,
    required this.last3MonthsTrend,
  });
}
