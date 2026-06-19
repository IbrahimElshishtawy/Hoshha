import 'package:isar/isar.dart';

import '../../features/budgets/data/local/budget_record.dart';
import '../../features/expenses/data/local/expense_record.dart';
import '../../features/gamification/data/local/achievement_progress_record.dart';
import '../../features/gamification/data/local/streak_record.dart';
import '../../features/gamification/data/local/user_stats_record.dart';

final List<IsarGeneratedSchema> appDatabaseSchemas = [
  ExpenseRecordSchema,
  BudgetRecordSchema,
  UserStatsRecordSchema,
  StreakRecordSchema,
  AchievementProgressRecordSchema,
];
