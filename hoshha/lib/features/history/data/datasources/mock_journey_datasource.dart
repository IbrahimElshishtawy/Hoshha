import '../../domain/entities/journey_milestone.dart';
import '../models/journey_data_model.dart';
import 'journey_datasource.dart';

class MockJourneyDataSource implements JourneyDataSource {
  @override
  Future<JourneyDataModel> getJourneyData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const JourneyDataModel(
      totalSavings: 85400.0,
      totalIncome: 120000.0,
      totalExpenses: 34600.0,
      goalsAchievedCount: 4,
      goalsAchievedPercent: 80.0,
      bestSavingsMonthNameEn: 'October 2023',
      bestSavingsMonthNameAr: 'أكتوبر ٢٠٢٣',
      bestSavingsMonthAmount: 12000.0,
      bestSavingsMonthPercent: 45.0,
      lowestSavingsMonthNameEn: 'January 2024',
      lowestSavingsMonthNameAr: 'يناير ٢٠٢٤',
      lowestSavingsMonthSpendingPercent: 85.0,
      lowestSavingsMonthReasonEn: 'Eid expenses',
      lowestSavingsMonthReasonAr: 'مصاريف العيد',
      treeGrowthStageEn: 'maturity',
      treeGrowthStageAr: 'النضوج',
      treeGrowthNextStageEn: 'full bloom',
      treeGrowthNextStageAr: 'الازدهار الكامل',
      treeGrowthRankEn: 'Savings Legend',
      treeGrowthRankAr: 'أسطورة التوفير',
    );
  }

  @override
  Future<List<JourneyMilestone>> getJourneyMilestones() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      JourneyMilestone(
        id: '1',
        dateEn: 'March 2024',
        dateAr: 'مارس ٢٠٢٤',
        titleEn: 'Highest Monthly Savings Rate',
        titleAr: 'أعلى نسبة توفير شهرية',
        descriptionEn: 'Achieved a record by saving 60% of March\'s income.',
        descriptionAr: 'حققت رقماً قياسياً بتوفير ٦٠٪ من دخل شهر مارس.',
        iconType: 'star',
      ),
      JourneyMilestone(
        id: '2',
        dateEn: 'December 2023',
        dateAr: 'ديسمبر ٢٠٢٣',
        titleEn: 'Achieved the "Laptop" Goal',
        titleAr: 'تحقيق هدف "اللابتوب"',
        descriptionEn: 'The new device was bought in cash from Hawsha savings.',
        descriptionAr: 'تم شراء الجهاز الجديد نقداً من حصيلة مدخرات حوشة.',
        iconType: 'laptop',
        imageUrl: 'https://images.unsplash.com/photo-1496181130204-755241544e35?w=500&auto=format&fit=crop',
      ),
      JourneyMilestone(
        id: '3',
        dateEn: 'August 2023',
        dateAr: 'أغسطس ٢٠٢٣',
        titleEn: 'First 1,000 EGP saved',
        titleAr: 'أول ١,٠٠٠ ج.م توفير',
        descriptionEn: 'The start of a downpour is a drop, this was the first real step in your journey.',
        descriptionAr: 'بداية الغيث قطرة، كانت هذه أول خطوة حقيقية في رحلتك.',
        iconType: 'teal_card',
      ),
      JourneyMilestone(
        id: '4',
        dateEn: '1 year ago',
        dateAr: 'قبل عام',
        titleEn: 'Joined Hawsha',
        titleAr: 'الانضمام إلى حوشة',
        descriptionEn: 'The day you decided to take control of your financial future.',
        descriptionAr: 'اليوم الذي قررت فيه التحكم في مستقبلك المالي.',
        iconType: 'clock',
      ),
    ];
  }
}
