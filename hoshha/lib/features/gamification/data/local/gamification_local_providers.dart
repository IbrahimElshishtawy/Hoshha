import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_db/isar_db.dart';

import '../../../../infrastructure/database/database_providers.dart';
import 'achievement_progress_record.dart';
import 'achievements_local_data_source.dart';
import 'stats_local_data_source.dart';
import 'streak_record.dart';
import 'streaks_local_data_source.dart';
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

final statsLocalDataSourceProvider = Provider<StatsLocalDataSource>(
  (ref) => StatsLocalDataSource(ref.watch(isarProvider)),
  name: 'statsLocalDataSourceProvider',
);

final streaksLocalDataSourceProvider = Provider<StreaksLocalDataSource>(
  (ref) => StreaksLocalDataSource(ref.watch(isarProvider)),
  name: 'streaksLocalDataSourceProvider',
);

final achievementsLocalDataSourceProvider =
    Provider<AchievementsLocalDataSource>(
      (ref) => AchievementsLocalDataSource(ref.watch(isarProvider)),
      name: 'achievementsLocalDataSourceProvider',
    );
