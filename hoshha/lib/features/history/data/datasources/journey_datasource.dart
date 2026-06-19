import '../../domain/entities/journey_milestone.dart';
import '../models/journey_data_model.dart';

abstract interface class JourneyDataSource {
  Future<JourneyDataModel> getJourneyData();

  Future<List<JourneyMilestone>> getJourneyMilestones();
}
