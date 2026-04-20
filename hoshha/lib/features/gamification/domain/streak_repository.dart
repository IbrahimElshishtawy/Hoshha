import 'streak.dart';

abstract class StreakRepository {
  Future<Streak?> getStreak(StreakType type);

  Future<Streak> saveStreak(Streak streak);
}
