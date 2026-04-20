import '../../domain/streak.dart';
import 'streak_record.dart';

Streak mapStreakRecordToDomain(StreakRecord record) {
  return Streak(
    type: StreakType.values.byName(record.type),
    currentCount: record.currentCount,
    bestCount: record.bestCount,
    createdAt: record.createdAt,
    updatedAt: record.updatedAt,
    lastQualifiedAt: record.lastQualifiedAt,
  );
}

StreakRecord mapStreakToRecord(Streak streak, {StreakRecord? current}) {
  final record = current ?? StreakRecord();
  record.type = streak.type.name;
  record.currentCount = streak.currentCount;
  record.bestCount = streak.bestCount;
  record.lastQualifiedAt = streak.lastQualifiedAt;
  record.createdAt = streak.createdAt;
  record.updatedAt = streak.updatedAt;
  return record;
}
