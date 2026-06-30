import '../../domain/entities/health_score.dart';

class DetailedScoreModel extends DetailedScore {
  const DetailedScoreModel({
    required super.title,
    required super.score,
    required super.iconDataString,
    required super.colorHex,
  });

  factory DetailedScoreModel.fromJson(Map<String, dynamic> json) {
    return DetailedScoreModel(
      title: json['title'] as String,
      score: json['score'] as int,
      iconDataString: json['iconDataString'] as String,
      colorHex: json['colorHex'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'score': score,
      'iconDataString': iconDataString,
      'colorHex': colorHex,
    };
  }
}

class HealthScoreModel extends HealthScore {
  const HealthScoreModel({
    required super.overallScore,
    required super.statusText,
    required super.aiTip,
    required super.detailedScores,
    required super.last3MonthsTrend,
  });

  factory HealthScoreModel.fromJson(Map<String, dynamic> json) {
    return HealthScoreModel(
      overallScore: json['overallScore'] as int,
      statusText: json['statusText'] as String,
      aiTip: json['aiTip'] as String,
      detailedScores: (json['detailedScores'] as List<dynamic>)
          .map((e) => DetailedScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      last3MonthsTrend: (json['last3MonthsTrend'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overallScore': overallScore,
      'statusText': statusText,
      'aiTip': aiTip,
      'detailedScores': detailedScores.map((e) => (e as DetailedScoreModel).toJson()).toList(),
      'last3MonthsTrend': last3MonthsTrend,
    };
  }
}
