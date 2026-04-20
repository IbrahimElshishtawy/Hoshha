import 'package:isar_db/isar_db.dart';

import '../../domain/user_stats.dart';
import 'user_stats_mapper.dart';
import 'user_stats_record.dart';

class UserStatsLocalDataSource {
  UserStatsLocalDataSource(this._isar);

  final Isar _isar;

  IsarCollection<int, UserStatsRecord> get collection => _isar.userStatsRecords;

  Future<void> put(UserStats stats) async {
    final existing = await collection.getAsync(0);
    final record = mapUserStatsToRecord(stats, current: existing);

    await _isar.writeAsync((isar) {
      isar.userStatsRecords.put(record);
    });
  }

  Future<UserStats?> get() async {
    final record = await collection.getAsync(0);
    return record == null ? null : mapUserStatsRecordToDomain(record);
  }
}
