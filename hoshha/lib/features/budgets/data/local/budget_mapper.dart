import '../../domain/budget.dart';
import 'budget_record.dart';

Budget mapBudgetRecordToDomain(BudgetRecord record) {
  return Budget(
    id: record.entityId,
    monthKey: record.monthKey,
    limitMinor: record.limitMinor,
    createdAt: record.createdAt,
    updatedAt: record.updatedAt,
  );
}

BudgetRecord mapBudgetToRecord(Budget budget, {BudgetRecord? current}) {
  final record = current ?? BudgetRecord();
  record.entityId = budget.id;
  record.monthKey = budget.monthKey;
  record.limitMinor = budget.limitMinor;
  record.createdAt = budget.createdAt;
  record.updatedAt = budget.updatedAt;
  return record;
}
