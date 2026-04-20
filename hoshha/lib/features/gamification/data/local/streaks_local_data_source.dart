import 'package:isar_db/isar_db.dart';

import '../../domain/streak.dart';
import 'streak_mapper.dart';
import 'streak_record.dart';

class StreaksLocalDataSource {
  StreaksLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, StreakRecord> get collection => _isar.streakRecords;

  Future<void> put(Streak streak) async {
    final existing = await collection
        .where()
        .typeEqualTo(streak.type.name)
        .findFirstAsync();
    final record = mapStreakToRecord(streak, current: existing);
    if (record.id == 0) {
      record.id = collection.autoIncrement();
    }

    await _isar.writeAsync((isar) {
      isar.streakRecords.put(record);
    });
  }

  Future<Streak?> getByType(StreakType type) async {
    final record = await collection
        .where()
        .typeEqualTo(type.name)
        .findFirstAsync();
    return record == null ? null : mapStreakRecordToDomain(record);
  }
}
