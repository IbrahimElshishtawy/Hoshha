import 'package:flutter_bloc/flutter_bloc.dart';
import 'health_score_state.dart';
import '../../domain/entities/health_score.dart';

class HealthScoreCubit extends Cubit<HealthScoreState> {
  HealthScoreCubit() : super(HealthScoreInitial());

  void loadHealthScore() {
    emit(HealthScoreLoading());
    // Simulate loading data
    emit(HealthScoreLoaded(
      const HealthScore(
        overallScore: 87,
        statusText: 'ممتاز',
        aiTip: 'يمكنك زيادة نقاطك من خلال تنويع استثماراتك وتقليل المصاريف غير الضرورية. حاول توجيه 10% إضافية من دخلك للمحفظة الاستثمارية.',
        detailedScores: [
          DetailedScore(title: 'نتيجة الإنفاق', score: 92, iconDataString: 'shopping_cart', colorHex: '#006c49'),
          DetailedScore(title: 'نتيجة الادخار', score: 85, iconDataString: 'savings', colorHex: '#004ac6'),
          DetailedScore(title: 'نتيجة الميزانية', score: 78, iconDataString: 'account_balance_wallet', colorHex: '#ab0b1c'),
          DetailedScore(title: 'التقدم نحو الأهداف', score: 90, iconDataString: 'flag', colorHex: '#2563eb'),
        ],
        last3MonthsTrend: [65, 75, 87],
      )
    ));
  }
}
