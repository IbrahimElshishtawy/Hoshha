// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حوشها';

  @override
  String get homeGreetingTitle => 'أهلًا بعودتك';

  @override
  String get homeGreetingSubtitle =>
      'هذه نظرة سريعة على مصاريفك وتقدمك خلال هذا الشهر.';

  @override
  String get homeThisMonth => 'هذا الشهر';

  @override
  String get homePrimaryActionAddExpense => 'إضافة مصروف';

  @override
  String get homeBudgetSectionTitle => 'ملخص الميزانية';

  @override
  String get homeGamificationSectionTitle => 'ملخص التقدم';

  @override
  String get homeRecentExpensesSectionTitle => 'أحدث المصروفات';

  @override
  String get homeViewAll => 'عرض الكل';

  @override
  String get homeRetry => 'إعادة المحاولة';

  @override
  String get homeComingSoonMessage => 'سيتم توصيل هذه الواجهة في خطوة لاحقة.';

  @override
  String homeSectionLoadFailure(Object section) {
    return 'تعذر تحميل $section';
  }

  @override
  String get homeBudgetSpentLabel => 'المصروف';

  @override
  String get homeBudgetRemainingLabel => 'المتبقي';

  @override
  String homeBudgetLimitLabel(Object amount) {
    return 'حد الميزانية $amount';
  }

  @override
  String get homeBudgetStatusSafe => 'آمن';

  @override
  String get homeBudgetStatusWarning => 'تنبيه';

  @override
  String get homeBudgetStatusExceeded => 'تم التجاوز';

  @override
  String get homeBudgetNoBudgetTitle => 'حدد ميزانية لهذا الشهر';

  @override
  String get homeBudgetNoBudgetMessage =>
      'بمجرد تحديد حد شهري سنعرض لك المتبقي وحالة الميزانية هنا.';

  @override
  String get homeBudgetSetAction => 'تحديد الميزانية';

  @override
  String get homeBudgetEditAction => 'تعديل الميزانية';

  @override
  String homeBudgetOverflowMessage(Object amount) {
    return 'تجاوزت الميزانية بمقدار $amount';
  }

  @override
  String get homeGamificationXpLabel => 'نقطة خبرة';

  @override
  String homeGamificationLevelLabel(int level) {
    return 'المستوى $level';
  }

  @override
  String homeGamificationStreakLabel(int days) {
    return 'ستريك $days أيام';
  }

  @override
  String homeGamificationNextLevelLabel(int percent) {
    return '$percent% إلى المستوى التالي';
  }

  @override
  String get homeGamificationEmptyMessage =>
      'أول مصروف تسجله سيبدأ رحلة تقدمك.';

  @override
  String get homeGamificationActiveMessage =>
      'استمر، كل مصروف تسجله يقربك أكثر.';

  @override
  String get homeRecentExpensesEmptyTitle => 'لا توجد مصروفات بعد';

  @override
  String get homeRecentExpensesEmptyMessage =>
      'أضف أول مصروف ليظهر هنا نشاطك الأخير.';

  @override
  String get homeExpenseNoCategory => 'بدون تصنيف';

  @override
  String get dashboardMonthlySpendTitle => 'المصروف الشهري';

  @override
  String dashboardMonthlySpendSubtitle(int count) {
    return '$count عملية مسجلة';
  }

  @override
  String get dashboardBudgetRemainingTitle => 'المتبقي من الميزانية';

  @override
  String dashboardBudgetRemainingSubtitle(Object limit) {
    return 'حد الميزانية $limit';
  }

  @override
  String get dashboardGamificationTitle => 'التحدي';

  @override
  String dashboardGamificationSubtitle(int streak, int xp) {
    return '$streak يوم متواصل | $xp نقطة خبرة';
  }

  @override
  String dashboardLoadFailure(Object error) {
    return 'تعذر تحميل ملخص اللوحة: $error';
  }

  @override
  String environmentChip(Object value) {
    return 'البيئة: $value';
  }

  @override
  String authChip(Object value) {
    return 'المصادقة: $value';
  }

  @override
  String premiumChip(Object value) {
    return 'الاشتراك: $value';
  }

  @override
  String updatesChip(Object value) {
    return 'التحديثات: $value';
  }

  @override
  String syncChip(Object value) {
    return 'المزامنة: $value';
  }

  @override
  String get statusEnabled => 'مفعل';

  @override
  String get statusDisabled => 'متوقف';

  @override
  String get homeCurrentBalance => 'الرصيد الحالي';

  @override
  String get homeExpensesToday => 'مصاريف اليوم';

  @override
  String get homeExpensesMonth => 'مصاريف الشهر';

  @override
  String get homeBudgetStatusTitle => 'حالة الميزانية';

  @override
  String get homeBudgetExcellent => 'ممتاز';

  @override
  String get homeBudgetStablePerformance => 'أداء مالي مستقر';

  @override
  String get homeSmartTipTitle => 'نصيحة ذكية';

  @override
  String get homeSmartTipContent =>
      'زاد إنفاقك على المطاعم بنسبة 15% هذا الأسبوع. ننصحك بتوفير 200 جنيه إضافية لتصل لهدفك الشهري.';

  @override
  String get homeQuickActions => 'إجراءات سريعة';

  @override
  String get homeAddExpense => 'أضف مصروف';

  @override
  String get homeAddIncome => 'أضف دخل';

  @override
  String get homeToSavings => 'إلى الحصالة';

  @override
  String get homeCreateGoal => 'أنشئ هدفاً';

  @override
  String get homeRecentTransactions => 'آخر المعاملات';

  @override
  String get homeBottomNavHome => 'الرئيسية';

  @override
  String get homeBottomNavJourney => 'الرحلة';

  @override
  String get homeBottomNavGoals => 'الأهداف';

  @override
  String get homeBottomNavIdentity => 'الهوية';

  @override
  String get homeCurrency => 'جنيه';

  @override
  String get homeCurrencyAbbr => 'ج.م';

  @override
  String get homeToday => 'اليوم';

  @override
  String get homeYesterday => 'أمس';

  @override
  String get categoryFood => 'طعام';

  @override
  String get categorySalary => 'راتب';

  @override
  String get categoryUtilities => 'فواتير';

  @override
  String get categoryTransport => 'مواصلات';

  @override
  String get journeyTitle => 'رحلتي المالية';

  @override
  String get journeySubtitle => 'نظرة عن كثب على ما حققته في حوشة منذ انضمامك.';

  @override
  String get journeyTotalSavings => 'إجمالي التوفير';

  @override
  String get journeyTotalIncome => 'إجمالي الدخل';

  @override
  String get journeyTotalExpenses => 'إجمالي الصرف';

  @override
  String get journeySavingsMotivation => 'خطوات ثابتة نحو الاستقلال';

  @override
  String journeyGoalsAchieved(Object count) {
    return '$count أهداف محققة';
  }

  @override
  String journeyGoalsMotivation(Object percent) {
    return 'لقد أنجزت $percent٪ من خطتك السنوية!';
  }

  @override
  String get journeyMilestones => 'محطات الأداء';

  @override
  String get journeyBestSavingsMonth => 'أفضل شهر توفير';

  @override
  String journeySavedPercent(Object amount, Object percent) {
    return 'وفرت $amount ($percent٪ من دخلك)';
  }

  @override
  String get journeyLowestSavingsMonth => 'أقل شهر توفير';

  @override
  String journeySpentPercent(Object percent, Object reason) {
    return 'صرفت $percent٪ بسبب \"$reason\"';
  }

  @override
  String get journeyGrowthTree => 'شجرة نموك المالي';

  @override
  String get journeyGrowthTreeRank => 'رتبة: أسطورة التوفير';

  @override
  String get journeyGrowthTreeText =>
      'شجرتك الآن في مرحلة \"النضوج\". استمر في ريها بالادخار لتصل إلى مرحلة \"الازدهار الكامل\".';

  @override
  String get journeyTimeline => 'خطتك الزمنية';

  @override
  String get journeyWhatNext => 'ماذا بعد؟';

  @override
  String get journeyWhatNextText =>
      'رحلتك مستمرة، والهدف القادم \"صندوق الطوارئ\" ينتظر لمستك.';

  @override
  String get journeyDefineNewGoal => 'تحديد هدف جديد';
}
