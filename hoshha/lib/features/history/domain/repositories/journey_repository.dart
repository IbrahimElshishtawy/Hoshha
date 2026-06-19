import 'package:hoshha/core/result/result.dart';
import '../entities/journey_data.dart';
import '../entities/journey_milestone.dart';

abstract interface class JourneyRepository {
  Future<Result<JourneyData>> getJourneyData();

  Future<Result<List<JourneyMilestone>>> getJourneyMilestones();
}
