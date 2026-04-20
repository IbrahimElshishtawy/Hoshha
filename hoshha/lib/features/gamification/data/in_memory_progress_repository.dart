import '../domain/player_progress.dart';
import '../domain/progress_repository.dart';

class InMemoryProgressRepository implements ProgressRepository {
  @override
  Future<PlayerProgress> getProgress() async {
    return const PlayerProgress(level: 3, streakDays: 7, xp: 180);
  }
}
