import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/in_memory_progress_repository.dart';
import 'domain/progress_repository.dart';

final progressRepositoryProvider = Provider<ProgressRepository>(
  (ref) => InMemoryProgressRepository(),
  name: 'progressRepositoryProvider',
);
