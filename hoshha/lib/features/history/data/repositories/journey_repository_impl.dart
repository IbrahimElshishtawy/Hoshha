import 'package:hoshha/core/errors/app_failure.dart';
import 'package:hoshha/core/result/result.dart';
import '../../domain/entities/journey_data.dart';
import '../../domain/entities/journey_milestone.dart';
import '../../domain/repositories/journey_repository.dart';
import '../datasources/journey_datasource.dart';

class JourneyRepositoryImpl implements JourneyRepository {
  const JourneyRepositoryImpl(this._dataSource);

  final JourneyDataSource _dataSource;

  @override
  Future<Result<JourneyData>> getJourneyData() async {
    try {
      final model = await _dataSource.getJourneyData();
      return Success(model);
    } catch (e) {
      return Failure(
        AppFailure(
          type: AppFailureType.unknown,
          message: 'Failed to load journey data',
          cause: e,
        ),
      );
    }
  }

  @override
  Future<Result<List<JourneyMilestone>>> getJourneyMilestones() async {
    try {
      final milestones = await _dataSource.getJourneyMilestones();
      return Success(milestones);
    } catch (e) {
      return Failure(
        AppFailure(
          type: AppFailureType.unknown,
          message: 'Failed to load journey milestones',
          cause: e,
        ),
      );
    }
  }
}
