import 'package:isar_db/isar_db.dart';

import 'achievement_progress_record.dart';

class AchievementsLocalDataSource {
  AchievementsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, AchievementProgressRecord> get collection =>
      _isar.achievementProgressRecords;

  Future<AchievementProgressRecord?> findByAchievementId(String achievementId) {
    return collection
        .where()
        .achievementIdEqualTo(achievementId)
        .findFirstAsync();
  }

  Future<List<AchievementProgressRecord>> getAll() {
    return collection.where().findAllAsync();
  }

  Stream<List<AchievementProgressRecord>> watchAll() async* {
    yield await getAll();
    yield* collection.watch().asyncMap((_) => getAll());
  }

  Future<void> putRecord(AchievementProgressRecord record) async {
    await _isar.writeAsync((isar) {
      putRecordInTransaction(isar, record);
    });
  }

  Future<void> putRecords(List<AchievementProgressRecord> records) async {
    await _isar.writeAsync((isar) {
      for (final record in records) {
        putRecordInTransaction(isar, record);
      }
    });
  }

  void putRecordInTransaction(Isar isar, AchievementProgressRecord record) {
    if (record.id == 0) {
      record.id = isar.achievementProgressRecords.autoIncrement();
    }
    isar.achievementProgressRecords.put(record);
  }

  void clearInTransaction(Isar isar) {
    isar.achievementProgressRecords.clear();
  }
}
