import 'package:isar_db/isar_db.dart';

part 'budget_record.g.dart';

@collection
class BudgetRecord {
  int id = 0;

  @Index(unique: true)
  late String entityId;

  @Index(unique: true)
  late String monthKey;

  late int limitMinor;
  late DateTime createdAt;
  late DateTime updatedAt;
}
