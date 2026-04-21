import 'package:isar/isar.dart';

part 'expense_record.g.dart';

@collection
class ExpenseRecord {
  int id = 0;

  @Index(unique: true)
  late String entityId;

  @Index()
  late DateTime occurredAt;

  @Index()
  late String monthKey;

  @Index()
  late String categoryId;

  late int amountMinor;
  String? note;
  late DateTime createdAt;
  late DateTime updatedAt;
}
