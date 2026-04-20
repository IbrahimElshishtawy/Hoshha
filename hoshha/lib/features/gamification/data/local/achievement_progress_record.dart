import 'package:isar_db/isar_db.dart';

part 'achievement_progress_record.g.dart';

@collection
class AchievementProgressRecord {
  int id = 0;

  @Index(unique: true)
  late String achievementId;

  late int progress;
  late bool isUnlocked;
  DateTime? unlockedAt;
  late DateTime createdAt;
  late DateTime updatedAt;
}
