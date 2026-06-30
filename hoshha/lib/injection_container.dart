import 'package:get_it/get_it.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/login_with_google_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_home_data_usecase.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

import 'features/transaction/data/datasources/transaction_remote_data_source.dart';
import 'features/transaction/data/repositories/transaction_repository_impl.dart';
import 'features/transaction/domain/repositories/transaction_repository.dart';
import 'features/transaction/domain/usecases/add_transaction_usecase.dart';
import 'features/transaction/presentation/cubit/transaction_cubit.dart';
import 'features/ai_assistant/presentation/cubit/ai_assistant_cubit.dart';
import 'features/wallet/presentation/cubit/wallet_cubit.dart';
import 'features/savings_goals/presentation/cubit/savings_goals_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'features/notifications/presentation/cubit/notifications_cubit.dart';
import 'features/debt/presentation/cubit/debt_cubit.dart';
import 'features/bills/presentation/cubit/bills_cubit.dart';
import 'features/analytics/presentation/cubit/analytics_cubit.dart';
import 'features/budget/presentation/cubit/budget_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ==================== Features - Auth ====================
  // Cubit
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      loginWithGoogleUseCase: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // ==================== Features - Home ====================
  // Cubit
  sl.registerFactory(
    () => HomeCubit(
      getHomeDataUseCase: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  // ==================== Features - Transaction ====================
  // Cubit
  sl.registerFactory(
    () => TransactionCubit(
      addTransactionUseCase: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => AddTransactionUseCase(sl()));
  // Repository
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(),
  );

  // ==================== Features - AI Assistant ====================
  // Cubit
  sl.registerFactory(() => AiAssistantCubit());

  // ==================== Features - Wallet ====================
  sl.registerFactory(() => WalletCubit());

  // ==================== Features - Savings Goals ====================
  sl.registerFactory(() => SavingsGoalsCubit());

  // ==================== Features - Profile ====================
  sl.registerFactory(() => ProfileCubit());

  // ==================== Features - Onboarding ====================
  sl.registerFactory(() => OnboardingCubit());

  // ==================== Features - Notifications ====================
  sl.registerFactory(() => NotificationsCubit());

  // ==================== Features - Debt ====================
  sl.registerFactory(() => DebtCubit());

  // ==================== Features - Bills ====================
  sl.registerFactory(() => BillsCubit());

  // ==================== Features - Analytics ====================
  sl.registerFactory(() => AnalyticsCubit());

  // ==================== Features - Budget ====================
  sl.registerFactory(() => BudgetCubit());
}
