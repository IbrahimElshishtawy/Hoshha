import 'package:isar_db/isar_db.dart';

import 'user_stats_record.dart';

class StatsLocalDataSource {
  StatsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, UserStatsRecord> get collection => _isar.userStatsRecords;

  Future<UserStatsRecord?> getStats() => collection.getAsync(0);

  Stream<UserStatsRecord?> watchStats() async* {
    yield await getStats();
    yield* collection.watchObject(0).asyncMap((_) => getStats());
  }

  Future<void> putRecord(UserStatsRecord record) async {
    await _isar.writeAsync((isar) {
      putRecordInTransaction(isar, record);
    });
  }

  void putRecordInTransaction(Isar isar, UserStatsRecord record) {
    record.id = 0;
    isar.userStatsRecords.put(record);
  }
}
