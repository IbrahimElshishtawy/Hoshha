import 'package:hoshha/core/result/result.dart';
import '../entities/home_dashboard_data.dart';
import '../repositories/home_repository.dart';

class GetHomeDashboardDataUseCase {
  const GetHomeDashboardDataUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<HomeDashboardData>> call() {
    return _repository.getDashboardData();
  }
}
