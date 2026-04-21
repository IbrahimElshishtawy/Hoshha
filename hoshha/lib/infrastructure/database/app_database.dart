import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app_database_schemas.dart';

const _databaseName = 'hoshha';

Future<Isar> openAppDatabase() async {
  final directory = await getApplicationDocumentsDirectory();

  return Isar.openAsync(
    schemas: appDatabaseSchemas,
    directory: directory.path,
    name: _databaseName,
  );
}
