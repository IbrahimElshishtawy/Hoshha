import '../../../transaction/data/models/transaction_model.dart';
import '../models/home_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<HomeDataModel> getHomeData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return const HomeDataModel(
      currentBalance: 45250.00,
      balanceTrend: 12.5,
      income: 15000.0,
      expenses: 4200.0,
      savings: 10800.0,
      healthScore: 85,
      savingsGoalTitle: 'سيارة جديدة',
      savingsGoalCurrent: 75000.0,
      savingsGoalTarget: 120000.0,
      aiInsight: 'يمكنك توفير 500 ريال إضافية هذا الشهر من خلال تقليل مصاريف المقاهي. هل تود تحديد ميزانية مخصصة؟',
      recentTransactions: [
        TransactionModel(
          id: 'tx-1',
          title: 'أمازون',
          amount: 250.0,
          type: 'expense',
          category: 'shopping_bag',
          date: 'اليوم، 2:30 م',
          time: '2:30 م',
          notes: 'شراء مستلزمات مكتبية',
        ),
        TransactionModel(
          id: 'tx-2',
          title: 'الراتب الشهري',
          amount: 15000.0,
          type: 'income',
          category: 'payments',
          date: '25 أكتوبر',
          time: '9:00 ص',
          notes: 'راتب شهر أكتوبر',
        ),
        TransactionModel(
          id: 'tx-3',
          title: 'إيجار السكن',
          amount: 3000.0,
          type: 'expense',
          category: 'home_work',
          date: '24 أكتوبر',
          time: '12:00 م',
          notes: 'دفعة الإيجار الشهرية',
        ),
      ],
    );
  }
}
