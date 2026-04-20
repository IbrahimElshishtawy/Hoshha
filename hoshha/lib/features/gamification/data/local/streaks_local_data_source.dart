import 'package:isar_db/isar_db.dart';

import 'streak_record.dart';

class StreaksLocalDataSource {
  StreaksLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, StreakRecord> get collection => _isar.streakRecords;

  Future<StreakRecord?> findByType(String type) {
    return collection.where().typeEqualTo(type).findFirstAsync();
  }

  Future<void> putRecord(StreakRecord record) async {
    await _isar.writeAsync((isar) {
      putRecordInTransaction(isar, record);
    });
  }

  void putRecordInTransaction(Isar isar, StreakRecord record) {
    if (record.id == 0) {
      record.id = isar.streakRecords.autoIncrement();
    }
    isar.streakRecords.put(record);
  }
}
