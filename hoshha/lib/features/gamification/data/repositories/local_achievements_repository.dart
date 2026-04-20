import '../../domain/achievement_progress.dart';
import '../../domain/achievements_repository.dart';
import '../local/achievement_progress_mapper.dart';
import '../local/achievement_progress_record.dart';
import '../local/achievements_local_data_source.dart';

class LocalAchievementsRepository implements AchievementsRepository {
  LocalAchievementsRepository(this._localDataSource);

  final AchievementsLocalDataSource _localDataSource;

  @override
  Future<AchievementProgress?> getAchievement(
    AchievementId achievementId,
  ) async {
    final record = await _localDataSource.findByAchievementId(
      achievementId.name,
    );
    return record == null ? null : mapAchievementProgressRecordToDomain(record);
  }

  @override
  Future<List<AchievementProgress>> getAchievements() async {
    final records = await _localDataSource.getAll();
    return records
        .map(mapAchievementProgressRecordToDomain)
        .toList(growable: false);
  }

  @override
  Stream<List<AchievementProgress>> watchAchievements() {
    return _localDataSource.watchAll().map(
      (records) => records
          .map(mapAchievementProgressRecordToDomain)
          .toList(growable: false),
    );
  }

  @override
  Future<AchievementProgress> saveAchievement(
    AchievementProgress achievement,
  ) async {
    final existing = await _localDataSource.findByAchievementId(
      achievement.achievementId.name,
    );
    final record = mapAchievementProgressToRecord(
      achievement,
      current: existing,
    );
    await _localDataSource.putRecord(record);
    return mapAchievementProgressRecordToDomain(record);
  }

  @override
  Future<List<AchievementProgress>> saveAchievements(
    List<AchievementProgress> achievements,
  ) async {
    final records = <AchievementProgressRecord>[];
    for (final achievement in achievements) {
      final existing = await _localDataSource.findByAchievementId(
        achievement.achievementId.name,
      );
      records.add(
        mapAchievementProgressToRecord(achievement, current: existing),
      );
    }

    await _localDataSource.putRecords(records);
    return records
        .map(mapAchievementProgressRecordToDomain)
        .toList(growable: false);
  }
}
