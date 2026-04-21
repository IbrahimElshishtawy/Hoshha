import 'package:isar/isar.dart';

part 'streak_record.g.dart';

@collection
class StreakRecord {
  int id = 0;

  @Index(unique: true)
  late String type;

  late int currentCount;
  late int bestCount;
  DateTime? lastQualifiedAt;
  late DateTime createdAt;
  late DateTime updatedAt;
}
