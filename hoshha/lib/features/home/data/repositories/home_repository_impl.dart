import 'package:hoshha/core/errors/app_failure.dart';
import 'package:hoshha/core/result/result.dart';
import '../../domain/entities/home_dashboard_data.dart';
import '../../domain/entities/home_transaction.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';
import '../models/home_transaction_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._dataSource);

  final HomeDataSource _dataSource;

  @override
  Future<Result<HomeDashboardData>> getDashboardData() async {
    try {
      final model = await _dataSource.getDashboardData();
      return Success(model);
    } catch (e) {
      return Failure(
        AppFailure(
          type: AppFailureType.unknown,
          message: 'Failed to load dashboard data',
          cause: e,
        ),
      );
    }
  }

  @override
  Future<Result<List<HomeTransaction>>> getRecentTransactions() async {
    try {
      final models = await _dataSource.getRecentTransactions();
      return Success(models);
    } catch (e) {
      return Failure(
        AppFailure(
          type: AppFailureType.unknown,
          message: 'Failed to load recent transactions',
          cause: e,
        ),
      );
    }
  }

  @override
  Future<Result<void>> addTransaction(HomeTransaction transaction) async {
    try {
      final model = HomeTransactionModel.fromEntity(transaction);
      await _dataSource.addTransaction(model);
      return const Success(null);
    } catch (e) {
      return Failure(
        AppFailure(
          type: AppFailureType.unknown,
          message: 'Failed to add transaction',
          cause: e,
        ),
      );
    }
  }
}
