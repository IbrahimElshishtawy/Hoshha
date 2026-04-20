import '../../domain/achievement_progress.dart';
import 'achievement_progress_record.dart';

AchievementProgress mapAchievementProgressRecordToDomain(
  AchievementProgressRecord record,
) {
  return AchievementProgress(
    achievementId: AchievementId.values.byName(record.achievementId),
    progress: record.progress,
    isUnlocked: record.isUnlocked,
    createdAt: record.createdAt,
    updatedAt: record.updatedAt,
    unlockedAt: record.unlockedAt,
  );
}

AchievementProgressRecord mapAchievementProgressToRecord(
  AchievementProgress progress, {
  AchievementProgressRecord? current,
}) {
  final record = current ?? AchievementProgressRecord();
  record.achievementId = progress.achievementId.name;
  record.progress = progress.progress;
  record.isUnlocked = progress.isUnlocked;
  record.unlockedAt = progress.unlockedAt;
  record.createdAt = progress.createdAt;
  record.updatedAt = progress.updatedAt;
  return record;
}
