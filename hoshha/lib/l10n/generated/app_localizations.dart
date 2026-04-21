import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Hoshha'**
  String get appTitle;

  /// No description provided for @homeGreetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get homeGreetingTitle;

  /// No description provided for @homeGreetingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here is a quick look at your spending and progress this month.'**
  String get homeGreetingSubtitle;

  /// No description provided for @homeThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get homeThisMonth;

  /// No description provided for @homePrimaryActionAddExpense.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get homePrimaryActionAddExpense;

  /// No description provided for @homeBudgetSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget summary'**
  String get homeBudgetSectionTitle;

  /// No description provided for @homeGamificationSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress summary'**
  String get homeGamificationSectionTitle;

  /// No description provided for @homeRecentExpensesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent expenses'**
  String get homeRecentExpensesSectionTitle;

  /// No description provided for @homeViewAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get homeViewAll;

  /// No description provided for @homeRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get homeRetry;

  /// No description provided for @homeComingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'This flow will be wired in a later step.'**
  String get homeComingSoonMessage;

  /// No description provided for @homeSectionLoadFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to load {section}'**
  String homeSectionLoadFailure(Object section);

  /// No description provided for @homeBudgetSpentLabel.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get homeBudgetSpentLabel;

  /// No description provided for @homeBudgetRemainingLabel.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get homeBudgetRemainingLabel;

  /// No description provided for @homeBudgetLimitLabel.
  ///
  /// In en, this message translates to:
  /// **'Budget cap {amount}'**
  String homeBudgetLimitLabel(Object amount);

  /// No description provided for @homeBudgetStatusSafe.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get homeBudgetStatusSafe;

  /// No description provided for @homeBudgetStatusWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get homeBudgetStatusWarning;

  /// No description provided for @homeBudgetStatusExceeded.
  ///
  /// In en, this message translates to:
  /// **'Exceeded'**
  String get homeBudgetStatusExceeded;

  /// No description provided for @homeBudgetNoBudgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Set a budget for this month'**
  String get homeBudgetNoBudgetTitle;

  /// No description provided for @homeBudgetNoBudgetMessage.
  ///
  /// In en, this message translates to:
  /// **'Once you set a monthly cap, we will show your remaining budget and status here.'**
  String get homeBudgetNoBudgetMessage;

  /// No description provided for @homeBudgetSetAction.
  ///
  /// In en, this message translates to:
  /// **'Set budget'**
  String get homeBudgetSetAction;

  /// No description provided for @homeBudgetEditAction.
  ///
  /// In en, this message translates to:
  /// **'Edit budget'**
  String get homeBudgetEditAction;

  /// No description provided for @homeBudgetOverflowMessage.
  ///
  /// In en, this message translates to:
  /// **'You exceeded your budget by {amount}'**
  String homeBudgetOverflowMessage(Object amount);

  /// No description provided for @homeGamificationXpLabel.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get homeGamificationXpLabel;

  /// No description provided for @homeGamificationLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String homeGamificationLevelLabel(int level);

  /// No description provided for @homeGamificationStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'{days} day streak'**
  String homeGamificationStreakLabel(int days);

  /// No description provided for @homeGamificationNextLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'{percent}% to the next level'**
  String homeGamificationNextLevelLabel(int percent);

  /// No description provided for @homeGamificationEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Your first logged expense will start your progress.'**
  String get homeGamificationEmptyMessage;

  /// No description provided for @homeGamificationActiveMessage.
  ///
  /// In en, this message translates to:
  /// **'Keep going. Every expense you log moves you forward.'**
  String get homeGamificationActiveMessage;

  /// No description provided for @homeRecentExpensesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No expenses yet'**
  String get homeRecentExpensesEmptyTitle;

  /// No description provided for @homeRecentExpensesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add your first expense and your latest activity will appear here.'**
  String get homeRecentExpensesEmptyMessage;

  /// No description provided for @homeExpenseNoCategory.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get homeExpenseNoCategory;

  /// No description provided for @dashboardMonthlySpendTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly spend'**
  String get dashboardMonthlySpendTitle;

  /// No description provided for @dashboardMonthlySpendSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} tracked expenses'**
  String dashboardMonthlySpendSubtitle(int count);

  /// No description provided for @dashboardBudgetRemainingTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget remaining'**
  String get dashboardBudgetRemainingTitle;

  /// No description provided for @dashboardBudgetRemainingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Budget cap {limit}'**
  String dashboardBudgetRemainingSubtitle(Object limit);

  /// No description provided for @dashboardGamificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Gamification'**
  String get dashboardGamificationTitle;

  /// No description provided for @dashboardGamificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{streak} day streak | {xp} XP'**
  String dashboardGamificationSubtitle(int streak, int xp);

  /// No description provided for @dashboardLoadFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard snapshot: {error}'**
  String dashboardLoadFailure(Object error);

  /// No description provided for @environmentChip.
  ///
  /// In en, this message translates to:
  /// **'Environment: {value}'**
  String environmentChip(Object value);

  /// No description provided for @authChip.
  ///
  /// In en, this message translates to:
  /// **'Auth: {value}'**
  String authChip(Object value);

  /// No description provided for @premiumChip.
  ///
  /// In en, this message translates to:
  /// **'Premium: {value}'**
  String premiumChip(Object value);

  /// No description provided for @updatesChip.
  ///
  /// In en, this message translates to:
  /// **'Updates: {value}'**
  String updatesChip(Object value);

  /// No description provided for @syncChip.
  ///
  /// In en, this message translates to:
  /// **'Sync: {value}'**
  String syncChip(Object value);

  /// No description provided for @statusEnabled.
  ///
  /// In en, this message translates to:
  /// **'on'**
  String get statusEnabled;

  /// No description provided for @statusDisabled.
  ///
  /// In en, this message translates to:
  /// **'off'**
  String get statusDisabled;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
