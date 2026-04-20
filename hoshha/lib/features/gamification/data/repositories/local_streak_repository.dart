import '../../domain/streak.dart';
import '../../domain/streak_repository.dart';
import '../local/streak_mapper.dart';
import '../local/streaks_local_data_source.dart';

class LocalStreakRepository implements StreakRepository {
  LocalStreakRepository(this._localDataSource);

  final StreaksLocalDataSource _localDataSource;

  @override
  Future<Streak?> getStreak(StreakType type) async {
    final record = await _localDataSource.findByType(type.name);
    return record == null ? null : mapStreakRecordToDomain(record);
  }

  @override
  Future<Streak> saveStreak(Streak streak) async {
    final existing = await _localDataSource.findByType(streak.type.name);
    final record = mapStreakToRecord(streak, current: existing);
    await _localDataSource.putRecord(record);
    return mapStreakRecordToDomain(record);
  }
}
