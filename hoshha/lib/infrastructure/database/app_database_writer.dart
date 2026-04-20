import 'package:isar_db/isar_db.dart';

class AppDatabaseWriter {
  AppDatabaseWriter(this._isar);

  final Isar _isar;

  Future<T> write<T>(T Function(Isar isar) action) {
    return _isar.writeAsync(action);
  }
}
