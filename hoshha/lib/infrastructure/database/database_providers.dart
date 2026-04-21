import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'app_database_writer.dart';

final isarProvider = Provider<Isar>(
  (ref) => throw UnimplementedError(
    'isarProvider must be overridden during bootstrap.',
  ),
  name: 'isarProvider',
);

final appDatabaseWriterProvider = Provider<AppDatabaseWriter>(
  (ref) => AppDatabaseWriter(ref.watch(isarProvider)),
  name: 'appDatabaseWriterProvider',
);
