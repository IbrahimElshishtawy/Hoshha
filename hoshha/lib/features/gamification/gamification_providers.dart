import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_providers.dart';
import '../budgets/budget_providers.dart';
import '../expenses/expenses_providers.dart';
import 'application/commands/evaluate_achievements.dart';
import 'application/commands/refresh_streak.dart';
import 'application/commands/refresh_user_stats.dart';
import 'application/models/gamification_snapshot.dart';
import 'application/queries/get_gamification_snapshot.dart';
import 'application/services/achievement_projector.dart';
import 'application/services/streak_projector.dart';
import 'application/services/user_stats_projector.dart';
import 'data/local/gamification_local_providers.dart';
import 'data/repositories/local_achievements_repository.dart';
import 'data/repositories/local_streak_repository.dart';
import 'data/repositories/local_user_stats_repository.dart';
import 'domain/achievements_repository.dart';
import 'domain/streak_repository.dart';
import 'domain/user_stats_repository.dart';

final userStatsRepositoryProvider = Provider<UserStatsRepository>(
  (ref) => LocalUserStatsRepository(ref.watch(statsLocalDataSourceProvider)),
  name: 'userStatsRepositoryProvider',
);

final streakRepositoryProvider = Provider<StreakRepository>(
  (ref) => LocalStreakRepository(ref.watch(streaksLocalDataSourceProvider)),
  name: 'streakRepositoryProvider',
);

final achievementsRepositoryProvider = Provider<AchievementsRepository>(
  (ref) =>
      LocalAchievementsRepository(ref.watch(achievementsLocalDataSourceProvider)),
  name: 'achievementsRepositoryProvider',
);

final userStatsProjectorProvider = Provider<UserStatsProjector>(
  (ref) => const UserStatsProjector(),
  name: 'userStatsProjectorProvider',
);

final streakProjectorProvider = Provider<StreakProjector>(
  (ref) => const StreakProjector(),
  name: 'streakProjectorProvider',
);

final achievementProjectorProvider = Provider<AchievementProjector>(
  (ref) => const AchievementProjector(),
  name: 'achievementProjectorProvider',
);

final refreshUserStatsProvider = Provider<RefreshUserStats>(
  (ref) => RefreshUserStats(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    userStatsRepository: ref.watch(userStatsRepositoryProvider),
    userStatsProjector: ref.watch(userStatsProjectorProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'refreshUserStatsProvider',
);

final refreshStreakProvider = Provider<RefreshStreak>(
  (ref) => RefreshStreak(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    streakRepository: ref.watch(streakRepositoryProvider),
    streakProjector: ref.watch(streakProjectorProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'refreshStreakProvider',
);

final evaluateAchievementsProvider = Provider<EvaluateAchievements>(
  (ref) => EvaluateAchievements(
    achievementsRepository: ref.watch(achievementsRepositoryProvider),
    userStatsRepository: ref.watch(userStatsRepositoryProvider),
    streakRepository: ref.watch(streakRepositoryProvider),
    budgetRepository: ref.watch(budgetRepositoryProvider),
    getMonthlySummary: ref.watch(getMonthlySummaryProvider),
    userStatsProjector: ref.watch(userStatsProjectorProvider),
    streakProjector: ref.watch(streakProjectorProvider),
    achievementProjector: ref.watch(achievementProjectorProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'evaluateAchievementsProvider',
);

final getGamificationSnapshotProvider = Provider<GetGamificationSnapshot>(
  (ref) => GetGamificationSnapshot(
    userStatsRepository: ref.watch(userStatsRepositoryProvider),
    streakRepository: ref.watch(streakRepositoryProvider),
    achievementsRepository: ref.watch(achievementsRepositoryProvider),
    userStatsProjector: ref.watch(userStatsProjectorProvider),
    streakProjector: ref.watch(streakProjectorProvider),
    achievementProjector: ref.watch(achievementProjectorProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'getGamificationSnapshotProvider',
);

final gamificationSnapshotProvider = FutureProvider<GamificationSnapshot>(
  (ref) => ref.watch(getGamificationSnapshotProvider).call(),
  name: 'gamificationSnapshotProvider',
);
