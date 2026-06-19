import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/home_data_source.dart';
import '../../data/datasources/mock_home_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_dashboard_data.dart';
import '../../domain/entities/home_transaction.dart';
import '../../domain/repositories/home_repository.dart';

class HomeState {
  const HomeState({
    required this.dashboardData,
    required this.transactions,
  });

  final HomeDashboardData dashboardData;
  final List<HomeTransaction> transactions;
}

// Data source provider (keeps state in memory)
final homeDataSourceProvider = Provider<HomeDataSource>((ref) {
  return MockHomeDataSource();
}, name: 'homeDataSourceProvider');

// Repository provider
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dataSource = ref.watch(homeDataSourceProvider);
  return HomeRepositoryImpl(dataSource);
}, name: 'homeRepositoryProvider');

class HomeController extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    final repository = ref.watch(homeRepositoryProvider);

    final dashboardResult = await repository.getDashboardData();
    final transactionsResult = await repository.getRecentTransactions();

    if (dashboardResult.isFailure) {
      throw Exception('Failed to load dashboard data');
    }
    if (transactionsResult.isFailure) {
      throw Exception('Failed to load recent transactions');
    }

    final dashboard = (dashboardResult as dynamic).value as HomeDashboardData;
    final transactions = (transactionsResult as dynamic).value as List<HomeTransaction>;

    return HomeState(
      dashboardData: dashboard,
      transactions: transactions,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<void> addMockTransaction({
    required String titleEn,
    required String titleAr,
    required double amount,
    required String category,
    required bool isIncome,
  }) async {
    final repository = ref.read(homeRepositoryProvider);
    final transaction = HomeTransaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titleEn: titleEn,
      titleAr: titleAr,
      date: DateTime.now(),
      amount: amount,
      category: category,
      isIncome: isIncome,
    );

    // Save previous state to revert if needed or just show loading
    final previousState = state;
    state = const AsyncLoading();

    final result = await repository.addTransaction(transaction);
    if (result.isSuccess) {
      // Re-trigger build to load the updated statistics and transactions list
      state = await AsyncValue.guard(build);
    } else {
      state = previousState;
    }
  }
}

final homeControllerProvider = AsyncNotifierProvider<HomeController, HomeState>(
  HomeController.new,
  name: 'homeControllerProvider',
);
