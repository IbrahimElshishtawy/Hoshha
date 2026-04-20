import 'package:isar_db/isar_db.dart';

import '../../domain/achievement_progress.dart';
import 'achievement_progress_mapper.dart';
import 'achievement_progress_record.dart';

class AchievementProgressLocalDataSource {
  AchievementProgressLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, AchievementProgressRecord> get collection =>
      _isar.achievementProgressRecords;

  Future<void> put(AchievementProgress progress) async {
    final existing = await collection
        .where()
        .achievementIdEqualTo(progress.achievementId.name)
        .findFirstAsync();
    final record = mapAchievementProgressToRecord(progress, current: existing);
    if (record.id == 0) {
      record.id = collection.autoIncrement();
    }

    await _isar.writeAsync((isar) {
      isar.achievementProgressRecords.put(record);
    });
  }

  Future<AchievementProgress?> getById(AchievementId achievementId) async {
    final record = await collection
        .where()
        .achievementIdEqualTo(achievementId.name)
        .findFirstAsync();
    return record == null ? null : mapAchievementProgressRecordToDomain(record);
  }

  Future<List<AchievementProgress>> listAll() async {
    final records = await collection.where().findAllAsync();
    return records
        .map(mapAchievementProgressRecordToDomain)
        .toList(growable: false);
  }
}
