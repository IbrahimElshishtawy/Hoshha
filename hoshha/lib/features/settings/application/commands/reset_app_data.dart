import '../../../../core/errors/app_failure.dart';
import '../../../../core/result/result.dart';
import '../../data/local/reset_app_data_local_persister.dart';

class ResetAppData {
  ResetAppData(this._persister);

  final ResetAppDataLocalPersister _persister;

  Future<Result<void>> call() async {
    try {
      await _persister.clearAll();
      return const Success<void>(null);
    } catch (error) {
      return Failure(
        AppFailure(
          type: AppFailureType.storage,
          message: 'Failed to reset local app data.',
          cause: error,
        ),
      );
    }
  }
}
