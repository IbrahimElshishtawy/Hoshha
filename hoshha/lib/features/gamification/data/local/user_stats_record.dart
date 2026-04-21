import 'package:isar/isar.dart';

part 'user_stats_record.g.dart';

@collection
class UserStatsRecord {
  int id = 0;

  late int totalXp;
  late int level;
  late int totalExpensesCount;
  late int totalSpentMinor;
  DateTime? lastExpenseAt;
  late DateTime createdAt;
  late DateTime updatedAt;
}
