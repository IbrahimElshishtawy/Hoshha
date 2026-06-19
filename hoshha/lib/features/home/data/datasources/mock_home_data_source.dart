import '../models/home_dashboard_data_model.dart';
import '../models/home_transaction_model.dart';
import 'home_data_source.dart';

class MockHomeDataSource implements HomeDataSource {
  MockHomeDataSource() {
    _initMockData();
  }

  late HomeDashboardDataModel _dashboardData;
  late List<HomeTransactionModel> _transactions;

  void _initMockData() {
    _dashboardData = const HomeDashboardDataModel(
      currentBalance: 15420.0,
      todayExpenses: 450.0,
      monthExpenses: 6200.0,
      budgetPercentage: 92.0,
      smartTipEn: 'Your spending on restaurants increased by 15% this week. We recommend saving an extra 200 EGP to reach your monthly goal.',
      smartTipAr: 'زاد إنفاقك على المطاعم بنسبة ١٥٪ هذا الأسبوع. ننصحك بتوفير ٢٠٠ جنيه إضافية لتصل لهدفك الشهري.',
    );

    _transactions = [
      HomeTransactionModel(
        id: '1',
        titleEn: "McDonald's",
        titleAr: 'ماكدونالدز',
        date: DateTime.now().subtract(const Duration(hours: 2)), // Today, 12:30 PM
        amount: 150.0,
        category: 'food',
        isIncome: false,
      ),
      HomeTransactionModel(
        id: '2',
        titleEn: 'Monthly Salary',
        titleAr: 'الراتب الشهري',
        date: DateTime.now().subtract(const Duration(days: 1)), // Yesterday, 9:00 AM
        amount: 10000.0,
        category: 'salary',
        isIncome: true,
      ),
      HomeTransactionModel(
        id: '3',
        titleEn: 'Internet Bill',
        titleAr: 'فاتورة الإنترنت',
        date: DateTime(2026, 5, 24, 16, 15), // 24 May, 4:15 PM
        amount: 300.0,
        category: 'utilities',
        isIncome: false,
      ),
      HomeTransactionModel(
        id: '4',
        titleEn: 'Uber',
        titleAr: 'أوبر',
        date: DateTime(2026, 5, 23, 20, 45), // 23 May, 8:45 PM
        amount: 85.0,
        category: 'transport',
        isIncome: false,
      ),
    ];
  }

  @override
  Future<HomeDashboardDataModel> getDashboardData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _dashboardData;
  }

  @override
  Future<List<HomeTransactionModel>> getRecentTransactions() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_transactions);
  }

  @override
  Future<void> addTransaction(HomeTransactionModel transaction) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _transactions.insert(0, transaction);

    // Update dashboard statistics
    double newBalance = _dashboardData.currentBalance;
    double newTodayExpenses = _dashboardData.todayExpenses;
    double newMonthExpenses = _dashboardData.monthExpenses;

    if (transaction.isIncome) {
      newBalance += transaction.amount;
    } else {
      newBalance -= transaction.amount;
      newTodayExpenses += transaction.amount;
      newMonthExpenses += transaction.amount;
    }

    // Budget percentage could adapt slightly based on expenses
    double newBudgetPercent = _dashboardData.budgetPercentage;
    if (newMonthExpenses > 7000) {
      newBudgetPercent = 78.0;
    } else if (newMonthExpenses > 6500) {
      newBudgetPercent = 85.0;
    }

    _dashboardData = HomeDashboardDataModel(
      currentBalance: newBalance,
      todayExpenses: newTodayExpenses,
      monthExpenses: newMonthExpenses,
      budgetPercentage: newBudgetPercent,
      smartTipEn: _dashboardData.smartTipEn,
      smartTipAr: _dashboardData.smartTipAr,
    );
  }
}
