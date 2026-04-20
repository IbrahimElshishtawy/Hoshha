import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_db/isar_db.dart';

import '../../../../infrastructure/database/database_providers.dart';
import 'achievement_progress_local_data_source.dart';
import 'achievement_progress_record.dart';
import 'streak_record.dart';
import 'streaks_local_data_source.dart';
import 'user_stats_local_data_source.dart';
import 'user_stats_record.dart';

final userStatsCollectionProvider = Provider<IsarCollection<int, UserStatsRecord>>(
  (ref) => ref.watch(isarProvider).userStatsRecords,
  name: 'userStatsCollectionProvider',
);

final streakCollectionProvider = Provider<IsarCollection<int, StreakRecord>>(
  (ref) => ref.watch(isarProvider).streakRecords,
  name: 'streakCollectionProvider',
);

final achievementProgressCollectionProvider =
    Provider<IsarCollection<int, AchievementProgressRecord>>(
      (ref) => ref.watch(isarProvider).achievementProgressRecords,
      name: 'achievementProgressCollectionProvider',
    );

final userStatsLocalDataSourceProvider = Provider<UserStatsLocalDataSource>(
  (ref) => UserStatsLocalDataSource(ref.watch(isarProvider)),
  name: 'userStatsLocalDataSourceProvider',
);

final streaksLocalDataSourceProvider = Provider<StreaksLocalDataSource>(
  (ref) => StreaksLocalDataSource(ref.watch(isarProvider)),
  name: 'streaksLocalDataSourceProvider',
);

final achievementProgressLocalDataSourceProvider =
    Provider<AchievementProgressLocalDataSource>(
      (ref) => AchievementProgressLocalDataSource(ref.watch(isarProvider)),
      name: 'achievementProgressLocalDataSourceProvider',
    );
