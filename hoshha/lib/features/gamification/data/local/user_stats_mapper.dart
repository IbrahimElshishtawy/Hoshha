import '../../domain/user_stats.dart';
import 'user_stats_record.dart';

UserStats mapUserStatsRecordToDomain(UserStatsRecord record) {
  return UserStats(
    totalXp: record.totalXp,
    level: record.level,
    totalExpensesCount: record.totalExpensesCount,
    totalSpentMinor: record.totalSpentMinor,
    createdAt: record.createdAt,
    updatedAt: record.updatedAt,
    lastExpenseAt: record.lastExpenseAt,
  );
}

UserStatsRecord mapUserStatsToRecord(
  UserStats stats, {
  UserStatsRecord? current,
}) {
  final record = current ?? UserStatsRecord();
  record.totalXp = stats.totalXp;
  record.level = stats.level;
  record.totalExpensesCount = stats.totalExpensesCount;
  record.totalSpentMinor = stats.totalSpentMinor;
  record.lastExpenseAt = stats.lastExpenseAt;
  record.createdAt = stats.createdAt;
  record.updatedAt = stats.updatedAt;
  return record;
}
