import 'package:isar/isar.dart';

import 'streak_record.dart';

class StreaksLocalDataSource {
  StreaksLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, StreakRecord> get collection => _isar.streakRecords;

  Future<StreakRecord?> findByType(String type) {
    return collection.where().typeEqualTo(type).findFirstAsync();
  }

  Stream<StreakRecord?> watchByType(String type) {
    return collection.where().typeEqualTo(type).watch(
      fireImmediately: true,
    ).map((records) => records.isEmpty ? null : records.first);
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

  void clearInTransaction(Isar isar) {
    isar.streakRecords.clear();
  }
}
