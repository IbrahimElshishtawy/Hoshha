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
}
