import '../models/home_dashboard_data_model.dart';
import '../models/home_transaction_model.dart';

abstract interface class HomeDataSource {
  Future<HomeDashboardDataModel> getDashboardData();

  Future<List<HomeTransactionModel>> getRecentTransactions();

  Future<void> addTransaction(HomeTransactionModel transaction);
}
