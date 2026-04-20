import '../../../../core/time/month_key.dart';
import '../../domain/expense.dart';
import 'expense_record.dart';

Expense mapExpenseRecordToDomain(ExpenseRecord record) {
  return Expense(
    id: record.entityId,
    amountMinor: record.amountMinor,
    categoryId: record.categoryId,
    occurredAt: record.occurredAt,
    createdAt: record.createdAt,
    updatedAt: record.updatedAt,
    note: record.note,
  );
}

ExpenseRecord mapExpenseToRecord(Expense expense, {ExpenseRecord? current}) {
  final record = current ?? ExpenseRecord();
  record.entityId = expense.id;
  record.amountMinor = expense.amountMinor;
  record.categoryId = expense.categoryId;
  record.occurredAt = expense.occurredAt;
  record.monthKey = monthKeyFromDate(expense.occurredAt);
  record.note = expense.note;
  record.createdAt = expense.createdAt;
  record.updatedAt = expense.updatedAt;
  return record;
}
