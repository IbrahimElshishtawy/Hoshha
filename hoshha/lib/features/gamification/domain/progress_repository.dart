import 'player_progress.dart';

abstract class ProgressRepository {
  Future<PlayerProgress> getProgress();
}
