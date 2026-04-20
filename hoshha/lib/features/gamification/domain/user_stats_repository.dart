import 'user_stats.dart';

abstract class UserStatsRepository {
  Future<UserStats?> getUserStats();

  Stream<UserStats?> watchUserStats();

  Future<UserStats> saveUserStats(UserStats stats);
}
