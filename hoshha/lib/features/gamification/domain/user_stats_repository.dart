import 'user_stats.dart';

abstract class UserStatsRepository {
  Future<UserStats?> getUserStats();

  Future<UserStats> saveUserStats(UserStats stats);
}
