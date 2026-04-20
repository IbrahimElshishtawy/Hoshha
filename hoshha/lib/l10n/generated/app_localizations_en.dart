// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hoshha';

  @override
  String get dashboardMonthlySpendTitle => 'Monthly spend';

  @override
  String dashboardMonthlySpendSubtitle(int count) {
    return '$count tracked expenses';
  }

  @override
  String get dashboardBudgetRemainingTitle => 'Budget remaining';

  @override
  String dashboardBudgetRemainingSubtitle(Object limit) {
    return 'Budget cap $limit';
  }

  @override
  String get dashboardGamificationTitle => 'Gamification';

  @override
  String dashboardGamificationSubtitle(int streak, int xp) {
    return '$streak day streak | $xp XP';
  }

  @override
  String dashboardLoadFailure(Object error) {
    return 'Failed to load dashboard snapshot: $error';
  }

  @override
  String environmentChip(Object value) {
    return 'Environment: $value';
  }

  @override
  String authChip(Object value) {
    return 'Auth: $value';
  }

  @override
  String premiumChip(Object value) {
    return 'Premium: $value';
  }

  @override
  String updatesChip(Object value) {
    return 'Updates: $value';
  }

  @override
  String syncChip(Object value) {
    return 'Sync: $value';
  }

  @override
  String get statusEnabled => 'on';

  @override
  String get statusDisabled => 'off';
}
