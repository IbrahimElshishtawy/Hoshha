import '../../domain/user_stats.dart';
import '../../domain/user_stats_repository.dart';
import '../local/stats_local_data_source.dart';
import '../local/user_stats_mapper.dart';

class LocalUserStatsRepository implements UserStatsRepository {
  LocalUserStatsRepository(this._localDataSource);

  final StatsLocalDataSource _localDataSource;

  @override
  Future<UserStats?> getUserStats() async {
    final record = await _localDataSource.getStats();
    return record == null ? null : mapUserStatsRecordToDomain(record);
  }

  @override
  Stream<UserStats?> watchUserStats() {
    return _localDataSource.watchStats().map(
      (record) => record == null ? null : mapUserStatsRecordToDomain(record),
    );
  }

  @override
  Future<UserStats> saveUserStats(UserStats stats) async {
    final existing = await _localDataSource.getStats();
    final record = mapUserStatsToRecord(stats, current: existing);
    await _localDataSource.putRecord(record);
    return mapUserStatsRecordToDomain(record);
  }
}
