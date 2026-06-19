import 'package:hoshha/core/result/result.dart';
import '../entities/home_dashboard_data.dart';
import '../entities/home_transaction.dart';

abstract interface class HomeRepository {
  Future<Result<HomeDashboardData>> getDashboardData();

  Future<Result<List<HomeTransaction>>> getRecentTransactions();

  Future<Result<void>> addTransaction(HomeTransaction transaction);
}
