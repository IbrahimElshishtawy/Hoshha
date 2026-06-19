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
  String get homeGreetingTitle => 'Welcome back';

  @override
  String get homeGreetingSubtitle =>
      'Here is a quick look at your spending and progress this month.';

  @override
  String get homeThisMonth => 'This month';

  @override
  String get homePrimaryActionAddExpense => 'Add expense';

  @override
  String get homeBudgetSectionTitle => 'Budget summary';

  @override
  String get homeGamificationSectionTitle => 'Progress summary';

  @override
  String get homeRecentExpensesSectionTitle => 'Recent expenses';

  @override
  String get homeViewAll => 'See all';

  @override
  String get homeRetry => 'Retry';

  @override
  String get homeComingSoonMessage =>
      'This flow will be wired in a later step.';

  @override
  String homeSectionLoadFailure(Object section) {
    return 'Failed to load $section';
  }

  @override
  String get homeBudgetSpentLabel => 'Spent';

  @override
  String get homeBudgetRemainingLabel => 'Remaining';

  @override
  String homeBudgetLimitLabel(Object amount) {
    return 'Budget cap $amount';
  }

  @override
  String get homeBudgetStatusSafe => 'Safe';

  @override
  String get homeBudgetStatusWarning => 'Warning';

  @override
  String get homeBudgetStatusExceeded => 'Exceeded';

  @override
  String get homeBudgetNoBudgetTitle => 'Set a budget for this month';

  @override
  String get homeBudgetNoBudgetMessage =>
      'Once you set a monthly cap, we will show your remaining budget and status here.';

  @override
  String get homeBudgetSetAction => 'Set budget';

  @override
  String get homeBudgetEditAction => 'Edit budget';

  @override
  String homeBudgetOverflowMessage(Object amount) {
    return 'You exceeded your budget by $amount';
  }

  @override
  String get homeGamificationXpLabel => 'XP';

  @override
  String homeGamificationLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String homeGamificationStreakLabel(int days) {
    return '$days day streak';
  }

  @override
  String homeGamificationNextLevelLabel(int percent) {
    return '$percent% to the next level';
  }

  @override
  String get homeGamificationEmptyMessage =>
      'Your first logged expense will start your progress.';

  @override
  String get homeGamificationActiveMessage =>
      'Keep going. Every expense you log moves you forward.';

  @override
  String get homeRecentExpensesEmptyTitle => 'No expenses yet';

  @override
  String get homeRecentExpensesEmptyMessage =>
      'Add your first expense and your latest activity will appear here.';

  @override
  String get homeExpenseNoCategory => 'Uncategorized';

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

  @override
  String get homeCurrentBalance => 'Current Balance';

  @override
  String get homeExpensesToday => 'Today\'s Expenses';

  @override
  String get homeExpensesMonth => 'Month\'s Expenses';

  @override
  String get homeBudgetStatusTitle => 'Budget Status';

  @override
  String get homeBudgetExcellent => 'Excellent';

  @override
  String get homeBudgetStablePerformance => 'Stable financial performance';

  @override
  String get homeSmartTipTitle => 'Smart Tip';

  @override
  String get homeSmartTipContent =>
      'Your spending on restaurants increased by 15% this week. We recommend saving an extra 200 EGP to reach your monthly goal.';

  @override
  String get homeQuickActions => 'Quick Actions';

  @override
  String get homeAddExpense => 'Add Expense';

  @override
  String get homeAddIncome => 'Add Income';

  @override
  String get homeToSavings => 'To Savings';

  @override
  String get homeCreateGoal => 'Create a Goal';

  @override
  String get homeRecentTransactions => 'Recent Transactions';

  @override
  String get homeBottomNavHome => 'Home';

  @override
  String get homeBottomNavJourney => 'Journey';

  @override
  String get homeBottomNavGoals => 'Goals';

  @override
  String get homeBottomNavIdentity => 'Identity';

  @override
  String get homeCurrency => 'EGP';

  @override
  String get homeCurrencyAbbr => 'EGP';

  @override
  String get homeToday => 'Today';

  @override
  String get homeYesterday => 'Yesterday';

  @override
  String get categoryFood => 'Food';

  @override
  String get categorySalary => 'Salary';

  @override
  String get categoryUtilities => 'Utilities';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get journeyTitle => 'My Financial Journey';

  @override
  String get journeySubtitle =>
      'A close look at what you achieved in Hawsha since you joined.';

  @override
  String get journeyTotalSavings => 'Total Savings';

  @override
  String get journeyTotalIncome => 'Total Income';

  @override
  String get journeyTotalExpenses => 'Total Expenses';

  @override
  String get journeySavingsMotivation => 'Steady steps towards independence';

  @override
  String journeyGoalsAchieved(Object count) {
    return '$count Goals Achieved';
  }

  @override
  String journeyGoalsMotivation(Object percent) {
    return 'You have achieved $percent% of your annual plan!';
  }

  @override
  String get journeyMilestones => 'Performance Milestones';

  @override
  String get journeyBestSavingsMonth => 'Best Savings Month';

  @override
  String journeySavedPercent(Object amount, Object percent) {
    return 'Saved $amount ($percent% of your income)';
  }

  @override
  String get journeyLowestSavingsMonth => 'Lowest Savings Month';

  @override
  String journeySpentPercent(Object percent, Object reason) {
    return 'Spent $percent% due to \"$reason\"';
  }

  @override
  String get journeyGrowthTree => 'Your Financial Growth Tree';

  @override
  String get journeyGrowthTreeRank => 'Rank: Savings Legend';

  @override
  String get journeyGrowthTreeText =>
      'Your tree is now in the \"maturity\" stage. Continue watering it with savings to reach the \"full bloom\" stage.';

  @override
  String get journeyTimeline => 'Your Timeline';

  @override
  String get journeyWhatNext => 'What\'s Next?';

  @override
  String get journeyWhatNextText =>
      'Your journey continues, and the next goal \"Emergency Fund\" awaits your touch.';

  @override
  String get journeyDefineNewGoal => 'Define New Goal';
}
