import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase implements UseCase<HomeData, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  Future<Result<HomeData, Failure>> call(NoParams params) {
    return repository.getHomeData();
  }
}
