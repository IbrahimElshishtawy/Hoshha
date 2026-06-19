import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/journey_datasource.dart';
import '../../data/datasources/mock_journey_datasource.dart';
import '../../data/repositories/journey_repository_impl.dart';
import '../../domain/entities/journey_data.dart';
import '../../domain/entities/journey_milestone.dart';
import '../../domain/repositories/journey_repository.dart';

class JourneyState {
  const JourneyState({
    required this.journeyData,
    required this.milestones,
  });

  final JourneyData journeyData;
  final List<JourneyMilestone> milestones;
}

final journeyDataSourceProvider = Provider<JourneyDataSource>((ref) {
  return MockJourneyDataSource();
}, name: 'journeyDataSourceProvider');

final journeyRepositoryProvider = Provider<JourneyRepository>((ref) {
  final dataSource = ref.watch(journeyDataSourceProvider);
  return JourneyRepositoryImpl(dataSource);
}, name: 'journeyRepositoryProvider');

class JourneyController extends AsyncNotifier<JourneyState> {
  @override
  Future<JourneyState> build() async {
    final repository = ref.watch(journeyRepositoryProvider);

    final dataResult = await repository.getJourneyData();
    final milestonesResult = await repository.getJourneyMilestones();

    if (dataResult.isFailure) {
      throw Exception('Failed to load journey data');
    }
    if (milestonesResult.isFailure) {
      throw Exception('Failed to load milestones');
    }

    final data = (dataResult as dynamic).value as JourneyData;
    final milestones = (milestonesResult as dynamic).value as List<JourneyMilestone>;

    return JourneyState(
      journeyData: data,
      milestones: milestones,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

final journeyControllerProvider = AsyncNotifierProvider<JourneyController, JourneyState>(
  JourneyController.new,
  name: 'journeyControllerProvider',
);
